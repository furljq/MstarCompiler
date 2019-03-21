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
            BaseNode baseNode = visit(programDeclarationContext);
            if (baseNode instanceof ClassDeclarationNode) classDeclarationNodes.add((ClassDeclarationNode) baseNode);
            if (baseNode instanceof FunctionDeclarationNode) functionDeclarationNodes.add((FunctionDeclarationNode) baseNode);
            if (baseNode instanceof VariableDeclarationStatementNode) variableDeclarationNodes.addAll(((VariableDeclarationStatementNode) baseNode).getVariableDeclarationNodes());
        }
        return new CompilationUnitNode(classDeclarationNodes, functionDeclarationNodes, variableDeclarationNodes, context.getStart());
    }

    @Override
    public BaseNode visitProgramDeclaration(MstarParser.ProgramDeclarationContext context) {
        if (context.classDeclaration() != null) return visit(context.classDeclaration());
        if (context.functionDeclaration() != null) return visit(context.functionDeclaration());
        if (context.variableDeclarationStatement() != null) return visit(context.variableDeclarationStatement());
        return null;
    }

    @Override
    public ClassDeclarationNode visitClassDeclaration(MstarParser.ClassDeclarationContext context) {
        String className = context.Identifier().getText();
        List<VariableDeclarationStatementNode> variableDeclarationStatementNodes = new ArrayList<>();
        List<FunctionDeclarationNode> functionDeclarationNodes = new ArrayList<>();
        for (MstarParser.ClassBodyDeclarationContext classBodyDeclarationContext : context.classBodyDeclaration()) {
            BaseNode classBodyNode = visit(classBodyDeclarationContext);
            if (classBodyNode instanceof VariableDeclarationStatementNode) variableDeclarationStatementNodes.add((VariableDeclarationStatementNode) classBodyNode);
            if (classBodyNode instanceof FunctionDeclarationNode) functionDeclarationNodes.add((FunctionDeclarationNode) classBodyNode);
        }
        return new ClassDeclarationNode(className, variableDeclarationStatementNodes, functionDeclarationNodes, context.start);
    }

    @Override
    public BaseNode visitClassBodyDeclaration(MstarParser.ClassBodyDeclarationContext context) {
        if (context.functionDeclaration() != null) return visit(context.functionDeclaration());
        if (context.variableDeclarationStatement() != null) return visit(context.variableDeclarationStatement());
        return null;
    }

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
        BlockStatementNode blockStatementNode = (BlockStatementNode) visit(context.blockStatement());
        return new FunctionDeclarationNode(typeNode, name, parameterNodes, blockStatementNode, context.getStart());
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
    public VariableDeclarationNode visitParameter(MstarParser.ParameterContext context) {
        BaseTypeNode typeNode = (BaseTypeNode) visit(context.type());
        String name = context.Identifier().getText();
        BaseExpressionNode expressionNode;
        if (context.expression() != null) expressionNode = (BaseExpressionNode) visit(context.expression());
        else expressionNode = null;
        return new VariableDeclarationNode(typeNode, name, expressionNode, context.start);
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
        if (context.Op.getText().equals("(")) {
            BaseExpressionNode functionNode = (BaseExpressionNode) visit(context.expression(0));
            List<BaseExpressionNode> arguments = new ArrayList<>();
            for (MstarParser.ExpressionContext expressionContext : context.expressions().expression()) {
                BaseExpressionNode argument = (BaseExpressionNode) visit(expressionContext);
                arguments.add(argument);
            }
            return new FunctionExpressionNode(functionNode, arguments, context.start);
        }
        if (context.Op.getText().equals("++")) {
            OperatorList operator;
            if (context.getChild(1).getText().equals("++")) operator = OperatorList.SUFFIXINC;
            else operator = OperatorList.PREFIXINC;
            BaseExpressionNode expressionNode = (BaseExpressionNode) visit(context.expression(0));
            return new UnaryExpressionNode(operator, expressionNode, context.start);
        }
        if (context.Op.getText().equals("--")) {
            OperatorList operator;
            if (context.getChild(1).getText().equals("--")) operator = OperatorList.SUFFIXDEC;
            else operator = OperatorList.PREFIXDEC;
            BaseExpressionNode expressionNode = (BaseExpressionNode) visit(context.expression(0));
            return new UnaryExpressionNode(operator, expressionNode, context.start);
        }
        if (context.Op.getText().equals("+"))
            if (context.getChildCount() == 2) {
                BaseExpressionNode expressionNode = (BaseExpressionNode) visit(context.expression(0));
                return new UnaryExpressionNode(OperatorList.POS, expressionNode, context.start);
            }
        if (context.Op.getText().equals("-"))
            if (context.getChildCount() == 2) {
                BaseExpressionNode expressionNode = (BaseExpressionNode) visit(context.expression(0));
                return new UnaryExpressionNode(OperatorList.NEG, expressionNode, context.start);
            }
        if (context.Op.getText().equals("~")) {
            BaseExpressionNode expressionNode = (BaseExpressionNode) visit(context.expression(0));
            return new UnaryExpressionNode(OperatorList.NOT, expressionNode, context.start);
        }
        if (context.Op.getText().equals("!")) {
            BaseExpressionNode expressionNode = (BaseExpressionNode) visit(context.expression(0));
            return new UnaryExpressionNode(OperatorList.LOGICALNOT, expressionNode, context.start);
        }
        BaseExpressionNode leftExpressionNode = (BaseExpressionNode) visit(context.expression(0));
        BaseExpressionNode rightExpressionNode = (BaseExpressionNode) visit(context.expression(1));
        if (context.Op.getText().equals("+")) return new BinaryExpressionNode(OperatorList.ADD, leftExpressionNode, rightExpressionNode, context.start);
        if (context.Op.getText().equals("-")) return new BinaryExpressionNode(OperatorList.SUB, leftExpressionNode, rightExpressionNode, context.start);
        if (context.Op.getText().equals("*")) return new BinaryExpressionNode(OperatorList.MUL, leftExpressionNode, rightExpressionNode, context.start);
        if (context.Op.getText().equals("/")) return new BinaryExpressionNode(OperatorList.DIV, leftExpressionNode, rightExpressionNode, context.start);
        if (context.Op.getText().equals("%")) return new BinaryExpressionNode(OperatorList.MOD, leftExpressionNode, rightExpressionNode, context.start);
        if (context.Op.getText().equals("<<")) return new BinaryExpressionNode(OperatorList.LEFTSHIFT, leftExpressionNode, rightExpressionNode, context.start);
        if (context.Op.getText().equals(">>")) return new BinaryExpressionNode(OperatorList.RIGHTSHIFT, leftExpressionNode, rightExpressionNode, context.start);
        if (context.Op.getText().equals("<=")) return new BinaryExpressionNode(OperatorList.LEQ, leftExpressionNode, rightExpressionNode, context.start);
        if (context.Op.getText().equals(">=")) return new BinaryExpressionNode(OperatorList.GEQ, leftExpressionNode, rightExpressionNode, context.start);
        if (context.Op.getText().equals("<")) return new BinaryExpressionNode(OperatorList.LT, leftExpressionNode, rightExpressionNode, context.start);
        if (context.Op.getText().equals(">")) return new BinaryExpressionNode(OperatorList.GT, leftExpressionNode, rightExpressionNode, context.start);
        if (context.Op.getText().equals("==")) return new BinaryExpressionNode(OperatorList.EQUAL, leftExpressionNode, rightExpressionNode, context.start);
        if (context.Op.getText().equals("!=")) return new BinaryExpressionNode(OperatorList.NOTEQUAL, leftExpressionNode, rightExpressionNode, context.start);
        if (context.Op.getText().equals("&")) return new BinaryExpressionNode(OperatorList.AND, leftExpressionNode, rightExpressionNode, context.start);
        if (context.Op.getText().equals("^")) return new BinaryExpressionNode(OperatorList.XOR, leftExpressionNode, rightExpressionNode, context.start);
        if (context.Op.getText().equals("|")) return new BinaryExpressionNode(OperatorList.OR, leftExpressionNode, rightExpressionNode, context.start);
        if (context.Op.getText().equals("&&")) return new BinaryExpressionNode(OperatorList.LOGICALAND, leftExpressionNode, rightExpressionNode, context.start);
        if (context.Op.getText().equals("||")) return new BinaryExpressionNode(OperatorList.LOGICALOR, leftExpressionNode, rightExpressionNode, context.start);
        if (context.Op.getText().equals("=")) return new BinaryExpressionNode(OperatorList.ASSIGN, leftExpressionNode, rightExpressionNode, context.start);
        return null;
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
        int restDimension;
        if (context.arrayCreator() != null) {
            for (MstarParser.ExpressionContext expressionContext : context.arrayCreator().expression()) {
                BaseExpressionNode expressionNode = (BaseExpressionNode) visit(expressionContext);
                fixedDimension.add(expressionNode);
            }
            restDimension = context.arrayCreator().empty().size();
        } else restDimension = 0;
        return new CreatorExpressionNode(typeNode, fixedDimension, restDimension, context.start);
    }

    @Override
    public BlockStatementNode visitBlockStatement(MstarParser.BlockStatementContext context) {
        List<BaseStatementNode> statementNodes = new ArrayList<>();
        for (MstarParser.StatementContext statementContext : context.statement()) {
            BaseStatementNode statementNode = (BaseStatementNode) visit(statementContext);
            statementNodes.add(statementNode);
        }
        return new BlockStatementNode(statementNodes, context.start);
    }

    @Override
    public BaseStatementNode visitStatement(MstarParser.StatementContext context) {
        if (context.blockStatement() != null) return (BlockStatementNode) visit(context.blockStatement());
        if (context.variableDeclarationStatement() != null) return (VariableDeclarationStatementNode) visit(context.variableDeclarationStatement());
        if (context.Op.getText().equals("if")) {
            BaseExpressionNode conditionExpressionNode = (BaseExpressionNode) visit(context.expression(0));
            BaseStatementNode thenStatementNode = (BaseStatementNode) visit(context.statement(0));
            BaseStatementNode elseStatementNode;
            if (context.statement().size() > 1) elseStatementNode = (BaseStatementNode) visit(context.statement(1));
            else elseStatementNode = null;
            return new IfStatementNode(conditionExpressionNode, thenStatementNode, elseStatementNode, context.start);
        }
        if (context.Op.getText().equals("for")) {
            BaseExpressionNode initExpressionNode;
            if (context.initExpression != null) initExpressionNode = (BaseExpressionNode) visit(context.expression(0));
            else initExpressionNode = null;
            BaseExpressionNode conditionExpressionNode;
            if (context.conditionExpression != null) conditionExpressionNode = (BaseExpressionNode) visit(context.expression(1));
            else conditionExpressionNode = null;
            BaseExpressionNode updateExpressionNode;
            if (context.updateExpression != null) updateExpressionNode = (BaseExpressionNode) visit(context.expression(2));
            else updateExpressionNode = null;
            BaseStatementNode bodyStatementNode = (BaseStatementNode) visit(context.statement(0));
            return new LoopStatementNode(initExpressionNode, conditionExpressionNode, updateExpressionNode, bodyStatementNode, context.start);
        }
        if (context.Op.getText().equals("while")) {
            BaseExpressionNode conditionExpressionNode = (BaseExpressionNode) visit(context.expression(0));
            BaseStatementNode bodyStatementNode = (BaseStatementNode) visit(context.statement(0));
            return new LoopStatementNode(null, conditionExpressionNode, null, bodyStatementNode, context.start);
        }
        if (context.Op.getText().equals("return")) {
            if (context.expression() != null) return new ReturnStatementNode((BaseExpressionNode) visit(context.expression(0)), context.start);
            else return new ReturnStatementNode(null, context.start);
        }
        if (context.Op.getText().equals("break")) return new BreakStatementNode(context.start);
        if (context.Op.getText().equals("continue")) return new ContinueStatementNode(context.start);
        if (context.Op.getText().equals(";")) return new ExpressionStatementNode((BaseExpressionNode) visit(context.expression(0)), context.start);
        return null;
    }

    @Override
    public VariableDeclarationStatementNode visitVariableDeclarationStatement(MstarParser.VariableDeclarationStatementContext context) {
        BaseTypeNode typeNode = (BaseTypeNode) visit(context.type());
        List<VariableDeclarationNode> variableDeclarationNodes = new ArrayList<>();
        for (MstarParser.VariableDeclarationContext variableDeclarationContext : context.variableDeclarations().variableDeclaration()) {
            String name = variableDeclarationContext.Identifier().getText();
            BaseExpressionNode initExpression;
            if (variableDeclarationContext.expression() != null) initExpression = (BaseExpressionNode) visit(variableDeclarationContext.expression());
            else initExpression = null;
            VariableDeclarationNode variableDeclarationNode = new VariableDeclarationNode(typeNode, name, initExpression, context.start);
            variableDeclarationNodes.add(variableDeclarationNode);
        }
        return new VariableDeclarationStatementNode(variableDeclarationNodes, context.start);
    }

}
