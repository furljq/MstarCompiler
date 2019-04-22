package com.fur.abstractSyntaxTree;

import com.fur.abstractSyntaxTree.node.*;
import com.fur.antlrParseTree.MstarBaseVisitor;
import com.fur.antlrParseTree.MstarParser;
import com.fur.enumerate.OperatorList;
import com.fur.enumerate.PrimaryTypeList;
import com.fur.type.ArrayType;
import com.fur.type.BaseType;
import com.fur.type.ClassType;
import com.fur.type.PrimaryType;

import java.util.ArrayList;
import java.util.List;

public class AbstractSyntaxTreeBuilder extends MstarBaseVisitor<BaseNode> {

    @Override
    public CompilationUnitNode visitCompilationUnit(MstarParser.CompilationUnitContext context) {
        List<BaseNode> baseNodes = new ArrayList<>();
        for (MstarParser.ProgramDeclarationContext programDeclarationContext : context.programDeclaration()) {
            if (programDeclarationContext.classDeclaration() != null) baseNodes.add(visit(programDeclarationContext.classDeclaration()));
            if (programDeclarationContext.functionDeclaration() != null) {
                FunctionDeclarationNode functionDeclarationNode = (FunctionDeclarationNode) visit(programDeclarationContext.functionDeclaration());
                if (functionDeclarationNode.getTypeNode() == null) throw new Error();
                baseNodes.add(functionDeclarationNode);
            }
            if (programDeclarationContext.variableDeclarationStatement() != null) baseNodes.addAll(spiltVariableDeclarationStatementNode(programDeclarationContext.variableDeclarationStatement()));
        }
        return new CompilationUnitNode(baseNodes, context.getStart());
    }

    private List<BaseNode> spiltVariableDeclarationStatementNode(MstarParser.VariableDeclarationStatementContext context) {
        List<BaseNode> baseNodes = new ArrayList<>();
        TypeNode typeNode = (TypeNode) visit(context.type());
        for (MstarParser.VariableDeclarationContext variableDeclarationContext : context.variableDeclarations().variableDeclaration())
            baseNodes.addAll(spiltVariableDeclarationNode(variableDeclarationContext, typeNode));
        return baseNodes;
    }

    private List<BaseNode> spiltVariableDeclarationNode(MstarParser.VariableDeclarationContext context, TypeNode typeNode) {
        List<BaseNode> baseNodes = new ArrayList<>();
        String name = context.Identifier().getText();
        VariableDeclarationNode variableDeclarationNode = new VariableDeclarationNode(typeNode, name, context.start);
        baseNodes.add(variableDeclarationNode);
        if (context.expression() != null) {
            IdentifierExpressionNode identifierNode = new IdentifierExpressionNode(name, context.start);
            BaseExpressionNode initExpression = (BaseExpressionNode) visit(context.expression());
            checkInitExpression(context.expression(), name);
            BinaryExpressionNode assignExpressionNode = new BinaryExpressionNode(OperatorList.ASSIGN, identifierNode, initExpression, initExpression.getPosition());
            ExpressionStatementNode assignStatementNode = new ExpressionStatementNode(assignExpressionNode, assignExpressionNode.getPosition());
            baseNodes.add(assignStatementNode);
        }
        return baseNodes;
    }

    private void checkInitExpression(MstarParser.ExpressionContext expressionContext, String forbid) {
        if (expressionContext.primaryExpression() != null) {
            if (expressionContext.primaryExpression().Identifier() != null)
                if (expressionContext.primaryExpression().Identifier().getText().equals(forbid)) throw new Error();
            if (expressionContext.primaryExpression().expression() != null)
                checkInitExpression(expressionContext.primaryExpression().expression(), forbid);
        }
        if (expressionContext.expressions() != null)
            for (MstarParser.ExpressionContext subExpressionContext : expressionContext.expressions().expression())
                checkInitExpression(subExpressionContext, forbid);
        for (MstarParser.ExpressionContext subExpressionContext : expressionContext.expression())
            checkInitExpression(subExpressionContext, forbid);
    }

    @Override
    public ClassDeclarationNode visitClassDeclaration(MstarParser.ClassDeclarationContext context) {
        String className = context.Identifier().getText();
        List<BaseNode> variableDeclarationNodes = new ArrayList<>();
        List<FunctionDeclarationNode> functionDeclarationNodes = new ArrayList<>();
        for (MstarParser.ClassBodyDeclarationContext classBodyDeclarationContext : context.classBodyDeclaration()) {
            if (classBodyDeclarationContext.variableDeclarationStatement() != null) variableDeclarationNodes.addAll(spiltVariableDeclarationStatementNode(classBodyDeclarationContext.variableDeclarationStatement()));
            if (classBodyDeclarationContext.functionDeclaration() != null) {
                FunctionDeclarationNode functionDeclarationNode = (FunctionDeclarationNode) visit(classBodyDeclarationContext.functionDeclaration());
                functionDeclarationNode.setClassName(className);
                functionDeclarationNodes.add(functionDeclarationNode);
            }
        }
        return new ClassDeclarationNode(className, variableDeclarationNodes, functionDeclarationNodes, context.start);
    }

    @Override
    public FunctionDeclarationNode visitFunctionDeclaration(MstarParser.FunctionDeclarationContext context) {
        TypeNode typeNode;
        if (context.type() != null) typeNode = (TypeNode) visit(context.type());
        else typeNode = null;
        String name = context.Identifier().getText();
        List<VariableDeclarationNode> baseNodes = new ArrayList<>();
        if (context.parameters() != null) {
            for (MstarParser.ParameterContext parameterContext : context.parameters().parameter()) {
                TypeNode parameterTypeNode = (TypeNode) visit(parameterContext.type());
                baseNodes.add((VariableDeclarationNode) spiltVariableDeclarationNode(parameterContext.variableDeclaration(), parameterTypeNode).get(0));
            }
        }
        BlockStatementNode blockStatementNode = (BlockStatementNode) visit(context.blockStatement());
        return new FunctionDeclarationNode(typeNode, name, baseNodes, blockStatementNode, context.getStart());
    }

    @Override
    public TypeNode visitType(MstarParser.TypeContext context) {
        BaseType type = getType(context);
        return new TypeNode(type, context.start);
    }

    private BaseType getType(MstarParser.TypeContext context) {
        if (context.type() != null) return new ArrayType(getType(context.type()));
        if (context.nonArrayType() != null) return getNonArrayType(context.nonArrayType());
        return null;
    }

    private BaseType getNonArrayType(MstarParser.NonArrayTypeContext context) {
        if (context.primitiveType() != null) {
            MstarParser.PrimitiveTypeContext primitiveTypeContext = context.primitiveType();
            if (primitiveTypeContext.getText().equals("bool")) return new PrimaryType(PrimaryTypeList.BOOL);
            if (primitiveTypeContext.getText().equals("int")) return new PrimaryType(PrimaryTypeList.INT);
            if (primitiveTypeContext.getText().equals("string")) return new ClassType("string");
            if (primitiveTypeContext.getText().equals("void")) return new PrimaryType(PrimaryTypeList.VOID);
            return null;
        }
        if (context.classType() != null) return new ClassType(context.getText());
        return null;
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
            return new ArrayExpressionNode(address, index, context.start);
        }
        if (context.Op.getText().equals("(")) {
            BaseExpressionNode functionNode = (BaseExpressionNode) visit(context.expression(0));
            List<BaseExpressionNode> arguments = new ArrayList<>();
            if (context.expressions() != null) {
                for (MstarParser.ExpressionContext expressionContext : context.expressions().expression()) {
                    BaseExpressionNode argument = (BaseExpressionNode) visit(expressionContext);
                    arguments.add(argument);
                }
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
        if (context.Boolean() != null) return new LiteralExpressionNode(new PrimaryType(PrimaryTypeList.BOOL), context.getText(), context.start);
        if (context.Integer() != null) return new LiteralExpressionNode(new PrimaryType(PrimaryTypeList.INT), context.getText(), context.start);
        if (context.String() != null) return new LiteralExpressionNode(new ClassType("string"), context.getText(), context.start);
        if (context.Null() != null) return new LiteralExpressionNode(new PrimaryType(PrimaryTypeList.NULL), context.getText(), context.start);
        return null;
    }

    @Override
    public CreatorExpressionNode visitCreator(MstarParser.CreatorContext context) {
        TypeNode typeNode = new TypeNode(getNonArrayType(context.nonArrayType()), context.nonArrayType().start);
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
        List<BaseNode> baseNodes = new ArrayList<>();
        for (MstarParser.StatementContext statementContext : context.statement()) {
            if (statementContext.variableDeclarationStatement() != null)
                baseNodes.addAll(spiltVariableDeclarationStatementNode(statementContext.variableDeclarationStatement()));
            else {
                BaseStatementNode statementNode = (BaseStatementNode) visit(statementContext);
                if (statementNode != null)
                    baseNodes.add(statementNode);
            }
        }
        return new BlockStatementNode(baseNodes, context.start);
    }

    @Override
    public BaseStatementNode visitStatement(MstarParser.StatementContext context) {
        if (context.blockStatement() != null) return (BlockStatementNode) visit(context.blockStatement());
        if (context.variableDeclarationStatement() != null) return null;
        if (context.Op == null) return null;
        if (context.Op.getText().equals("if")) {
            BaseExpressionNode conditionExpressionNode = (BaseExpressionNode) visit(context.expression(0));
            List<BaseNode> thenStatementNodes = new ArrayList<>();
            thenStatementNodes.add(visit(context.statement(0)));
            BlockStatementNode thenStatementsNode = new BlockStatementNode(thenStatementNodes, context.statement(0).start);
            BlockStatementNode elseStatementsNode;
            if (context.statement().size() > 1){
                List<BaseNode> elseStatementNodes = new ArrayList<>();
                elseStatementNodes.add(visit(context.statement(1)));
                elseStatementsNode = new BlockStatementNode(elseStatementNodes, context.statement(1).start);
            } else {
                List<BaseNode> elseStatementNodes = new ArrayList<>();
                elseStatementsNode = new BlockStatementNode(elseStatementNodes, context.statement(0).stop);
            }
            return new IfStatementNode(conditionExpressionNode, thenStatementsNode, elseStatementsNode, context.start);
        }
        if (context.Op.getText().equals("for")) {
            BaseExpressionNode initExpressionNode = null;
            BaseExpressionNode conditionExpressionNode = null;
            BaseExpressionNode updateExpressionNode = null;
            if (context.expression().size() == 1) {
                if (context.initExpression != null) initExpressionNode = (BaseExpressionNode) visit(context.expression(0));
                if (context.conditionExpression != null) conditionExpressionNode = (BaseExpressionNode) visit(context.expression(0));
                if (context.updateExpression != null) updateExpressionNode = (BaseExpressionNode) visit(context.expression(0));
            }
            if (context.expression().size() == 2) {
                if (context.initExpression == null) {
                    conditionExpressionNode = (BaseExpressionNode) visit(context.expression(0));
                    updateExpressionNode = (BaseExpressionNode) visit(context.expression(1));
                }
                if (context.conditionExpression == null) {
                    initExpressionNode = (BaseExpressionNode) visit(context.expression(0));
                    updateExpressionNode = (BaseExpressionNode) visit(context.expression(1));
                }
                if (context.updateExpression == null) {
                    initExpressionNode = (BaseExpressionNode) visit(context.expression(0));
                    conditionExpressionNode = (BaseExpressionNode) visit(context.expression(1));
                }
            }
            if (context.expression().size() == 3) {
                initExpressionNode = (BaseExpressionNode) visit(context.expression(0));
                conditionExpressionNode = (BaseExpressionNode) visit(context.expression(1));
                updateExpressionNode = (BaseExpressionNode) visit(context.expression(2));
            }
            BaseStatementNode bodyStatementNode = (BaseStatementNode) visit(context.statement(0));
            if (bodyStatementNode instanceof BlockStatementNode)
                return new LoopStatementNode(initExpressionNode, conditionExpressionNode, updateExpressionNode, (BlockStatementNode) bodyStatementNode, context.start);
            else {
                List<BaseNode> bodyStatementNodes = new ArrayList<>();
                bodyStatementNodes.add(bodyStatementNode);
                BlockStatementNode bodyStatementsNode = new BlockStatementNode(bodyStatementNodes, context.statement(0).start);
                return new LoopStatementNode(initExpressionNode, conditionExpressionNode, updateExpressionNode, bodyStatementsNode, context.start);
            }
        }
        if (context.Op.getText().equals("while")) {
            BaseExpressionNode conditionExpressionNode = (BaseExpressionNode) visit(context.expression(0));
            BaseStatementNode bodyStatementNode = (BaseStatementNode) visit(context.statement(0));
            if (bodyStatementNode instanceof BlockStatementNode)
                return new LoopStatementNode(null, conditionExpressionNode, null, (BlockStatementNode) bodyStatementNode, context.start);
            else {
                List<BaseNode> bodyStatementNodes = new ArrayList<>();
                bodyStatementNodes.add(bodyStatementNode);
                BlockStatementNode bodyStatementsNode = new BlockStatementNode(bodyStatementNodes, context.statement(0).start);
                return new LoopStatementNode(null, conditionExpressionNode, null, bodyStatementsNode, context.start);
            }
        }
        if (context.Op.getText().equals("return")) {
            if (context.expression() != null)
                if (context.expression().size() > 0)
                    return new ReturnStatementNode((BaseExpressionNode) visit(context.expression(0)), context.start);
            else return new ReturnStatementNode(null, context.start);
        }
        if (context.Op.getText().equals("break")) return new BreakStatementNode(context.start);
        if (context.Op.getText().equals("continue")) return new ContinueStatementNode(context.start);
        if (context.Op.getText().equals(";")) return new ExpressionStatementNode((BaseExpressionNode) visit(context.expression(0)), context.start);
        return null;
    }

}
