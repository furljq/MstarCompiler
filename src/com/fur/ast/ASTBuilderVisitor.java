package com.fur.ast;

import com.fur.antlr.MstarBaseVisitor;
import com.fur.antlr.MstarParser;
import com.fur.ast.enumerate.OperatorList;
import com.fur.ast.enumerate.PrimaryTypeList;
import com.fur.ast.node.*;

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
        BaseTypeNode typeNode;
        if (context.type() != null) typeNode = (BaseTypeNode) visit(context.type());
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
        BaseTypeNode typeNode = (BaseTypeNode) visit(context.type());
        String name = context.Identifier().getText();
        BaseExpressionNode expressionNode;
        if (context.expression() != null) expressionNode = (BaseExpressionNode) visit(context.expression());
        else expressionNode = null;
        return new VariableDeclarationNode(typeNode, name, expressionNode, context.start);
    }

    @Override
    public BaseTypeNode visitType(MstarParser.TypeContext context) {
        if (context.Op != null) {
            BaseTypeNode baseTypeNode = (BaseTypeNode) visit(context.type());
            return new ArrayTypeNode(baseTypeNode, context.start);
        } else {
            return (BaseTypeNode) visit(context.nonArrayType());
        }
    }

    @Override
    public BaseTypeNode visitNonArrayType(MstarParser.NonArrayTypeContext context) {
        if (context.primitiveType() != null) return (PrimaryTypeNode) visit(context.primitiveType());
        if (context.classType() != null) return (ClassTypeNode) visit(context.classType());
        return null;
    }

    @Override
    public PrimaryTypeNode visitPrimitiveType(MstarParser.PrimitiveTypeContext context) {
        if (context.getText().equals("bool")) return new PrimaryTypeNode(PrimaryTypeList.BOOL, context.start);
        if (context.getText().equals("int")) return new PrimaryTypeNode(PrimaryTypeList.INT, context.start);
        if (context.getText().equals("string")) return new PrimaryTypeNode(PrimaryTypeList.STRING, context.start);
        if (context.getText().equals("void")) return new PrimaryTypeNode(PrimaryTypeList.VOID, context.start);
        return null;
    }

    @Override
    public ClassTypeNode visitClassType(MstarParser.ClassTypeContext context) {
        String className = context.Identifier().getText();
        return new ClassTypeNode(className, context.start);
    }

    @Override
    public BaseExpressionNode visitExpression(MstarParser.ExpressionContext context) {
        if (context.primaryExpression() != null) return (BaseExpressionNode) visit(context.primaryExpression());
        if (context.creator() != null) return (CreatorExpressionNode) visit(context.creator());
        if (context.Op.getText().equals(".")) {
            BaseExpressionNode objectExpressionNode = (BaseExpressionNode) visit(context.expression(0));
            IdentifierExpressionNode identifierExpressionNode = new IdentifierExpressionNode(context.Identifier().getText(), context.start);
            return new DotExpressionNode(objectExpressionNode, identifierExpressionNode, context.start);
        }
        if (context.Op.getText().equals("[")) {
            BaseExpressionNode address = (BaseExpressionNode) visit(context.expression(0));
            BaseExpressionNode index = (BaseExpressionNode) visit(context.expression(1));
            return new ArrayExpression(address, index, context.start);
        }
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
    public BaseExpressionNode visitPrimaryExpression(MstarParser.PrimaryExpressionContext context) {
        if (context.expression() != null) return (BaseExpressionNode) visit(context.expression());
        if (context.getText().equals("this") || context.Identifier() != null) return new IdentifierExpressionNode(context.getText(), context.start);
        if (context.literalExpression() != null) return (LiteralExpressionNode) visit(context.literalExpression());
        return null;
    }

    @Override
    public LiteralExpressionNode visitLiteralExpression(MstarParser.LiteralExpressionContext context) {
        if (context.Boolean() != null) return new LiteralExpressionNode(PrimaryTypeList.BOOL, context.getText(), context.start);
        if (context.Integer() != null) return new LiteralExpressionNode(PrimaryTypeList.INT, context.getText(), context.start);
        if (context.String() != null) return new LiteralExpressionNode(PrimaryTypeList.STRING, context.getText(), context.start);
        if (context.Null() != null) return new LiteralExpressionNode(PrimaryTypeList.NULL, context.getText(), context.start);
        return null;
    }

    @Override
    public CreatorExpressionNode visitCreator(MstarParser.CreatorContext context) {
        BaseTypeNode typeNode = (BaseTypeNode) visit(context.nonArrayType());
        List<BaseExpressionNode> fixedDimension = new ArrayList<>();
        int restDimension = 0;
        if (context.arrayCreator() != null) {
            for (MstarParser.ExpressionContext expressionContext : context.arrayCreator().expression()) {
                BaseExpressionNode expressionNode = (BaseExpressionNode) visit(expressionContext);
                fixedDimension.add(expressionNode);
            }
            restDimension = context.arrayCreator().empty().size();
        }
        return new CreatorExpressionNode(typeNode, fixedDimension, restDimension, context.start);
    }
}
