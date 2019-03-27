package com.fur.symbolTable;

import com.fur.abstractSyntaxTree.AbstractSyntaxTreeBaseVisitor;
import com.fur.abstractSyntaxTree.node.*;
import com.fur.enumerate.PrimaryTypeList;
import com.fur.symbolTable.Entity.*;
import com.fur.type.BaseType;
import com.fur.type.ClassType;
import com.fur.type.PrimaryType;

public class SymbolTableBuilder extends AbstractSyntaxTreeBaseVisitor<BaseEntity> {

    private ClassEntity globalEntity = new ClassEntity(null, null);
    private BaseEntity currentEntity = globalEntity;

    public SymbolTableBuilder() {
        setInBuildString();
        globalEntity.putNew("print", setInBuildFunction(PrimaryTypeList.VOID, PrimaryTypeList.STRING, "str"));
        globalEntity.putNew("println", setInBuildFunction(PrimaryTypeList.VOID, PrimaryTypeList.STRING, "str"));
        globalEntity.putNew("getString", setInBuildFunction(PrimaryTypeList.STRING, null, null));
        globalEntity.putNew("getInt", setInBuildFunction(PrimaryTypeList.INT, null, null));
        globalEntity.putNew("toString", setInBuildFunction(PrimaryTypeList.STRING, PrimaryTypeList.INT, "i"));
    }

    private void setInBuildString() {
        ClassEntity stringEntity = new ClassEntity(globalEntity, null);
        globalEntity.putNew("string", stringEntity);
        FunctionEntity length = new FunctionEntity(stringEntity, null);
        length.setReturnType(new PrimaryType(PrimaryTypeList.INT));
        stringEntity.putNew("length", length);
        FunctionEntity substring = new FunctionEntity(stringEntity, null);
        substring.setReturnType(new ClassType("string"));
        substring.put("left", new VariableEntity(new PrimaryType(PrimaryTypeList.INT), substring, null));
        substring.put("right", new VariableEntity(new PrimaryType(PrimaryTypeList.INT), substring, null));
        stringEntity.putNew("substring", substring);
        FunctionEntity parseInt = new FunctionEntity(stringEntity, null);
        parseInt.setReturnType(new PrimaryType(PrimaryTypeList.INT));
        stringEntity.putNew("parseInt", parseInt);
        FunctionEntity ord = new FunctionEntity(stringEntity, null);
        ord.setReturnType(new PrimaryType(PrimaryTypeList.INT));
        ord.put("pos", new VariableEntity(new PrimaryType(PrimaryTypeList.INT), ord, null));
        stringEntity.putNew("ord", ord);
    }

    private FunctionEntity setInBuildFunction(PrimaryTypeList _returnType, PrimaryTypeList parameterType1, String parameterName1) {
        FunctionEntity functionEntity = new FunctionEntity(globalEntity, null);
        BaseType returnType = new PrimaryType(_returnType);
        functionEntity.setReturnType(returnType);
        if (parameterType1 != null) {
            VariableEntity parameterEntity = new VariableEntity(new PrimaryType(parameterType1), functionEntity, null);
            functionEntity.put(parameterName1, parameterEntity);
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
        ((ClassEntity) currentEntity).putNew("this", currentEntity);
        for (BaseNode variableDeclarationNode : node.getVariableNodes())
            if (variableDeclarationNode instanceof VariableDeclarationNode)
                ((ClassEntity) currentEntity).putNew(((VariableDeclarationNode) variableDeclarationNode).getName(), visit(variableDeclarationNode));
        for (FunctionDeclarationNode functionDeclarationNode : node.getFunctionDeclarationNodes())
            ((ClassEntity) currentEntity).putNew(functionDeclarationNode.getName(), visit(functionDeclarationNode));
        currentEntity = globalEntity;
        return globalEntity.getClassEntity(node.getName());
    }

    @Override
    public VariableEntity visitVariableDeclarationNode(VariableDeclarationNode node) {
        TypeNode typeNode = node.getTypeNode();
        BaseType type = typeNode.getType();
        return new VariableEntity(type, currentEntity, typeNode.getPosition());
    }

    @Override
    public BaseEntity visitFunctionDeclarationNode(FunctionDeclarationNode node) {
        FunctionEntity functionEntity = new FunctionEntity(currentEntity, node.getPosition());
        BaseEntity oldEntity = currentEntity;
        currentEntity = functionEntity;
        BaseType returnTypeEntity;
        if (node.getTypeNode() != null) returnTypeEntity = node.getTypeNode().getType();
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
            if (statementNode instanceof IfStatementNode || statementNode instanceof LoopStatementNode) {
                BlockEntity entity = (BlockEntity) visit(statementNode);
                blockEntity.put(statementNode.getPosition(), entity);
            }
        }
        currentEntity = oldEntity;
        return blockEntity;
    }

    @Override
    public BlockEntity visitIfStatementNode(IfStatementNode node) {
        BlockEntity ifBlockEntity = new BlockEntity(currentEntity, node.getPosition());
        BaseStatementNode thenStatementNode = node.getThenStatementNode();
        if (thenStatementNode instanceof BlockStatementNode || thenStatementNode instanceof IfStatementNode || thenStatementNode instanceof LoopStatementNode) {
            BlockEntity thenEntity = (BlockEntity) visit(thenStatementNode);
            ifBlockEntity.put(thenStatementNode.getPosition(), thenEntity);
        }
        BaseStatementNode elseStatementNode = node.getElseStatementNode();
        if (elseStatementNode != null)
            if (elseStatementNode instanceof BlockStatementNode || elseStatementNode instanceof IfStatementNode || elseStatementNode instanceof LoopStatementNode) {
                BlockEntity elseEntity = (BlockEntity) visit(elseStatementNode);
                ifBlockEntity.put(elseStatementNode.getPosition(), elseEntity);
            }
        return ifBlockEntity;
    }

    @Override
    public BlockEntity visitLoopStatementNode(LoopStatementNode node) {
        BlockEntity loopEntity = new BlockEntity(currentEntity, node.getPosition());
        BaseStatementNode bodyStatementNode = node.getBodyStatementNode();
        if (bodyStatementNode instanceof BlockStatementNode || bodyStatementNode instanceof IfStatementNode || bodyStatementNode instanceof LoopStatementNode) {
            BlockEntity thenEntity = (BlockEntity) visit(bodyStatementNode);
            loopEntity.put(bodyStatementNode.getPosition(), thenEntity);
        }
        return loopEntity;
    }
}
