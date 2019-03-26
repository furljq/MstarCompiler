package com.fur.syntax;

import com.fur.abstractSyntaxTree.AbstractSyntaxTreeBaseVisitor;
import com.fur.abstractSyntaxTree.node.*;
import com.fur.enumerate.OperatorList;
import com.fur.enumerate.PrimaryTypeList;
import com.fur.symbolTable.Entity.*;
import com.fur.type.ArrayType;
import com.fur.type.BaseType;
import com.fur.type.ClassType;
import com.fur.type.PrimaryType;

public class SyntaxChecker extends AbstractSyntaxTreeBaseVisitor<BaseType> {

    private ClassEntity globalEntity;
    private BaseEntity currentEntity;

    public SyntaxChecker(ClassEntity _globalEntity) {
        globalEntity = _globalEntity;
        currentEntity = globalEntity;
    }

    @Override
    public BaseType visitCompilationUnitNode(CompilationUnitNode node) {
        for (BaseNode baseNode : node.getBaseNodes())
            visit(baseNode);
        return null;
    }

    @Override
    public BaseType visitVariableDeclarationNode(VariableDeclarationNode node) {
        return null;
    }

    @Override
    public BaseType visitClassDeclarationNode(ClassDeclarationNode node) {
        currentEntity = globalEntity.getClassEntity(node.getName());
        for (BaseNode variableNode : node.getVariableNodes())
            if (variableNode instanceof ExpressionStatementNode)
                visit(variableNode);
        for (FunctionDeclarationNode functionDeclarationNode : node.getFunctionDeclarationNodes())
            visit(functionDeclarationNode);
        currentEntity = globalEntity;
        return null;
    }

    @Override
    public BaseType visitExpressionStatementNode(ExpressionStatementNode node) {
        BaseEntity oldEntity = currentEntity;
        visit(node.getExpressionNode());
        currentEntity = oldEntity;
        return null;
    }

    @Override
    public BaseType visitArrayExpressionNode(ArrayExpressionNode node) {
        BaseType address = visit(node.getAddress());
        if (!(address instanceof ArrayType)) throw new Error();
        BaseType index = visit(node.getIndex());
        if (!(index instanceof PrimaryType)) throw new Error();
        if (((PrimaryType) index).getType() != PrimaryTypeList.INT) throw new Error();
        return ((ArrayType) address).getBaseType();
    }

    @Override
    public BaseType visitBinaryExpressionNode(BinaryExpressionNode node) {
        OperatorList operator = node.getOperator();
        BaseType leftType = visit(node.getLeftExpressionNode());
        if (operator == OperatorList.MUL || operator == OperatorList.DIV || operator == OperatorList.MOD || operator == OperatorList.SUB || operator == OperatorList.LEFTSHIFT || operator == OperatorList.RIGHTSHIFT || operator == OperatorList.AND || operator == OperatorList.XOR || operator == OperatorList.OR) {
            if (!(leftType instanceof PrimaryType)) throw new Error();
            if (((PrimaryType) leftType).getType() != PrimaryTypeList.INT) throw new Error();
        }
        if (operator == OperatorList.ADD || operator == OperatorList.LEQ || operator == OperatorList.GEQ || operator == OperatorList.LT || operator == OperatorList.GT) {
            if (!isStringType(leftType)) {
                if (!(leftType instanceof PrimaryType)) throw new Error();
                if (((PrimaryType) leftType).getType() != PrimaryTypeList.INT) throw new Error();
            }
        }
        if (operator == OperatorList.LOGICALAND || operator == OperatorList.LOGICALOR) {
            if (!(leftType instanceof PrimaryType)) throw new Error();
            if (((PrimaryType) leftType).getType() != PrimaryTypeList.BOOL) throw new Error();
        }
        BaseType rightType = visit(node.getRightExressionNode());
        if (!rightType.equals(leftType)) throw new Error();
        if (operator == OperatorList.LEQ || operator == OperatorList.GEQ || operator == OperatorList.LT || operator == OperatorList.GT || operator == OperatorList.EQUAL || operator == OperatorList.LOGICALNOT)
            return new PrimaryType(PrimaryTypeList.BOOL);
        return leftType;
    }

    private boolean isStringType(BaseType type) {
        if (type instanceof ClassType) return ((ClassType) type).getClassName().equals("string");
        else return false;
    }

    @Override
    public BaseType visitCreatorExpressionNode(CreatorExpressionNode node) {
        BaseType baseType = node.getTypeNode().getType();
        for (int i = 0; i < node.getRestDimension(); i++)
            baseType = new ArrayType(baseType);
        for (int i = 0; i < node.getFixedDimension().size(); i++)
            baseType = new ArrayType(baseType);
        if (node.getArguments().size() > 0) {
            if (!(baseType instanceof ClassType)) throw new Error();
            ClassEntity classEntity = globalEntity.getClassEntity(((ClassType) baseType).getClassName());
            FunctionEntity functionEntity = classEntity.getFunctionEntity(((ClassType) baseType).getClassName());
            for (int i = 0; i < node.getArguments().size(); i++) {
                BaseType argumentType = visit(node.getArguments().get(i));
                if (!argumentType.equals(functionEntity.getParameterList().get(i).getType())) throw new Error();
            }
        }
        return baseType;
    }

    @Override
    public BaseType visitDotExpressionNode(DotExpressionNode node) {
        BaseType classType = visit(node.getObjectExpressionNode());
        if (!(classType instanceof ClassType)) throw new Error();
        ClassEntity classEntity = globalEntity.getClassEntity(((ClassType) classType).getClassName());
        if (classEntity == null) throw new Error();
        String memberName = node.getIdentifierExpressionNode().getIdentifierName();
        if (classEntity.getVariableEntity(memberName) == null) throw new Error();
        return (classEntity.getVariableEntity(memberName)).getType();
    }

    @Override
    public BaseType visitFunctionExpressionNode(FunctionExpressionNode node) {
        FunctionEntity functionEntity;
        if (node.getfunctionNode() instanceof DotExpressionNode) {
            ClassType classType = (ClassType) visit(((DotExpressionNode) node.getfunctionNode()).getObjectExpressionNode());
            ClassEntity classEntity = globalEntity.getClassEntity(classType.getClassName());
            if (classEntity == null) throw new Error();
            functionEntity = classEntity.getFunctionEntity(((DotExpressionNode) node.getfunctionNode()).getIdentifierExpressionNode().getIdentifierName());
        } else if (node.getfunctionNode() instanceof IdentifierExpressionNode)
            functionEntity = globalEntity.getFunctionEntity(((IdentifierExpressionNode) node.getfunctionNode()).getIdentifierName());
        else throw new Error();
        if (functionEntity.getParameterList().size() != node.getArguments().size()) throw new Error();
        for (int i = 0; i < functionEntity.getParameterList().size(); i++) {
            BaseType argumentType = visit(node.getArguments().get(i));
            if (!functionEntity.getParameterList().get(i).getType().equals(argumentType)) throw new Error();
        }
        return functionEntity.getReturnType().getType();
    }

    @Override
    public BaseType visitIdentifierExpressionNode(IdentifierExpressionNode node) {
        BaseEntity entity = currentEntity;
        while (entity != null) {
            if (entity instanceof BlockEntity) {
                VariableEntity variableEntity = ((BlockEntity) entity).get(node.getIdentifierName());
                if (variableEntity != null)
                    if (variableEntity.getPosition().above(node.getPosition()))
                        return variableEntity.getType();
            }
            if (entity instanceof FunctionEntity) {
                VariableEntity variableEntity = ((FunctionEntity) entity).get(node.getIdentifierName());
                if (variableEntity != null)
                    if (variableEntity.getPosition().above(node.getPosition()))
                        return variableEntity.getType();
            }
            if (entity instanceof ClassEntity) {
                if (entity == globalEntity) {
                    VariableEntity variableEntity = ((ClassEntity) entity).getVariableEntity(node.getIdentifierName());
                    if (variableEntity != null)
                        if (variableEntity.getPosition().above(node.getPosition()))
                            return variableEntity.getType();
                } else {
                    VariableEntity variableEntity = ((ClassEntity) entity).getVariableEntity(node.getIdentifierName());
                    if (variableEntity != null)
                        return variableEntity.getType();
                }
            }
            entity = entity.getParentEntity();
        }
        throw new Error();
    }

    @Override
    public BaseType visitLiteralExpressionNode(LiteralExpressionNode node) {
        return node.getType();
    }

    @Override
    public BaseType visitUnaryExpressionNode(UnaryExpressionNode node) {
        OperatorList operator = node.getOperator();
        BaseType baseType = visit(node.getExpressionNode());
        if (operator == OperatorList.PREFIXINC || operator == OperatorList.PREFIXDEC || operator == OperatorList.SUFFIXINC || operator == OperatorList.SUFFIXDEC) {
            if (!(node.getExpressionNode() instanceof IdentifierExpressionNode)) throw new Error();
            if (!baseType.equals(new PrimaryType(PrimaryTypeList.INT))) throw new Error();
        }
        if (operator == OperatorList.POS || operator == OperatorList.NEG || operator == OperatorList.NOT)
            if (!baseType.equals(new PrimaryType(PrimaryTypeList.INT))) throw new Error();
        if (operator == OperatorList.LOGICALNOT)
            if (!baseType.equals(new PrimaryType(PrimaryTypeList.BOOL))) throw new Error();
        return baseType;
    }

    @Override
    public BaseType visitFunctionDeclarationNode(FunctionDeclarationNode node) {
        if (!(currentEntity instanceof ClassEntity)) throw new Error();
        BaseEntity oldEntity = currentEntity;
        currentEntity = ((ClassEntity) currentEntity).getFunctionEntity(node.getName());
        for (BaseNode parameterNode : node.getParameterNodes())
            visit(parameterNode);
        visit(node.getBlockStatementNodes());
        currentEntity = oldEntity;
        return null;
    }

    @Override
    public BaseType visitBlockStatementNode(BlockStatementNode node) {
        BaseEntity oldEntity = currentEntity;
        if (currentEntity instanceof BlockEntity) currentEntity = ((BlockEntity) currentEntity).get(node.getPosition());
        if (currentEntity instanceof FunctionEntity) currentEntity = ((FunctionEntity) currentEntity).getBlockEntity();
        for (BaseNode baseNode : node.getStatementNodes()) {
            if (baseNode instanceof BaseStatementNode) visit(baseNode);
        }
        currentEntity = oldEntity;
        return null;
    }

    @Override
    public BaseType visitIfStatementNode(IfStatementNode node) {
        BaseType conditionType = visit(node.getConditionExpressionNode());
        if (!(conditionType instanceof PrimaryType)) throw new Error();
        if (((PrimaryType) conditionType).getType() != PrimaryTypeList.BOOL) throw new Error();
        visit(node.getThenStatementNode());
        if (node.getElseStatementNode() != null) visit(node.getElseStatementNode());
        return null;
    }

    @Override
    public BaseType visitLoopStatementNode(LoopStatementNode node) {
        BaseType conditionType = visit(node.getConditionExpressionNode());
        if (!(conditionType instanceof PrimaryType)) throw new Error();
        visit(node.getInitExpressionNode());
        visit(node.getUpdateExpressionNode());
        visit(node.getBodyStatementNode());
        return null;
    }
}