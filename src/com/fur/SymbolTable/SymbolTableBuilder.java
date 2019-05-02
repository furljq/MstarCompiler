package com.fur.symbolTable;

import com.fur.abstractSyntaxTree.AbstractSyntaxTreeBaseVisitor;
import com.fur.abstractSyntaxTree.node.*;
import com.fur.enumerate.PrimaryTypeList;
import com.fur.symbolTable.Entity.*;
import com.fur.type.ArrayType;
import com.fur.type.BaseType;
import com.fur.type.ClassType;
import com.fur.type.PrimaryType;

public class SymbolTableBuilder extends AbstractSyntaxTreeBaseVisitor<BaseEntity> {

    private ClassEntity globalEntity = new ClassEntity(null, null);
    private BaseEntity currentEntity = globalEntity;

    public SymbolTableBuilder() {
        setInBuildString();
        globalEntity.putNew("print", setInBuildFunction(new PrimaryType(PrimaryTypeList.INT), new ClassType("string"), "str"));
        globalEntity.putNew("println", setInBuildFunction(new PrimaryType(PrimaryTypeList.INT), new ClassType("string"), "str"));
        globalEntity.putNew("getString", setInBuildFunction(new ClassType("string"), null, null));
        globalEntity.putNew("getInt", setInBuildFunction(new PrimaryType(PrimaryTypeList.INT), null, null));
        globalEntity.putNew("toString", setInBuildFunction(new ClassType("string"), new PrimaryType(PrimaryTypeList.INT), "i"));
        FunctionEntity sizeEntity = new FunctionEntity(globalEntity, null);
        sizeEntity.put("this", new VariableEntity(new PrimaryType(PrimaryTypeList.INT), sizeEntity, null));
        sizeEntity.setReturnType(new PrimaryType(PrimaryTypeList.INT));
        globalEntity.putNew("size", sizeEntity);
    }

    private void setInBuildString() {
        ClassEntity stringEntity = new ClassEntity(globalEntity, null);
        globalEntity.putNew("string", stringEntity);
        FunctionEntity length = new FunctionEntity(stringEntity, null);
        length.put("this", new VariableEntity(new ClassType("string"), length, null));
        length.setReturnType(new PrimaryType(PrimaryTypeList.INT));
        stringEntity.putNew("length", length);
        FunctionEntity substring = new FunctionEntity(stringEntity, null);
        substring.put("this", new VariableEntity(new ClassType("string"), substring, null));
        substring.setReturnType(new ClassType("string"));
        substring.put("left", new VariableEntity(new PrimaryType(PrimaryTypeList.INT), substring, null));
        substring.put("right", new VariableEntity(new PrimaryType(PrimaryTypeList.INT), substring, null));
        stringEntity.putNew("substring", substring);
        FunctionEntity parseInt = new FunctionEntity(stringEntity, null);
        parseInt.put("this", new VariableEntity(new ClassType("string"), parseInt, null));
        parseInt.setReturnType(new PrimaryType(PrimaryTypeList.INT));
        stringEntity.putNew("parseInt", parseInt);
        FunctionEntity ord = new FunctionEntity(stringEntity, null);
        ord.put("this", new VariableEntity(new ClassType("string"), ord, null));
        ord.setReturnType(new PrimaryType(PrimaryTypeList.INT));
        ord.put("pos", new VariableEntity(new PrimaryType(PrimaryTypeList.INT), ord, null));
        stringEntity.putNew("ord", ord);
        setStringOperator("string_concat");
        setStringOperator("string_lt");
        setStringOperator("string_leq");
        setStringOperator("string_gt");
        setStringOperator("string_geq");
        setStringOperator("string_equal");
    }

    private void setStringOperator(String functionName) {
        FunctionEntity entity = new FunctionEntity(globalEntity, null);
        entity.put("str1", new VariableEntity(new ClassType("string"), entity, null));
        entity.put("str2", new VariableEntity(new ClassType("string"), entity, null));
        entity.setReturnType(new ClassType("string"));
        globalEntity.putNew(functionName, entity);
    }

    private FunctionEntity setInBuildFunction(BaseType returnType, BaseType parameterType1, String parameterName1) {
        FunctionEntity functionEntity = new FunctionEntity(globalEntity, null);
        functionEntity.setReturnType(returnType);
        if (parameterType1 != null) {
            VariableEntity parameterEntity = new VariableEntity(parameterType1, functionEntity, null);
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
                if (entity instanceof FunctionEntity)
                    if (((FunctionEntity) entity).getReturnType() == null)
                        throw new Error();
                if (entity instanceof ClassEntity) globalEntity.putCover(name, entity);
                else globalEntity.putNew(name, entity);
            }
        }
        return globalEntity;
    }

    @Override
    public ClassEntity visitClassDeclarationNode(ClassDeclarationNode node) {
        currentEntity = ((ClassEntity) currentEntity).getClassEntity(node.getName());
        ((ClassEntity) currentEntity).putNew("this", new VariableEntity(new ClassType(node.getName()), currentEntity, node.getPosition()));
        for (BaseNode variableDeclarationNode : node.getVariableNodes())
            if (variableDeclarationNode instanceof VariableDeclarationNode)
                ((ClassEntity) currentEntity).putNew(((VariableDeclarationNode) variableDeclarationNode).getName(), visit(variableDeclarationNode));
        for (FunctionDeclarationNode functionDeclarationNode : node.getFunctionDeclarationNodes()) {
            FunctionEntity functionEntity = (FunctionEntity) visit(functionDeclarationNode);
            if (functionEntity.getReturnType() == null)
                if (!functionDeclarationNode.getName().equals(node.getName()))
                    throw new Error();
            ((ClassEntity) currentEntity).putNew(functionDeclarationNode.getName(), functionEntity);
        }
        currentEntity = globalEntity;
        return globalEntity.getClassEntity(node.getName());
    }

    @Override
    public VariableEntity visitVariableDeclarationNode(VariableDeclarationNode node) {
        TypeNode typeNode = node.getTypeNode();
        BaseType type = typeNode.getType();
        if (type instanceof ClassType)
            globalEntity.getClassEntity(((ClassType) type).getClassName());
        if (type instanceof PrimaryType)
            if (((PrimaryType) type).getType() == PrimaryTypeList.VOID)
                throw new Error();
        return new VariableEntity(type, currentEntity, typeNode.getPosition());
    }

    @Override
    public BaseEntity visitFunctionDeclarationNode(FunctionDeclarationNode node) {
        FunctionEntity functionEntity = new FunctionEntity(currentEntity, node.getPosition());
        BaseEntity oldEntity = currentEntity;
        currentEntity = functionEntity;
        BaseType returnType;
        if (node.getTypeNode() != null) returnType = node.getTypeNode().getType();
        else returnType = null;
        if (returnType instanceof ClassType)
            globalEntity.getClassEntity(((ClassType) returnType).getClassName());
        functionEntity.setReturnType(returnType);
        if (node.getClassName() != null) {
            VariableEntity parameterEntity = new VariableEntity(new ClassType(node.getClassName()), currentEntity, node.getPosition());
            functionEntity.put("this", parameterEntity);
        }
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
            if (statementNode instanceof IfStatementNode || statementNode instanceof LoopStatementNode || statementNode instanceof BlockStatementNode) {
                BlockEntity entity = (BlockEntity) visit(statementNode);
                blockEntity.put(statementNode.getPosition(), entity);
            }
        }
        currentEntity = oldEntity;
        return blockEntity;
    }

    @Override
    public IfEntity visitIfStatementNode(IfStatementNode node) {
        IfEntity ifBlockEntity = new IfEntity(currentEntity, node.getPosition());
        BaseStatementNode thenStatementNode = node.getThenStatementNode();
        BlockEntity thenEntity = (BlockEntity) visit(thenStatementNode);
        ifBlockEntity.put(thenStatementNode.getPosition(), thenEntity);
        BaseStatementNode elseStatementNode = node.getElseStatementNode();
        BlockEntity elseEntity = (BlockEntity) visit(elseStatementNode);
        ifBlockEntity.put(elseStatementNode.getPosition(), elseEntity);
        return ifBlockEntity;
    }

    @Override
    public LoopEntity visitLoopStatementNode(LoopStatementNode node) {
        LoopEntity loopEntity = new LoopEntity(currentEntity, node.getPosition());
        BlockEntity oldEntity = (BlockEntity) currentEntity;
        currentEntity = loopEntity;
        BaseStatementNode bodyStatementNode = node.getBodyStatementNode();
        BlockEntity bodyEntity = (BlockEntity) visit(bodyStatementNode);
        loopEntity.put(bodyStatementNode.getPosition(), bodyEntity);
        currentEntity = oldEntity;
        return loopEntity;
    }

}
