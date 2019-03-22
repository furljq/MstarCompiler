package com.fur.SymbolTable;

import com.fur.SymbolTable.Entity.BaseEntity;
import com.fur.SymbolTable.Entity.ClassEntity;
import com.fur.abstractSyntaxTree.AbstractSyntaxTreeVisitor;
import com.fur.abstractSyntaxTree.node.*;

import java.util.HashMap;
import java.util.Map;

public class SymbolTableBuilder implements AbstractSyntaxTreeVisitor<BaseEntity> {

    @Override
    public BaseEntity visitCompilationUnitNode(CompilationUnitNode node) {
        Map<String, BaseEntity> scope = new HashMap<>();
        for (BaseDeclarationNode declarationNode : node.getDeclarationNodes())
            if (declarationNode instanceof ClassDeclarationNode) {
                String name = declarationNode.getName();
                ClassEntity entity = new ClassEntity();
                scope.put(name, entity);
            }
        for (BaseDeclarationNode declarationNode : node.getDeclarationNodes())
            if (declarationNode instanceof FunctionDeclarationNode) {
                String name = declarationNode.getName();
            }
        return (ClassEntity)null;
    }

    @Override
    public BaseEntity visitArrayExpressionNode(ArrayExpressionNode node) {
        return null;
    }

    @Override
    public BaseEntity visitArrayTypeNode(ArrayTypeNode node) {
        return null;
    }

    @Override
    public BaseEntity visitBinaryExpressionNode(BinaryExpressionNode node) {
        return null;
    }

    @Override
    public BaseEntity visitBlockStatementNode(BlockStatementNode node) {
        return null;
    }

    @Override
    public BaseEntity visitBreakStatementNode(BreakStatementNode node) {
        return null;
    }

    @Override
    public BaseEntity visitClassDeclarationNode(ClassDeclarationNode node) {
        return null;
    }

    @Override
    public BaseEntity visitClassTypeNode(ClassTypeNode node) {
        return null;
    }

    @Override
    public BaseEntity visitContinueStatementNode(ContinueStatementNode node) {
        return null;
    }

    @Override
    public BaseEntity visitCreatorExpressionNode(CreatorExpressionNode node) {
        return null;
    }

    @Override
    public BaseEntity visitDotExpressionNode(DotExpressionNode node) {
        return null;
    }

    @Override
    public BaseEntity visitExpressionStatementNode(ExpressionStatementNode node) {
        return null;
    }

    @Override
    public BaseEntity visitFunctionDeclarationNode(FunctionDeclarationNode node) {
        return null;
    }

    @Override
    public BaseEntity visitFunctionExpressionNode(FunctionExpressionNode node) {
        return null;
    }

    @Override
    public BaseEntity visitIdentifierExpressionNode(IdentifierExpressionNode node) {
        return null;
    }

    @Override
    public BaseEntity visitIfStatementNode(IfStatementNode node) {
        return null;
    }

    @Override
    public BaseEntity visitLiteralExpressionNode(LiteralExpressionNode node) {
        return null;
    }

    @Override
    public BaseEntity visitLoopStatementNode(LoopStatementNode node) {
        return null;
    }

    @Override
    public BaseEntity visitPrimaryTypeNode(PrimaryTypeNode node) {
        return null;
    }

    @Override
    public BaseEntity visitReturnStatementNode(ReturnStatementNode node) {
        return null;
    }

    @Override
    public BaseEntity visitUnaryExpressionNode(UnaryExpressionNode node) {
        return null;
    }

    @Override
    public BaseEntity visitVariableDeclarationNode(VariableDeclarationNode node) {
        return null;
    }

    @Override
    public BaseEntity visitVariableDeclarationStatementNode(VariableDeclarationStatementNode node) {
        return null;
    }

    @Override
    public BaseEntity visit(BaseNode node) {
        return node.accept(this);
    }

}
