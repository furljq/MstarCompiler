package com.fur.syntax;

import com.fur.abstractSyntaxTree.AbstractSyntaxTreeBaseVisitor;
import com.fur.abstractSyntaxTree.node.*;
import com.fur.enumerate.OperatorList;
import com.fur.enumerate.PrimaryTypeList;
import com.fur.symbolTable.Entity.*;
import com.fur.type.*;

public class SyntaxChecker extends AbstractSyntaxTreeBaseVisitor<BaseType> {

    private ClassEntity globalEntity;
    private BaseEntity currentEntity;

    public SyntaxChecker(ClassEntity _globalEntity) {
        globalEntity = _globalEntity;
        currentEntity = globalEntity;
    }

    private void assignExpressionCheck(BaseExpressionNode leftExpressionNode) {
        boolean assign = false;
        if (leftExpressionNode instanceof IdentifierExpressionNode) assign = true;
        if (leftExpressionNode instanceof ArrayExpressionNode) assign = true;
        if (leftExpressionNode instanceof DotExpressionNode) assign = true;
        if (!assign) throw new Error();
    }

    private boolean isStringType(BaseType type) {
        if (type instanceof ClassType) return ((ClassType) type).getClassName().equals("string");
        else return false;
    }

    private void checkInLoop() {
        BaseEntity loopEntity = currentEntity;
        while (loopEntity != null) {
            if (loopEntity instanceof LoopEntity) {
                return;
            }
            loopEntity = loopEntity.getParentEntity();
        }
        throw new Error();
    }

    @Override
    public BaseType visitCompilationUnitNode(CompilationUnitNode node) {
        FunctionEntity mainFunction = globalEntity.getFunctionEntity("main");
        if (mainFunction == null) throw new Error();
        if (!(mainFunction.getReturnType() instanceof PrimaryType)) throw new Error();
        if (((PrimaryType) mainFunction.getReturnType()).getType() != PrimaryTypeList.INT) throw new Error();
        for (BaseNode baseNode : node.getBaseNodes())
            visit(baseNode);
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
        BaseType type = ((ArrayType) address).getBaseType();
        node.setType(new AddressType(type));
        return type;
    }

    @Override
    public BaseType visitBinaryExpressionNode(BinaryExpressionNode node) {
        OperatorList operator = node.getOperator();
        if (operator == OperatorList.ASSIGN) {
            BaseExpressionNode leftExpressionNode = node.getLeftExpressionNode();
            assignExpressionCheck(leftExpressionNode);
        }
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
        if (leftType instanceof PrimaryType)
            if (((PrimaryType) leftType).getType() == PrimaryTypeList.VOID) throw new Error();
        if (operator == OperatorList.LEQ || operator == OperatorList.GEQ || operator == OperatorList.LT || operator == OperatorList.GT || operator == OperatorList.EQUAL || operator == OperatorList.NOTEQUAL)
            return new PrimaryType(PrimaryTypeList.BOOL);
        node.setType(leftType);
        return leftType;
    }

    @Override
    public BaseType visitCreatorExpressionNode(CreatorExpressionNode node) {
        BaseType baseType = node.getTypeNode().getType();
        if (baseType instanceof PrimaryType)
            if (((PrimaryType) baseType).getType() == PrimaryTypeList.VOID)
                throw new Error();
        for (int i = 0; i < node.getRestDimension(); i++)
            baseType = new ArrayType(baseType);
        for (BaseExpressionNode dimensionExpression : node.getFixedDimension()) {
            BaseType dimension = visit(dimensionExpression);
            if (!(dimension instanceof PrimaryType)) throw new Error();
            if (!((PrimaryType) dimension).getType().equals(PrimaryTypeList.INT)) throw new Error();
            baseType = new ArrayType(baseType);
        }
        node.setType(baseType);
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
        BaseType type =(classEntity.getVariableEntity(memberName)).getType();
        node.setType(new AddressType(type));
        return type;
    }

    @Override
    public BaseType visitFunctionExpressionNode(FunctionExpressionNode node) {
        FunctionEntity functionEntity;
        if (node.getfunctionNode() instanceof DotExpressionNode) {
            BaseType classType = visit(((DotExpressionNode) node.getfunctionNode()).getObjectExpressionNode());
            if (classType instanceof ClassType) {
                ClassEntity classEntity = globalEntity.getClassEntity(((ClassType) classType).getClassName());
                if (classEntity == null) throw new Error();
                functionEntity = classEntity.getFunctionEntity(((DotExpressionNode) node.getfunctionNode()).getIdentifierExpressionNode().getIdentifierName());
            } else {
                if (classType instanceof ArrayType) {
                    if (!((DotExpressionNode) node.getfunctionNode()).getIdentifierExpressionNode().getIdentifierName().equals("size"))
                        throw new Error();
                    if (node.getArguments().size() != 0)
                        throw new Error();
                    node.setEntity(globalEntity.getFunctionEntity("size"));
                    node.setType(new PrimaryType(PrimaryTypeList.INT));
                    return new PrimaryType(PrimaryTypeList.INT);
                }
                throw new Error();
            }
        } else if (node.getfunctionNode() instanceof IdentifierExpressionNode) {
            BaseEntity entity = currentEntity;
            while (!(entity instanceof ClassEntity)) {
                if (entity instanceof BlockEntity) {
                    VariableEntity variableEntity = ((BlockEntity) entity).get(((IdentifierExpressionNode) node.getfunctionNode()).getIdentifierName());
                    if (variableEntity != null)
                        if (variableEntity.getPosition().above(node.getPosition()))
                            throw new Error();
                }
                if (entity instanceof FunctionEntity) {
                    VariableEntity variableEntity = ((FunctionEntity) entity).get(((IdentifierExpressionNode) node.getfunctionNode()).getIdentifierName());
                    if (variableEntity != null)
                        if (variableEntity.getPosition().above(node.getPosition()))
                            throw new Error();
                }
                entity = entity.getParentEntity();
            }
            if (((ClassEntity) entity).hasFunctionEntity(((IdentifierExpressionNode) node.getfunctionNode()).getIdentifierName()))
                functionEntity = ((ClassEntity) entity).getFunctionEntity(((IdentifierExpressionNode) node.getfunctionNode()).getIdentifierName());
            else functionEntity = globalEntity.getFunctionEntity(((IdentifierExpressionNode) node.getfunctionNode()).getIdentifierName());
        } else throw new Error();
        node.setEntity(functionEntity);
        if (functionEntity.getParentEntity() != globalEntity) {
            if (functionEntity.getParameterList().size() != node.getArguments().size() + 1) throw new Error();
            for (int i = 1; i < functionEntity.getParameterList().size(); i++) {
                BaseType argumentType = visit(node.getArguments().get(i - 1));
                BaseType parameterType = functionEntity.getParameterList().get(i).getType();
                if (!parameterType.equals(argumentType)) throw new Error();
            }
        } else {
            if (functionEntity.getParameterList().size() != node.getArguments().size()) throw new Error();
            for (int i = 0; i < functionEntity.getParameterList().size(); i++) {
                BaseType argumentType = visit(node.getArguments().get(i));
                BaseType parameterType = functionEntity.getParameterList().get(i).getType();
                if (!parameterType.equals(argumentType)) throw new Error();
            }
        }
        node.setType(functionEntity.getReturnType());
        return functionEntity.getReturnType();
    }

    @Override
    public BaseType visitIdentifierExpressionNode(IdentifierExpressionNode node) {
        BaseEntity entity = currentEntity;
        while (entity != null) {
            if (entity instanceof BlockEntity) {
                VariableEntity variableEntity = ((BlockEntity) entity).get(node.getIdentifierName());
                if (variableEntity != null)
                    if (variableEntity.getPosition().above(node.getPosition())) {
                        node.setType(variableEntity.getType());
                        return variableEntity.getType();
                    }
            }
            if (entity instanceof FunctionEntity) {
                VariableEntity variableEntity = ((FunctionEntity) entity).get(node.getIdentifierName());
                if (variableEntity != null)
                    if (variableEntity.getPosition().above(node.getPosition())) {
                        node.setType(variableEntity.getType());
                        return variableEntity.getType();
                    }
            }
            if (entity instanceof ClassEntity) {
                if (entity == globalEntity) {
                    VariableEntity variableEntity = ((ClassEntity) entity).getVariableEntity(node.getIdentifierName());
                    if (variableEntity != null)
                        if (variableEntity.getPosition().above(node.getPosition())) {
                            node.setType(variableEntity.getType());
                            return variableEntity.getType();
                        }
                } else {
                    VariableEntity variableEntity = ((ClassEntity) entity).getVariableEntity(node.getIdentifierName());
                    if (variableEntity != null) {
                        node.setType(new AddressType(variableEntity.getType()));
                        return variableEntity.getType();
                    }
                }
            }
            entity = entity.getParentEntity();
        }
        throw new Error();
    }

    @Override
    public BaseType visitLiteralExpressionNode(LiteralExpressionNode node) {
        node.setType(node.getType());
        return node.getType();
    }

    @Override
    public BaseType visitUnaryExpressionNode(UnaryExpressionNode node) {
        OperatorList operator = node.getOperator();
        BaseType baseType = visit(node.getExpressionNode());
        if (operator == OperatorList.PREFIXINC || operator == OperatorList.PREFIXDEC || operator == OperatorList.SUFFIXINC || operator == OperatorList.SUFFIXDEC) {
            assignExpressionCheck(node.getExpressionNode());
            if (!(baseType instanceof PrimaryType) || ((PrimaryType) baseType).getType() != PrimaryTypeList.INT) throw new Error();
        }
        if (operator == OperatorList.POS || operator == OperatorList.NEG || operator == OperatorList.NOT)
            if (!(baseType instanceof PrimaryType) || ((PrimaryType) baseType).getType() != PrimaryTypeList.INT) throw new Error();
        if (operator == OperatorList.LOGICALNOT)
            if (!(baseType instanceof PrimaryType) || ((PrimaryType) baseType).getType() != PrimaryTypeList.BOOL) throw new Error();
        node.setType(baseType);
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
        if (!(currentEntity instanceof BlockEntity)) throw new Error();
        BaseEntity oldEntity = currentEntity;
        currentEntity = ((BlockEntity) currentEntity).get(node.getPosition());
        BaseType conditionType = visit(node.getConditionExpressionNode());
        if (!(conditionType instanceof PrimaryType)) throw new Error();
        if (((PrimaryType) conditionType).getType() != PrimaryTypeList.BOOL) throw new Error();
        visit(node.getThenStatementNode());
        if (node.getElseStatementNode() != null) visit(node.getElseStatementNode());
        currentEntity = oldEntity;
        return null;
    }

    @Override
    public BaseType visitLoopStatementNode(LoopStatementNode node) {
        BlockEntity oldEntity = (BlockEntity) currentEntity;
        currentEntity = ((BlockEntity) currentEntity).get(node.getPosition());
        BaseType conditionType = visit(node.getConditionExpressionNode());
        if (!(conditionType instanceof PrimaryType) || ((PrimaryType) conditionType).getType() != PrimaryTypeList.BOOL) throw new Error();
        if (node.getInitExpressionNode() != null) visit(node.getInitExpressionNode());
        if (node.getUpdateExpressionNode() != null) visit(node.getUpdateExpressionNode());
        visit(node.getBodyStatementNode());
        currentEntity = oldEntity;
        return null;
    }

    @Override
    public BaseType visitReturnStatementNode(ReturnStatementNode node) {
        BaseType returnType;
        if (node.getReturnExpressionNode() == null) returnType = new PrimaryType(PrimaryTypeList.VOID);
        else returnType = visit(node.getReturnExpressionNode());
        BaseEntity functionEntity = currentEntity;
        while (functionEntity != null) {
            if (functionEntity instanceof FunctionEntity) {
                if (returnType.equals(((FunctionEntity) functionEntity).getReturnType())) return null;
                else throw new Error();
            }
            functionEntity = functionEntity.getParentEntity();
        }
        throw new Error();
    }

    @Override
    public BaseType visitContinueStatementNode(ContinueStatementNode node) {
        checkInLoop();
        return null;
    }

    @Override
    public BaseType visitBreakStatementNode(BreakStatementNode node) {
        checkInLoop();
        return null;
    }

}
