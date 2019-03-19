package com.fur.ast;

import com.fur.antlr.MstarBaseVisitor;
import com.fur.antlr.MstarParser;
import com.fur.ast.enumerate.OperatorList;
import com.fur.ast.node.*;
import com.fur.ast.type.ArrayType;
import com.fur.ast.type.BaseType;
import com.fur.ast.enumerate.TypeList;

import java.util.ArrayList;
import java.util.List;

public class ASTBuilderVisitor extends MstarBaseVisitor<BaseNode> {

    @Override
    public CompilationUnitNode visitCompilationUnit(MstarParser.CompilationUnitContext context) {
        List<ClassDeclarationNode> classDeclarationNodes = new ArrayList<>();
        List<FunctionDeclarationNode> functionDeclarationNodes = new ArrayList<>();
        List<VariableDeclarationNode> variableDeclarationNodes = new ArrayList<>();
        for (MstarParser.ProgramDeclarationContext programDeclarationContext : context.programDeclaration()) {
            DeclarationNode declarationNode = (DeclarationNode) visit(programDeclarationContext);//TODO
            if (declarationNode instanceof ClassDeclarationNode) classDeclarationNodes.add((ClassDeclarationNode) declarationNode);
            if (declarationNode instanceof FunctionDeclarationNode) functionDeclarationNodes.add((FunctionDeclarationNode) declarationNode);
            if (declarationNode instanceof VariableDeclarationNode) variableDeclarationNodes.add((VariableDeclarationNode) declarationNode);
        }
        return new CompilationUnitNode(classDeclarationNodes, functionDeclarationNodes, variableDeclarationNodes, context.getStart());
    }

    @Override
    public DeclarationNode visitProgramDeclaration(MstarParser.ProgramDeclarationContext context) {
        if (context.classDeclaration() != null) return (DeclarationNode) visit(context.classDeclaration());//TODO
        if (context.functionDeclaration() != null) return (FunctionDeclarationNode) visit(context.functionDeclaration());//TODO
        if (context.variableDeclarationStatement() != null) return (VariableDeclarationNode) visit(context.variableDeclarationStatement());//TODO
        return null;
    }

    @Override
    public ClassDeclarationNode visitClassDeclaration(MstarParser.ClassDeclarationContext context) {
        String className = context.Identifier().getText();
        List<VariableDeclarationNode> variableDeclarationNodes = new ArrayList<>();
        List<FunctionDeclarationNode> functionDeclarationNodes = new ArrayList<>();
        for (MstarParser.ClassBodyDeclarationContext classBodyDeclarationContext : context.classBodyDeclaration()) {
            DeclarationNode declarationNode = (DeclarationNode) visit(classBodyDeclarationContext);
            if (declarationNode instanceof VariableDeclarationNode) variableDeclarationNodes.add((VariableDeclarationNode) declarationNode);
            if (declarationNode instanceof FunctionDeclarationNode) functionDeclarationNodes.add((FunctionDeclarationNode) declarationNode);
        }
        return new ClassDeclarationNode(className, variableDeclarationNodes, functionDeclarationNodes, context.start);
    }//TODO

    @Override
    public FunctionDeclarationNode visitFunctionDeclaration(MstarParser.FunctionDeclarationContext context) {
        TypeNode typeNode;
        if (context.type() != null) typeNode = (TypeNode) visit(context.type());
        else typeNode = null;
        String name = context.Identifier().getText();
        List<VariableDeclarationNode> parameterNodes = new ArrayList<>();
        if (context.parameters() != null) {
            for (MstarParser.ParameterContext parameterContext : context.parameters().parameter()) {
                VariableDeclarationNode parameterNode = (VariableDeclarationNode) visit(parameterContext);
                parameterNodes.add(parameterNode);
            }
        }
        BlockNode blockNode = (BlockNode) visit(context.block());//TODO
        return new FunctionDeclarationNode(typeNode, name, parameterNodes, blockNode, context.getStart());
    }

    @Override
    public VariableDeclarationNode visitParameter(MstarParser.ParameterContext context) {
        TypeNode typeNode = (TypeNode) visit(context.type());
        String name = context.Identifier().getText();
        ExpressionNode expressionNode;
        if (context.expression() != null) expressionNode = (ExpressionNode) visit(context.expression());
        else expressionNode = null;
        return new VariableDeclarationNode(typeNode, name, expressionNode, context.start);
    }

    @Override
    public TypeNode visitType(MstarParser.TypeContext context) {
        if (context.Op != null) {
            TypeNode baseTypeNode = (TypeNode) visit(context.type());
            ArrayType arrayType = new ArrayType(baseTypeNode.getType());
            return new TypeNode(arrayType, context.start);
        } else {
            return (TypeNode) visit(context.nonArrayType());
        }
    }

    @Override
    public TypeNode visitNonArrayType(MstarParser.NonArrayTypeContext context) {
        if (context.primitiveType() != null) return (TypeNode) visit(context.primitiveType());
        if (context.classType() != null) return (TypeNode) visit(context.classType());
        return null;
    }

    @Override
    public TypeNode visitPrimitiveType(MstarParser.PrimitiveTypeContext context) {
        if (context.getText().equals("bool")) return new TypeNode(new BaseType(TypeList.BOOL), context.start);
        if (context.getText().equals("int")) return new TypeNode(new BaseType(TypeList.INT), context.start);
        if (context.getText().equals("string")) return new TypeNode(new BaseType(TypeList.STRING), context.start);
        if (context.getText().equals("void")) return new TypeNode(new BaseType(TypeList.VOID), context.start);
        return null;
    }

    @Override
    public TypeNode visitClassType(MstarParser.ClassTypeContext context) {
        String typeName = context.Identifier().getText();
        return new TypeNode(new BaseType(TypeList.CLASS), context.start);
    }

    @Override
    public PrimaryExpressionNode visitExpression(MstarParser.ExpressionContext context) {
        if (context.primaryExpression() != null) return (PrimaryExpressionNode) visit(context.primaryExpression());
        if (context.creator() != null) return (PrimaryExpressionNode) visit(context.creator());//TODO
        List<ExpressionNode> expressionNodes = new ArrayList<>();
        for (MstarParser.ExpressionContext expressionContext : context.expression()) {
            ExpressionNode expressionNode = (ExpressionNode) visit(expressionContext);
            expressionNodes.add(expressionNode);
        }
        OperatorList operator = OperatorList.UNKNOWN;
        if (context.Op.getText().equals(".")) operator = OperatorList.Dot;
        if (context.Op.getText().equals("[")) operator = OperatorList.BRACKET;
        if (context.Op.getText().equals("(")) operator = OperatorList.PARANTHESIS;
        if (context.Op.getText().equals("++"))
            if (context.getChild(1).getText().equals("++")) operator = OperatorList.SUFFIXINC;
            else operator = OperatorList.PREFIXINC;
        if (context.Op.getText().equals("--"))
            if (context.getChild(1).getText().equals("--")) operator = OperatorList.SUFFIXDEC;
            else operator = OperatorList.PREFIXDEC;
        if (context.Op.getText().equals("+"))
            if (context.getChildCount() == 2) operator = OperatorList.POS;
            else operator = OperatorList.ADD;
        if (context.Op.getText().equals("-"))
            if (context.getChildCount() == 2) operator = OperatorList.NEG;
            else operator = OperatorList.SUB;
        if (context.Op.getText().equals("~")) operator = OperatorList.NOT;
        if (context.Op.getText().equals("!")) operator = OperatorList.LOGICALNOT;
        if (context.Op.getText().equals("*")) operator = OperatorList.MUL;
        if (context.Op.getText().equals("/")) operator = OperatorList.DIV;
        if (context.Op.getText().equals("%")) operator = OperatorList.MOD;
        if (context.Op.getText().equals("<<")) operator = OperatorList.LEFTSHIFT;
        if (context.Op.getText().equals(">>")) operator = OperatorList.RIGHTSHIFT;
        if (context.Op.getText().equals("<=")) operator = OperatorList.LEQ;
        if (context.Op.getText().equals(">=")) operator = OperatorList.GEQ;
        if (context.Op.getText().equals("<")) operator = OperatorList.LT;
        if (context.Op.getText().equals(">")) operator = OperatorList.GT;
        if (context.Op.getText().equals("==")) operator = OperatorList.EQUAL;
        if (context.Op.getText().equals("!=")) operator = OperatorList.NOTEQUAL;
        if (context.Op.getText().equals("&")) operator = OperatorList.AND;
        if (context.Op.getText().equals("^")) operator = OperatorList.XOR;
        if (context.Op.getText().equals("|")) operator = OperatorList.OR;
        if (context.Op.getText().equals("&&")) operator = OperatorList.LOGICALAND;
        if (context.Op.getText().equals("||")) operator = OperatorList.LOGICALOR;
        if (context.Op.getText().equals("=")) operator = OperatorList.ASSIGN;
        return new ExpressionNode(expressionNodes.get(0).getType(), expressionNodes, operator, context.start);
    }

    @Override
    public PrimaryExpressionNode visitPrimaryExpression(MstarParser.PrimaryExpressionContext context) {
        if (context.expression() != null) return (PrimaryExpressionNode) visit(context.expression());
        if (context.getText().equals("this")) return new PrimaryExpressionNode(TypeList.CLASS, context.start);
        if (context.Identifier() != null) return new PrimaryExpressionNode(TypeList.UNKNOWN, context.start);
        if (context.literalExpression() != null) return (PrimaryExpressionNode) visit(context.literalExpression());
        return null;
    }

    @Override
    public PrimaryExpressionNode visitLiteralExpression(MstarParser.LiteralExpressionContext context) {
        if (context.Boolean() != null) return new PrimaryExpressionNode(TypeList.BOOL, context.start);
        if (context.Integer() != null) return new PrimaryExpressionNode(TypeList.INT, context.start);
        if (context.String() != null) return new PrimaryExpressionNode(TypeList.STRING, context.start);
        if (context.Null() != null) return new PrimaryExpressionNode(TypeList.NULL, context.start);
        return null;
    }

    @Override
    public BaseNode visitCreator(MstarParser.CreatorContext ctx) {
        return super.visitCreator(ctx);
    }

    @Override
    public BaseNode visitBlock(MstarParser.BlockContext ctx) {
        return super.visitBlock(ctx);
    }
}
