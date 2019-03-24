package com.fur.symbolTable;

import com.fur.symbolTable.Entity.*;
import com.fur.abstractSyntaxTree.AbstractSyntaxTreeBaseVisitor;
import com.fur.abstractSyntaxTree.node.*;
import com.fur.enumerate.PrimaryTypeList;
import com.fur.type.BaseType;
import com.fur.type.ClassType;
import com.fur.type.PrimaryType;

public class SymbolTableBuilder extends AbstractSyntaxTreeBaseVisitor<BaseEntity> {

    private ClassEntity globalEntity = new ClassEntity(null, null);
    private BaseEntity currentEntity = globalEntity;

    public SymbolTableBuilder() {
        globalEntity.putNew("print", setInBuildFunction(PrimaryTypeList.VOID, PrimaryTypeList.STRING));
        globalEntity.putNew("println", setInBuildFunction(PrimaryTypeList.VOID, PrimaryTypeList.STRING));
        globalEntity.putNew("getString", setInBuildFunction(PrimaryTypeList.STRING, null));
        globalEntity.putNew("getInt", setInBuildFunction(PrimaryTypeList.INT, null));
        globalEntity.putNew("toString", setInBuildFunction(PrimaryTypeList.STRING, PrimaryTypeList.INT));
    }

    private FunctionEntity setInBuildFunction(PrimaryTypeList returnType, PrimaryTypeList parameterType) {
        FunctionEntity functionEntity = new FunctionEntity(globalEntity, null);
        VariableEntity returnTypeEntity = new VariableEntity(new PrimaryType(returnType), null, functionEntity, null);
        functionEntity.setReturnType(returnTypeEntity);
        if (parameterType != null) {
            VariableEntity parameterEntity = new VariableEntity(new PrimaryType(parameterType), null, functionEntity, null);
            functionEntity.put("str", parameterEntity);
        }
        return functionEntity;
    }

    @Override
    public ClassEntity visitCompilationUnitNode(CompilationUnitNode node) {
        for (BaseNode classDeclarationNode : node.getBaseNodes())
            if (classDeclarationNode instanceof ClassDeclarationNode) {
                String name = ((ClassDeclarationNode) classDeclarationNode).getName();
                ClassEntity classEntity = new ClassEntity(globalEntity, classDeclarationNode.getPosition());
                globalEntity.putNew(name, classEntity);
            }
        for (BaseNode declarationNode : node.getBaseNodes()) {
            if (declarationNode instanceof BaseDeclarationNode) {
                String name = ((BaseDeclarationNode) declarationNode).getName();
                BaseEntity entity = visit(declarationNode);
                if (entity instanceof ClassEntity) globalEntity.putCover(name, entity);
                else globalEntity.putNew(name, entity);
            }
        }
        return globalEntity;
    }

    @Override
    public ClassEntity visitClassDeclarationNode(ClassDeclarationNode node) {
        currentEntity = ((ClassEntity) currentEntity).getClassEntity(node.getName());
        for (BaseNode variableDeclarationNode : node.getVariableNodes())
            if (variableDeclarationNode instanceof VariableDeclarationNode)
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
        FunctionEntity functionEntity = new FunctionEntity(currentEntity, node.getPosition());
        BaseEntity oldEntity = currentEntity;
        currentEntity = functionEntity;
        VariableEntity returnTypeEntity;
        if (node.getTypeNode() != null) returnTypeEntity = (VariableEntity) visit(node.getTypeNode());
        else returnTypeEntity = null;
        functionEntity.setReturnType(returnTypeEntity);
        for (BaseNode parameterDeclarationNode : node.getParameterNodes()) {
            if (parameterDeclarationNode instanceof VariableDeclarationNode) {
                String parameterName = ((BaseDeclarationNode) parameterDeclarationNode).getName();
                VariableEntity parameterEntity = (VariableEntity) visit(parameterDeclarationNode);
                functionEntity.put(parameterName, parameterEntity);
            }
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
        for (BaseNode statementNode : node.getStatementNodes()) {
            if (statementNode instanceof VariableDeclarationNode) {
                VariableEntity variableEntity = (VariableEntity) visit(statementNode);
                blockEntity.put(((VariableDeclarationNode) statementNode).getName(), variableEntity);
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
                BaseStatementNode bodyStatementNode = ((LoopStatementNode) statementNode).getBodyStatementNode();
                if (bodyStatementNode instanceof BlockStatementNode) {
                    BlockEntity bodyEntity = (BlockEntity) visit(bodyStatementNode);
                    blockEntity.put(bodyStatementNode.getPosition(), bodyEntity);
                }
            }
        }
        currentEntity = oldEntity;
        return blockEntity;
    }

}
