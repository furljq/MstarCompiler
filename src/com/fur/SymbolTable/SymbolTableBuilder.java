package com.fur.SymbolTable;

import com.fur.SymbolTable.Entity.*;
import com.fur.abstractSyntaxTree.AbstractSyntaxTreeBaseVisitor;
import com.fur.abstractSyntaxTree.node.*;
import com.fur.type.BaseType;
import com.fur.type.ClassType;

public class SymbolTableBuilder extends AbstractSyntaxTreeBaseVisitor<BaseEntity> {

    private ClassEntity globalEntity = new ClassEntity(null, null);
    private BaseEntity currentEntity = globalEntity;

    @Override
    public ClassEntity visitCompilationUnitNode(CompilationUnitNode node) {
        for (BaseDeclarationNode classDeclarationNode : node.getDeclarationNodes())
            if (classDeclarationNode instanceof ClassDeclarationNode) {
                String name = classDeclarationNode.getName();
                ClassEntity classEntity = new ClassEntity(globalEntity, classDeclarationNode.getPosition());
                globalEntity.putNew(name, classEntity);
            }
        for (BaseDeclarationNode declarationNode : node.getDeclarationNodes()) {
            String name = declarationNode.getName();
            BaseEntity entity = visit(declarationNode);
            if (entity instanceof ClassEntity) globalEntity.putCover(name, entity);
            else globalEntity.putNew(name, entity);
        }
        return globalEntity;
    }

    @Override
    public ClassEntity visitClassDeclarationNode(ClassDeclarationNode node) {
        currentEntity = ((ClassEntity) currentEntity).getClassEntity(node.getName());
        for (VariableDeclarationNode variableDeclarationNode : node.getVariableDeclarationNodes())
            ((ClassEntity) currentEntity).putNew(node.getName(), visit(variableDeclarationNode));
        for (FunctionDeclarationNode functionDeclarationNode : node.getFunctionDeclarationNodes())
            visit(functionDeclarationNode);
        currentEntity = globalEntity;
        return globalEntity.getClassEntity(node.getName());
    }

    @Override
    public VariableEntity visitVariableDeclarationNode(VariableDeclarationNode node) {
        TypeNode typeNode = node.getTypeNode();
        BaseType type = typeNode.getType();
        ClassEntity classEntity;
        if (type instanceof ClassType) {
            String className = ((ClassType) type).getClassName();
            classEntity = globalEntity.getClassEntity(className);
        } else classEntity = null;
        return new VariableEntity(type, classEntity, currentEntity, typeNode.getPosition());
    }

    @Override
    public BaseEntity visitFunctionDeclarationNode(FunctionDeclarationNode node) {
        VariableEntity returnTypeEntity;
        if (node.getTypeNode() != null) returnTypeEntity = (VariableEntity) visit(node.getTypeNode());
        else returnTypeEntity = null;
        FunctionEntity functionEntity = new FunctionEntity(returnTypeEntity, currentEntity, node.getPosition());
        BaseEntity oldEntity = currentEntity;
        currentEntity = functionEntity;
        for (VariableDeclarationNode parameterDeclarationNode : node.getParameterNodes()) {
            String parameterName = parameterDeclarationNode.getName();
            VariableEntity parameterEntity = (VariableEntity) visit(parameterDeclarationNode);
            functionEntity.put(parameterName, parameterEntity);
        }
        BlockEntity blockEntity = (BlockEntity) visit(node.getBlockStatementNodes());
        currentEntity = oldEntity;
        functionEntity.setBlockEntity(blockEntity);
        return functionEntity;
    }

    @Override
    public BlockEntity visitBlockStatementNode(BlockStatementNode node) {
        BlockEntity blockEntity = new BlockEntity(currentEntity, node.getPosition());
        BaseEntity oldEntity = currentEntity;
        currentEntity = blockEntity;
        for (BaseStatementNode statementNode : node.getStatementNodes()) {
            if (statementNode instanceof VariableDeclarationStatementNode) {
                for (VariableDeclarationNode variableDeclarationNode : ((VariableDeclarationStatementNode) statementNode).getVariableDeclarationNodes()) {
                    VariableEntity variableEntity = (VariableEntity) visit(variableDeclarationNode);
                    blockEntity.put(variableDeclarationNode.getName(), variableEntity);
                }
            }
            if (statementNode instanceof IfStatementNode) {
                BaseStatementNode thenStatementNode = ((IfStatementNode) statementNode).getThenStatementNode();
                if (thenStatementNode instanceof BlockStatementNode) {
                    BlockEntity thenEntity = (BlockEntity) visit(thenStatementNode);
                    blockEntity.put(thenStatementNode.getPosition(), thenEntity);
                }
                BaseStatementNode elseStatementNode = ((IfStatementNode) statementNode).getThenStatementNode();
                if (elseStatementNode != null)
                    if (elseStatementNode instanceof BlockStatementNode) {
                        BlockEntity elseEntity = (BlockEntity) visit(elseStatementNode);
                        blockEntity.put(elseStatementNode.getPosition(), elseEntity);
                    }
            }
            if (statementNode instanceof LoopStatementNode) {
                BaseStatementNode bodyStatemenNode = ((LoopStatementNode) statementNode).getBodyStatementNode();
                if (bodyStatemenNode instanceof BlockStatementNode) {
                    BlockEntity bodyEntity = (BlockEntity) visit(bodyStatemenNode);
                    blockEntity.put(bodyStatemenNode.getPosition(), bodyEntity);
                }
            }
        }
        currentEntity = oldEntity;
        return blockEntity;
    }

}
