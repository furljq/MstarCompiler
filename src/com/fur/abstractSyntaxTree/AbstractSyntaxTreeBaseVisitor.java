package com.fur.abstractSyntaxTree;

import com.fur.abstractSyntaxTree.node.*;

public class AbstractSyntaxTreeBaseVisitor<T> implements AbstractSyntaxTreeVisitor<T> {

    @Override
    public T visit(BaseNode node) {
        return node.accept(this);
    }

    @Override
    public T visitArrayExpressionNode(ArrayExpressionNode node) {
        return null;
    }

    @Override
    public T visitBinaryExpressionNode(BinaryExpressionNode node) {
        return null;
    }

    @Override
    public T visitBlockStatementNode(BlockStatementNode node) {
        return null;
    }

    @Override
    public T visitBreakStatementNode(BreakStatementNode node) {
        return null;
    }

    @Override
    public T visitClassDeclarationNode(ClassDeclarationNode node) {
        return null;
    }

    @Override
    public T visitCompilationUnitNode(CompilationUnitNode node) {
        return null;
    }

    @Override
    public T visitContinueStatementNode(ContinueStatementNode node) {
        return null;
    }

    @Override
    public T visitCreatorExpressionNode(CreatorExpressionNode node) {
        return null;
    }

    @Override
    public T visitDotExpressionNode(DotExpressionNode node) {
        return null;
    }

    @Override
    public T visitExpressionStatementNode(ExpressionStatementNode node) {
        return null;
    }

    @Override
    public T visitFunctionDeclarationNode(FunctionDeclarationNode node) {
        return null;
    }

    @Override
    public T visitFunctionExpressionNode(FunctionExpressionNode node) {
        return null;
    }

    @Override
    public T visitIdentifierExpressionNode(IdentifierExpressionNode node) {
        return null;
    }

    @Override
    public T visitIfStatementNode(IfStatementNode node) {
        return null;
    }

    @Override
    public T visitLiteralExpressionNode(LiteralExpressionNode node) {
        return null;
    }

    @Override
    public T visitLoopStatementNode(LoopStatementNode node) {
        return null;
    }

    @Override
    public T visitReturnStatementNode(ReturnStatementNode node) {
        return null;
    }

    @Override
    public T visitTypeNode(TypeNode node) {
        return null;
    }

    @Override
    public T visitUnaryExpressionNode(UnaryExpressionNode node) {
        return null;
    }

    @Override
    public T visitVariableDeclarationNode(VariableDeclarationNode node) {
        return null;
    }

}
