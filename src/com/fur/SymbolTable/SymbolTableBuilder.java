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

    private BaseEntity currentEntity = new ClassEntity(null, null);
    private ClassEntity globalEntity = (ClassEntity) currentEntity;

    @Override
    public BaseEntity visitCompilationUnitNode(CompilationUnitNode node) {
        assert currentEntity instanceof ClassEntity;
        for (BaseDeclarationNode classDeclarationNode : node.getDeclarationNodes())
            if (classDeclarationNode instanceof ClassDeclarationNode) {
                String name = classDeclarationNode.getName();
                ClassEntity classEntity = new ClassEntity(currentEntity, classDeclarationNode.getPosition());
                ((ClassEntity) currentEntity).putNew(name, classEntity);
            }
        for (BaseDeclarationNode declarationNode : node.getDeclarationNodes()) {
            if (declarationNode instanceof ClassDeclarationNode) {
                String name = declarationNode.getName();
                currentEntity = ((ClassEntity) currentEntity).getClassEntity(name);
                for (VariableDeclarationStatementNode memberVariableDeclarationStatementNode : ((ClassDeclarationNode) declarationNode).getVariableDeclarationStatementNodes())
                    for (VariableDeclarationNode memberVariableDeclarationNode : memberVariableDeclarationStatementNode.getVariableDeclarationNodes()) {
                        String memberVariableName = memberVariableDeclarationNode.getName();
                        VariableEntity memberVariableEntity = scanVariableDeclaration(memberVariableDeclarationNode);
                        ((ClassEntity) currentEntity).putNew(memberVariableName, memberVariableEntity);
                    }
                for (FunctionDeclarationNode functionDeclarationNode : ((ClassDeclarationNode) declarationNode).getFunctionDeclarationNodes()) {
                    String functionName = functionDeclarationNode.getName();
                    FunctionEntity functionEntity = scanFunctionDeclaration(functionDeclarationNode);
                    ((ClassEntity) currentEntity).putNew(functionName, functionEntity);
                }
                currentEntity = currentEntity.getParentEntity();
            }
            if (declarationNode instanceof FunctionDeclarationNode) {
                String functionName = declarationNode.getName();
                FunctionEntity functionEntity = scanFunctionDeclaration((FunctionDeclarationNode) declarationNode);
                ((ClassEntity) currentEntity).putNew(functionName, functionEntity);
            }
            if (declarationNode instanceof VariableDeclarationNode) {
                String variableName = declarationNode.getName();
                VariableEntity variableEntity = scanVariableDeclaration((VariableDeclarationNode) declarationNode);
                ((ClassEntity) currentEntity).putNew(variableName, variableEntity);
            }
        }
        assert currentEntity == globalEntity;
        for (BaseDeclarationNode declarationNode : node.getDeclarationNodes()) {
            String name = declarationNode.getName();
            BaseEntity entity = visit(declarationNode); //TODO
            ((ClassEntity) currentEntity).put(name, entity);
        }
        return currentEntity;
    }

    private VariableEntity scanVariableDeclaration(VariableDeclarationNode node) {
        BaseType memberVariableType = node.getTypeNode().getType();
        ClassEntity memberVariableClassEntity;
        if (memberVariableType instanceof ClassType) {
            memberVariableClassEntity = globalEntity.getClassEntity(((ClassType) memberVariableType).getClassName());
        } else memberVariableClassEntity = null;
        return new VariableEntity(memberVariableType, memberVariableClassEntity, currentEntity, node.getPosition());
    }

    private FunctionEntity scanFunctionDeclaration(FunctionDeclarationNode node) {
        FunctionEntity functionEntity = new FunctionEntity(currentEntity, node.getPosition());
        BaseType functionReturnType = node.getTypeNode().getType();
        functionEntity.setReturnType(functionReturnType);
        for (VariableDeclarationNode parameterVariableDeclarationNode : node.getParameterNodes()) {
            String parameterName = parameterVariableDeclarationNode.getName();
            VariableEntity parameterVariableEntity = scanVariableDeclaration(parameterVariableDeclarationNode);
            functionEntity.put(parameterName, parameterVariableEntity);
        }
        return functionEntity;
    }

    @Override
    public ClassEntity visitClassDeclarationNode(ClassDeclarationNode node) {

    }

}
