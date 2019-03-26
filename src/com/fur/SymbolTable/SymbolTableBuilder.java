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
        globalEntity.putNew("println", setInBuildFunction(PrimaryTypeList.VOID, PrimaryTypeList.STRING, "str、"));
        globalEntity.putNew("getString", setInBuildFunction(PrimaryTypeList.STRING, null, null));
        globalEntity.putNew("getInt", setInBuildFunction(PrimaryTypeList.INT, null, null));
        globalEntity.putNew("toString", setInBuildFunction(PrimaryTypeList.STRING, PrimaryTypeList.INT, "i"));
    }

    private void setInBuildString() {
        ClassEntity stringEntity = new ClassEntity(globalEntity, null);
        globalEntity.putNew("string", stringEntity);
        FunctionEntity length = new FunctionEntity(stringEntity, null);
        length.setReturnType(new VariableEntity(new PrimaryType(PrimaryTypeList.INT), length, null));
        stringEntity.putNew("length", length);
        FunctionEntity substring = new FunctionEntity(stringEntity, null);
        substring.setReturnType(new VariableEntity(new ClassType("string"), substring, null));
        substring.put("left", new VariableEntity(new PrimaryType(PrimaryTypeList.INT), substring, null));
        substring.put("right", new VariableEntity(new PrimaryType(PrimaryTypeList.INT), substring, null));
        stringEntity.putNew("substring", substring);
        FunctionEntity parseInt = new FunctionEntity(stringEntity, null);
        parseInt.setReturnType(new VariableEntity(new PrimaryType(PrimaryTypeList.INT), parseInt,null));
        stringEntity.putNew("parseInt", parseInt);
        FunctionEntity ord = new FunctionEntity(stringEntity, null);
        ord.setReturnType(new VariableEntity(new PrimaryType(PrimaryTypeList.INT), ord, null));
        ord.put("pos", new VariableEntity(new PrimaryType(PrimaryTypeList.INT), ord, null));
        stringEntity.putNew("ord", ord);
    }

    private FunctionEntity setInBuildFunction(PrimaryTypeList returnType, PrimaryTypeList parameterType1, String parameterName1) {
        FunctionEntity functionEntity = new FunctionEntity(globalEntity, null);
        VariableEntity returnTypeEntity = new VariableEntity(new PrimaryType(returnType), functionEntity, null);
        functionEntity.setReturnType(returnTypeEntity);
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
