package com.fur.SymbolTable;

import com.fur.SymbolTable.Entity.BaseEntity;
import com.fur.SymbolTable.Entity.ClassEntity;
import com.fur.SymbolTable.Entity.FunctionEntity;
import com.fur.SymbolTable.Entity.VariableEntity;
import com.fur.abstractSyntaxTree.AbstractSyntaxTreeBaseVisitor;
import com.fur.abstractSyntaxTree.node.*;
import com.fur.type.BaseType;

import java.util.HashMap;
import java.util.Map;

public class SymbolTableBuilder extends AbstractSyntaxTreeBaseVisitor<BaseEntity> {

    private BaseEntity currentEntity = new ClassEntity(null);

    @Override
    public BaseEntity visitCompilationUnitNode(CompilationUnitNode node) {
        assert currentEntity instanceof ClassEntity;
        for (BaseDeclarationNode classDeclarationNode : node.getDeclarationNodes())
            if (classDeclarationNode instanceof ClassDeclarationNode) {
                String name = classDeclarationNode.getName();
                ClassEntity classEntity = new ClassEntity(currentEntity);
                ((ClassEntity) currentEntity).getScope().put(name, classEntity);
            }
        for (BaseDeclarationNode classDeclarationNode : node.getDeclarationNodes())
            if (classDeclarationNode instanceof ClassDeclarationNode) {
                String name = classDeclarationNode.getName();
                ClassEntity classEntity = (ClassEntity) visit(classDeclarationNode);//TODO
                ((ClassEntity) currentEntity).getScope().put(name, classEntity);
            }
        for (BaseDeclarationNode functionDeclarationNode : node.getDeclarationNodes())
            if (functionDeclarationNode instanceof FunctionDeclarationNode) {
                String functionName = functionDeclarationNode.getName();
                BaseType returnType = ((FunctionDeclarationNode) functionDeclarationNode).getTypeNode().getType();
                Map<String, VariableEntity> parameterEntityMap = new HashMap<>();
                for (VariableDeclarationNode parameterNode : ((FunctionDeclarationNode) functionDeclarationNode).getParameterNodes()) {
                    String parameterName = parameterNode.getName();
                    VariableEntity parameterEntity = new VariableEntity(parameterNode.getTypeNode().getType(), currentEntity);
                    parameterEntityMap.put(parameterName, parameterEntity);
                }
                FunctionEntity functionEntity = new FunctionEntity(returnType, parameterEntityMap, currentEntity);
                ((ClassEntity) currentEntity).getScope().put(functionName, functionEntity);
            }
        for (BaseDeclarationNode declarationNode : node.getDeclarationNodes()) {
            BaseEntity entity = visit(declarationNode); //TODO
            String name = declarationNode.getName();
            ((ClassEntity) currentEntity).getScope().put(name, entity);
        }
        return currentEntity;
    }

}
