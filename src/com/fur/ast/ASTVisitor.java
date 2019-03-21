package com.fur.ast;

import com.fur.ast.node.*;

public interface ASTVisitor<T> {

    T visit(BaseNode node);

    T visitArrayExpressionNode(ArrayExpressionNode node);
    T visitArrayTypeNode(ArrayTypeNode node);
    T visitBinaryExpressionNode(BinaryExpressionNode node);
    T visitBlockStatementNode(BlockStatementNode node);
    T visitBreakStatementNode(BreakStatementNode node);
    T visitClassDeclarationNode(ClassDeclarationNode node);
    T visitClassTypeNode(ClassTypeNode node);
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
    T visitPrimaryTypeNode(PrimaryTypeNode node);
    T visitReturnStatementNode(ReturnStatementNode node);
    T visitUnaryExpressionNode(UnaryExpressionNode node);
    T visitVariableDeclarationNode(VariableDeclarationNode node);
    T visitVariableDeclarationStatementNode(VariableDeclarationStatementNode node);

}
