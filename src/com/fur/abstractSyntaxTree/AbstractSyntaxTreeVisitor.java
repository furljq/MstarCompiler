package com.fur.abstractSyntaxTree;

import com.fur.abstractSyntaxTree.node.*;

public interface AbstractSyntaxTreeVisitor<T> {

    T visit(BaseNode node);

    T visitArrayExpressionNode(ArrayExpressionNode node);
    T visitBinaryExpressionNode(BinaryExpressionNode node);
    T visitBlockStatementNode(BlockStatementNode node);
    T visitBreakStatementNode(BreakStatementNode node);
    T visitClassDeclarationNode(ClassDeclarationNode node);
    T visitCompilationUnitNode(CompilationUnitNode node);
    T visitContinueStatementNode(ContinueStatementNode node);
    T visitCreatorExpressionNode(CreatorExpressionNode node);
    T visitDotExpressionNode(DotExpressionNode node);
    T visitExpressionStatementNode(ExpressionStatementNode node);
    T visitFunctionDeclarationNode(FunctionDeclarationNode node);
    T visitFunctionExpressionNode(FunctionExpressionNode node);
    T visitIdentifierExpressionNode(IdentifierExpressionNode node);
    T visitIfStatementNode(IfStatementNode node);
    T visitLiteralExpressionNode(LiteralExpressionNode node);
    T visitLoopStatementNode(LoopStatementNode node);
    T visitReturnStatementNode(ReturnStatementNode node);
    T visitTypeNode(TypeNode node);
    T visitUnaryExpressionNode(UnaryExpressionNode node);
    T visitVariableDeclarationNode(VariableDeclarationNode node);
    T visitVariableDeclarationStatementNode(VariableDeclarationStatementNode node);

}
