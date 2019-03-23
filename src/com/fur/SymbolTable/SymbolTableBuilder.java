package com.fur.SymbolTable;

import com.fur.SymbolTable.Entity.BaseEntity;
import com.fur.SymbolTable.Entity.ClassEntity;
import com.fur.SymbolTable.Entity.FunctionEntity;
import com.fur.SymbolTable.Entity.VariableEntity;
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
        BaseEntity oldEntity = currentEntity;
        currentEntity = ((ClassEntity) currentEntity).getClassEntity(node.getName());
        for (VariableDeclarationNode variableDeclarationNode : node.getVariableDeclarationNodes())
            ((ClassEntity) currentEntity).putNew(node.getName(), visit(variableDeclarationNode));
        for (FunctionDeclarationNode functionDeclarationNode : node.getFunctionDeclarationNodes())
            visit(functionDeclarationNode);
        currentEntity = oldEntity;
        return globalEntity.getClassEntity(node.getName());
    }

    @Override
    public VariableEntity visitVariableDeclarationNode(VariableDeclarationNode node) {
        return (VariableEntity) visit(node.getTypeNode());
    }

    @Override
    public VariableEntity visitTypeNode(TypeNode node) {
        BaseType type = node.getType();
        ClassEntity classEntity;
        if (type instanceof ClassType) {
            String className = ((ClassType) type).getClassName();
            classEntity = globalEntity.getClassEntity(className);
        } else classEntity = null;
        return new VariableEntity(type, classEntity, currentEntity, node.getPosition());
    }

    @Override
    public BaseEntity visitFunctionDeclarationNode(FunctionDeclarationNode node) {
        VariableEntity returnTypeEntity = (VariableEntity) visit(node.getTypeNode());
        FunctionEntity functionEntity = new FunctionEntity(returnTypeEntity, currentEntity, node.getPosition());
        for (VariableDeclarationNode parameterDeclarationNode : node.getParameterNodes()) {
            String parameterName = parameterDeclarationNode.getName();
            VariableEntity parameterEntity = (VariableEntity) visit(parameterDeclarationNode);
            functionEntity.put(parameterName, parameterEntity);
        }
        return functionEntity;
    }

}
