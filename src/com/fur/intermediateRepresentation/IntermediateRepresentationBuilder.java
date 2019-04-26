package com.fur.intermediateRepresentation;

import com.fur.Position;
import com.fur.abstractSyntaxTree.AbstractSyntaxTreeBaseVisitor;
import com.fur.abstractSyntaxTree.node.*;
import com.fur.enumerate.OperatorList;
import com.fur.enumerate.PrimaryTypeList;
import com.fur.intermediateRepresentation.node.*;
import com.fur.symbolTable.Entity.*;
import com.fur.type.ArrayType;
import com.fur.type.BaseType;
import com.fur.type.ClassType;
import com.fur.type.PrimaryType;

import java.util.ArrayList;
import java.util.List;

public class IntermediateRepresentationBuilder extends AbstractSyntaxTreeBaseVisitor<FunctionIRNode> {

    private ClassEntity globalEntity;
    private BaseEntity currentEntity;
    private List<IRRegister> parameterIRRegisters;
    private List<BaseIRNode> constructorFunction;

    public IntermediateRepresentationBuilder(ClassEntity _globalEntity) {
        globalEntity = _globalEntity;
        currentEntity = globalEntity;
        parameterIRRegisters = new ArrayList<>();
        constructorFunction = getFunctionLabel().getBodyNode();
    }

    private FunctionIRNode getFunctionLabel() {
        List<BaseIRNode> body = new ArrayList<>();
        for (String name : globalEntity.getScope().keySet()) {
            BaseEntity entity = globalEntity.getScope().get(name);
            if (entity instanceof ClassEntity) {
                for (BaseEntity memberFunctionEntity : ((ClassEntity) entity).getScope().values())
                    if (memberFunctionEntity instanceof FunctionEntity) {
                        ((FunctionEntity) memberFunctionEntity).setEntryLabel(new IRLabel());
                        ((FunctionEntity) memberFunctionEntity).setReturnLabel(new IRLabel());
                        while (parameterIRRegisters.size() < ((FunctionEntity) memberFunctionEntity).getParameterList().size() + 1)
                            parameterIRRegisters.add(new IRRegister());
                    }
                if (((ClassEntity) entity).getFunctionEntity(name) == null) {
                    FunctionEntity constructorEntity = new FunctionEntity(entity, entity.getPosition());
                    IRLabel entryLabel = new IRLabel();
                    constructorEntity.setEntryLabel(entryLabel);
                    IRLabel returnLabel = new IRLabel();
                    constructorEntity.setReturnLabel(returnLabel);
                    ((ClassEntity) entity).putNew(name, constructorEntity);
                    IRRegister destIRRegister = new IRRegister();
                    body.add(new LabelIRNode(entryLabel));
                    body.add(new OperateIRNode(OperatorList.MALLOC, destIRRegister, ((ClassEntity) entity).getSize()));
                    body.add(new LabelIRNode(returnLabel));
                    body.add(new OperateIRNode(OperatorList.RETURN, destIRRegister, null, null));
                }
            }
            if (entity instanceof FunctionEntity) {
                ((FunctionEntity) entity).setEntryLabel(new IRLabel());
                ((FunctionEntity) entity).setReturnLabel(new IRLabel());
                while (parameterIRRegisters.size() < ((FunctionEntity) entity).getParameterList().size())
                    parameterIRRegisters.add(new IRRegister());
            }
        }
        return new FunctionIRNode(body, null);
    }

    private BaseType getArrayType(BaseType baseType, int dimension) {
        if (dimension == 0) return baseType;
        return new ArrayType(getArrayType(baseType, dimension - 1));
    }

    @Override
    public FunctionIRNode visitCompilationUnitNode(CompilationUnitNode node) {
        List<BaseIRNode> body = new ArrayList<>();
        for (BaseNode variableInitializeStatement : node.getBaseNodes())
            if (variableInitializeStatement instanceof ExpressionStatementNode)
                body.addAll(visit(variableInitializeStatement).getBodyNode());
        body.add(new FunctionCallIRNode(globalEntity.getFunctionEntity("main").getEntryLabel()));
        body.addAll(constructorFunction);
        for (BaseNode baseNode : node.getBaseNodes()) {
            if (baseNode instanceof ClassDeclarationNode) {
                currentEntity = globalEntity.getClassEntity(((ClassDeclarationNode) baseNode).getName());
                for (FunctionDeclarationNode memberFunctionNode : ((ClassDeclarationNode) baseNode).getFunctionDeclarationNodes()) {
                    FunctionIRNode function = visit(memberFunctionNode);
                    body.addAll(function.getBodyNode());
                }
                currentEntity = globalEntity;
            }
            if (baseNode instanceof FunctionDeclarationNode)
                body.addAll(visit(baseNode).getBodyNode());
        }
        return new FunctionIRNode(body, null);
    }

    @Override
    public FunctionIRNode visitFunctionDeclarationNode(FunctionDeclarationNode node) {
        assert currentEntity instanceof ClassEntity;
        ClassEntity oldEntity = (ClassEntity) currentEntity;
        currentEntity = ((ClassEntity) currentEntity).getFunctionEntity(node.getName());
        List<BaseIRNode> body = new ArrayList<>();
        IRRegister destIRRegister = new IRRegister();
        body.add(new LabelIRNode(((FunctionEntity) currentEntity).getEntryLabel()));
        if (oldEntity != globalEntity) {
            IRRegister parameterRegister = new IRRegister();
            VariableEntity parameterEntity = ((FunctionEntity) currentEntity).get("this");
            parameterEntity.setIRRegister(parameterRegister);
            body.add(new OperateIRNode(OperatorList.ALLOC, parameterRegister, null, null));
        }
        for (VariableEntity parameterEntity : ((FunctionEntity) currentEntity).getParameterList()) {
            IRRegister parameterRegister = new IRRegister();
            parameterEntity.setIRRegister(parameterRegister);
            body.add(new OperateIRNode(OperatorList.ALLOC, parameterRegister, null, null));
        }
        destIRRegister.setType(node.getTypeNode().getType());
        ((FunctionEntity) currentEntity).setReturnRegister(destIRRegister);
        for (int i = 0; i < ((FunctionEntity) currentEntity).getParameterList().size(); i++) {
            VariableEntity parameterEntity = ((FunctionEntity) currentEntity).getParameterList().get(i);
            IRRegister parameterRegister = parameterEntity.getIRRegister();
            body.add(new OperateIRNode(OperatorList.ASSIGN, parameterRegister, parameterIRRegisters.get(i), null));
        }
        body.addAll(visit(node.getBlockStatementNodes()).getBodyNode());
        body.add(new LabelIRNode(((FunctionEntity) currentEntity).getReturnLabel()));
        body.add(new OperateIRNode(OperatorList.RETURN, destIRRegister, null, null));
        currentEntity = oldEntity;
        return new FunctionIRNode(body, destIRRegister);
    }

    @Override
    public FunctionIRNode visitReturnStatementNode(ReturnStatementNode node) {
        BaseEntity functionEntity = currentEntity;
        while (!(functionEntity instanceof FunctionEntity)) functionEntity = functionEntity.getParentEntity();
        List<BaseIRNode> body = new ArrayList<>();
        if (node.getReturnExpressionNode() != null){
            FunctionIRNode returnExpression = visit(node.getReturnExpressionNode());
            body.addAll(returnExpression.getBodyNode());
            body.add(new OperateIRNode(OperatorList.ASSIGN, ((FunctionEntity) functionEntity).getReturnRegister(), returnExpression.getReturnRegister(), null));
        }
        body.add(new BranchIRNode(null, ((FunctionEntity) functionEntity).getReturnLabel(), null));
        return new FunctionIRNode(body, null);
    }

    @Override
    public FunctionIRNode visitBlockStatementNode(BlockStatementNode node) {
        BaseEntity oldEntity = currentEntity;
        if (currentEntity instanceof BlockEntity) currentEntity = ((BlockEntity) currentEntity).get(node.getPosition());
        if (currentEntity instanceof FunctionEntity) currentEntity = ((FunctionEntity) currentEntity).getBlockEntity();
        List<BaseIRNode> body = new ArrayList<>();
        for (BaseNode variableDeclarationNode : node.getStatementNodes())
            if (variableDeclarationNode instanceof VariableDeclarationNode)
                body.addAll(visit(variableDeclarationNode).getBodyNode());
        for (BaseNode statementNode : node.getStatementNodes())
            if (statementNode instanceof BaseStatementNode)
                body.addAll(visit(statementNode).getBodyNode());
        currentEntity = oldEntity;
        return new FunctionIRNode(body, null);
    }

    @Override
    public FunctionIRNode visitLoopStatementNode(LoopStatementNode node) {
        BaseEntity oldEntity = currentEntity;
        assert currentEntity instanceof BlockEntity;
        currentEntity = ((BlockEntity) currentEntity).get(node.getPosition());
        assert currentEntity instanceof LoopEntity;
        IRLabel conditionLabel = new IRLabel();
        ((LoopEntity) currentEntity).setConditionLabel(conditionLabel);
        IRLabel continueLabel = new IRLabel();
        ((LoopEntity) currentEntity).setContinueLabel(continueLabel);
        IRLabel breakLabel = new IRLabel();
        ((LoopEntity) currentEntity).setBreakLabel(breakLabel);
        List<BaseIRNode> body = new ArrayList<>();
        if (node.getInitExpressionNode() != null)
            body.addAll(visit(node.getInitExpressionNode()).getBodyNode());
        body.add(new LabelIRNode(conditionLabel));
        FunctionIRNode conditionExpression = visit(node.getConditionExpressionNode());
        body.addAll(conditionExpression.getBodyNode());
        body.add(new BranchIRNode(conditionExpression.getReturnRegister(), conditionLabel, breakLabel));
        body.add(new LabelIRNode(continueLabel));
        FunctionIRNode bodyExpression = visit(node.getBodyStatementNode());
        body.addAll(bodyExpression.getBodyNode());
        FunctionIRNode updateExpression = visit(node.getUpdateExpressionNode());
        body.addAll(updateExpression.getBodyNode());
        body.add(new BranchIRNode(null, conditionLabel, null));
        body.add(new LabelIRNode(breakLabel));
        currentEntity = oldEntity;
        return new FunctionIRNode(body, null);
    }

    @Override
    public FunctionIRNode visitBreakStatementNode(BreakStatementNode node) {
        BaseEntity loopEntity = currentEntity;
        List<BaseIRNode> body = new ArrayList<>();
        while (!(loopEntity instanceof LoopEntity)) loopEntity = loopEntity.getParentEntity();
        body.add(new BranchIRNode(null, ((LoopEntity) loopEntity).getBreakLabel(), null));
        return new FunctionIRNode(body, null);
    }

    @Override
    public FunctionIRNode visitContinueStatementNode(ContinueStatementNode node) {
        BaseEntity loopEntity = currentEntity;
        List<BaseIRNode> body = new ArrayList<>();
        while (!(loopEntity instanceof LoopEntity)) loopEntity = loopEntity.getParentEntity();
        body.add(new BranchIRNode(null, ((LoopEntity) loopEntity).getConditionLabel(), null));
        return new FunctionIRNode(body, null);
    }

    @Override
    public FunctionIRNode visitIfStatementNode(IfStatementNode node) {
        BaseEntity oldEntity = currentEntity;
        assert currentEntity instanceof BlockEntity;
        currentEntity = ((BlockEntity) currentEntity).get(node.getPosition());
        assert currentEntity instanceof IfEntity;
        IRLabel thenLabel = new IRLabel();
        ((IfEntity) currentEntity).setThenLabel(thenLabel);
        IRLabel elseLabel = new IRLabel();
        ((IfEntity) currentEntity).setElseLabel(elseLabel);
        IRLabel endLabel = new IRLabel();
        ((IfEntity) currentEntity).setEndLabel(endLabel);
        FunctionIRNode conditionExpression = visit(node.getConditionExpressionNode());
        List<BaseIRNode> body = new ArrayList<>(conditionExpression.getBodyNode());
        body.add(new BranchIRNode(conditionExpression.getReturnRegister(), thenLabel, elseLabel));
        body.add(new LabelIRNode(thenLabel));
        body.addAll(visit(node.getThenStatementNode()).getBodyNode());
        body.add(new BranchIRNode(null, endLabel, null));
        body.add(new LabelIRNode(elseLabel));
        body.addAll(visit(node.getThenStatementNode()).getBodyNode());
        body.add(new BranchIRNode(null, endLabel, null));
        body.add(new LabelIRNode(endLabel));
        currentEntity = oldEntity;
        return new FunctionIRNode(body, null);
    }

    @Override
    public FunctionIRNode visitVariableDeclarationNode(VariableDeclarationNode node) {
        IRRegister variableRegister = new IRRegister();
        variableRegister.setType(node.getTypeNode().getType());
        assert currentEntity instanceof BlockEntity;
        VariableEntity variableEntity = ((BlockEntity) currentEntity).get(node.getName());
        variableEntity.setIRRegister(variableRegister);
        List<BaseIRNode> body = new ArrayList<>();
        body.add(new OperateIRNode(OperatorList.ALLOC, variableRegister, null, null));
        return new FunctionIRNode(body, variableRegister);
    }

    @Override
    public FunctionIRNode visitExpressionStatementNode(ExpressionStatementNode node) {
        return visit(node.getExpressionNode());
    }

    @Override
    public FunctionIRNode visitArrayExpressionNode(ArrayExpressionNode node) {
        FunctionIRNode address = visit(node.getAddress());
        FunctionIRNode index = visit(node.getIndex());
        List<BaseIRNode> body = new ArrayList<>();
        body.addAll(address.getBodyNode());
        body.addAll(index.getBodyNode());
        IRRegister addressIRRegister = new IRRegister();
        addressIRRegister.setType(((ArrayType) address.getReturnRegister().getType()).getBaseType());
        body.add(new AddIRNode(addressIRRegister, address.getReturnRegister()));
        body.add(new AddIRNode(addressIRRegister, index.getReturnRegister()));
        IRRegister destIRRegister = new IRRegister();
        body.add(new OperateIRNode(OperatorList.MEMORY, destIRRegister, addressIRRegister, null));
        return new FunctionIRNode(body, destIRRegister);
    }

    @Override
    public FunctionIRNode visitBinaryExpressionNode(BinaryExpressionNode node) {
        FunctionIRNode leftExpression = visit(node.getLeftExpressionNode());
        FunctionIRNode rightExpression = visit(node.getRightExressionNode());
        List<BaseIRNode> body = new ArrayList<>();
        body.addAll(leftExpression.getBodyNode());
        body.addAll(rightExpression.getBodyNode());
        if (node.getOperator() == OperatorList.ASSIGN) {
            body.add(new OperateIRNode(OperatorList.ASSIGN, leftExpression.getReturnRegister(), rightExpression.getReturnRegister(), null));
            return new FunctionIRNode(body, leftExpression.getReturnRegister());
        } else {
            IRRegister destIRRegister = new IRRegister();
            body.add(new OperateIRNode(node.getOperator(), destIRRegister, leftExpression.getReturnRegister(), rightExpression.getReturnRegister()));
            return new FunctionIRNode(body, destIRRegister);
        }
    }

    @Override
    public FunctionIRNode visitCreatorExpressionNode(CreatorExpressionNode node) {
        List<BaseIRNode> body = new ArrayList<>();
        IRRegister destIRRegister = new IRRegister();
        if (node.getFixedDimension().size() == 0) {
            body.add(new OperateIRNode(OperatorList.MALLOC, destIRRegister, null, null));
            if (node.getRestDimension() == 0) {
                BaseType type = node.getTypeNode().getType();
                if (type instanceof ClassType) {
                    String className = ((ClassType) type).getClassName();
                    FunctionEntity constructorEntity = globalEntity.getClassEntity(className).getFunctionEntity(className);
                    body.add(new FunctionCallIRNode(constructorEntity.getEntryLabel()));
                    body.add(new OperateIRNode(OperatorList.ASSIGN, destIRRegister, constructorEntity.getReturnRegister(), null));
                }
            }
        } else {
            FunctionIRNode dimension = visit(node.getFixedDimension().get(0));
            body.add(new OperateIRNode(OperatorList.MALLOC, destIRRegister, dimension.getReturnRegister(), null));
            List<BaseExpressionNode> fixedDimension = new ArrayList<>();
            for (int i = 1; i < node.getFixedDimension().size(); i++) fixedDimension.add(node.getFixedDimension().get(i));
            CreatorExpressionNode baseCreatorExpression = new CreatorExpressionNode(node.getTypeNode(), fixedDimension, node.getRestDimension(), (Position) null);
            FunctionIRNode baseCreator = visit(baseCreatorExpression);
            IRRegister iteratorIRRegister = new IRRegister();
            body.add(new OperateIRNode(OperatorList.ALLOC, iteratorIRRegister, null, null));
            IRLabel conditionLabel = new IRLabel();
            IRLabel continueLabel = new IRLabel();
            IRLabel breakLabel = new IRLabel();
            body.add(new LabelIRNode(conditionLabel));
            IRRegister conditionIRRegister = new IRRegister();
            body.add(new OperateIRNode(OperatorList.LT, conditionIRRegister, iteratorIRRegister, dimension.getReturnRegister()));
            body.add(new BranchIRNode(conditionIRRegister, conditionLabel, breakLabel));
            body.add(new LabelIRNode(continueLabel));
            body.addAll(baseCreator.getBodyNode());
            IRRegister addressIRRegister = new IRRegister();
            IRRegister elementIRRegister = new IRRegister();
            body.add(new AddIRNode(addressIRRegister, destIRRegister));
            body.add(new AddIRNode(addressIRRegister, iteratorIRRegister));
            body.add(new OperateIRNode(OperatorList.MEMORY, elementIRRegister, addressIRRegister, null));
            body.add(new OperateIRNode(OperatorList.ASSIGN, elementIRRegister, baseCreator.getReturnRegister(), null));
            body.add(new AddIRNode(iteratorIRRegister, 1));
            body.add(new BranchIRNode(null, conditionLabel, null));
            body.add(new LabelIRNode(breakLabel));
        }
        destIRRegister.setType(getArrayType(node.getTypeNode().getType(), node.getFixedDimension().size() + node.getRestDimension()));
        return new FunctionIRNode(body, destIRRegister);
    }

    @Override
    public FunctionIRNode visitDotExpressionNode(DotExpressionNode node) {
        IRRegister addressIRRegister = new IRRegister();
        IRRegister destIRRegister = new IRRegister();
        FunctionIRNode object = visit(node.getObjectExpressionNode());
        List<BaseIRNode> body = new ArrayList<>(object.getBodyNode());
        ClassType classType = (ClassType) object.getReturnRegister().getType();
        String member = node.getIdentifierExpressionNode().getIdentifierName();
        ClassEntity classEntity = globalEntity.getClassEntity(classType.getClassName());
        int index = classEntity.getIndex(member);
        body.add(new AddIRNode(addressIRRegister, object.getReturnRegister()));
        body.add(new AddIRNode(addressIRRegister, index));
        body.add(new OperateIRNode(OperatorList.MEMORY, destIRRegister, addressIRRegister, null));
        return new FunctionIRNode(body, destIRRegister);
    }

    @Override
    public FunctionIRNode visitFunctionExpressionNode(FunctionExpressionNode node) {
        List<BaseIRNode> body = new ArrayList<>();
        IRRegister destIRRegister = new IRRegister();
        if (node.getfunctionNode() instanceof DotExpressionNode) {
            FunctionIRNode objectNode = visit(((DotExpressionNode) node.getfunctionNode()).getObjectExpressionNode());
            ClassType classType = (ClassType) objectNode.getReturnRegister().getType();
            FunctionEntity functionEntity = globalEntity.getClassEntity(classType.getClassName()).getFunctionEntity(((DotExpressionNode) node.getfunctionNode()).getIdentifierExpressionNode().getIdentifierName());
            body.addAll(objectNode.getBodyNode());
            body.add(new OperateIRNode(OperatorList.ASSIGN, parameterIRRegisters.get(0), objectNode.getReturnRegister(), null));
            for (int i = 0; i < node.getArguments().size(); i++) {
                FunctionIRNode argumentNode = visit(node.getArguments().get(i));
                IRRegister parameterIRRegister = parameterIRRegisters.get(i + 1);
                body.addAll(argumentNode.getBodyNode());
                body.add(new OperateIRNode(OperatorList.ASSIGN, parameterIRRegister, argumentNode.getReturnRegister(), null));
            }
            body.add(new FunctionCallIRNode(functionEntity.getEntryLabel()));
            body.add(new OperateIRNode(OperatorList.ASSIGN, destIRRegister, functionEntity.getReturnRegister(), null));
        } else {
            assert node.getfunctionNode() instanceof IdentifierExpressionNode;
            FunctionEntity functionEntity = globalEntity.getFunctionEntity(((IdentifierExpressionNode) node.getfunctionNode()).getIdentifierName());
            for (int i = 0; i < node.getArguments().size(); i++) {
                FunctionIRNode argumentNode = visit(node.getArguments().get(i));
                IRRegister parameterIRRegister = parameterIRRegisters.get(i);
                body.addAll(argumentNode.getBodyNode());
                body.add(new OperateIRNode(OperatorList.ASSIGN, parameterIRRegister, argumentNode.getReturnRegister(), null));
            }
            body.add(new FunctionCallIRNode(functionEntity.getEntryLabel()));
            body.add(new OperateIRNode(OperatorList.ASSIGN, destIRRegister, functionEntity.getReturnRegister(), null));
        }
        return new FunctionIRNode(body, destIRRegister);
    }

    @Override
    public FunctionIRNode visitIdentifierExpressionNode(IdentifierExpressionNode node) {
        BaseEntity entity = currentEntity;
        FunctionEntity functionEntity = null;
        while (entity != null) {
            if (entity instanceof BlockEntity) {
                VariableEntity variableEntity = ((BlockEntity) entity).get(node.getIdentifierName());
                if (variableEntity != null)
                    if (variableEntity.getPosition().above(node.getPosition()))
                        return new FunctionIRNode(new ArrayList<>(), variableEntity.getIRRegister());
            }
            if (entity instanceof FunctionEntity) {
                functionEntity = (FunctionEntity) entity;
                VariableEntity variableEntity = ((FunctionEntity) entity).get(node.getIdentifierName());
                if (variableEntity != null)
                    if (variableEntity.getPosition().above(node.getPosition()))
                        return new FunctionIRNode(new ArrayList<>(), variableEntity.getIRRegister());
            }
            if (entity instanceof ClassEntity) {
                if (entity == globalEntity) {
                    VariableEntity variableEntity = ((ClassEntity) entity).getVariableEntity(node.getIdentifierName());
                    if (variableEntity != null)
                        if (variableEntity.getPosition().above(node.getPosition()))
                            return new FunctionIRNode(new ArrayList<>(), variableEntity.getIRRegister());
                } else {
                    VariableEntity variableEntity = ((ClassEntity) entity).getVariableEntity(node.getIdentifierName());
                    if (variableEntity != null) {
                        assert functionEntity != null;
                        IRRegister thisIRRegister = functionEntity.getParameterList().get(0).getIRRegister();
                        List<BaseIRNode> body = new ArrayList<>();
                        int index = ((ClassEntity) entity).getIndex(node.getIdentifierName());
                        IRRegister indexIRRegister = new IRRegister();
                        body.add(new OperateIRNode(OperatorList.ASSIGN, indexIRRegister, index));
                        IRRegister destIRRegister = new IRRegister();
                        body.add(new AddIRNode(destIRRegister, thisIRRegister));
                        body.add(new AddIRNode(destIRRegister, indexIRRegister));
                        if (variableEntity.getType() instanceof PrimaryType)
                            body.add(new OperateIRNode(OperatorList.MEMORY, destIRRegister, destIRRegister, null));
                        destIRRegister.setType(variableEntity.getType());
                        return new FunctionIRNode(body, destIRRegister);
                    }
                }
            }
            entity = entity.getParentEntity();
        }
        return null;
    }

    @Override
    public FunctionIRNode visitLiteralExpressionNode(LiteralExpressionNode node) {
        List<BaseIRNode> body = new ArrayList<>();
        IRRegister destIRRegister = new IRRegister();
        if (node.getType() instanceof ClassType) {
            IRRegister lengthIRRegister = new IRRegister();
            body.add(new OperateIRNode(OperatorList.ASSIGN, lengthIRRegister, node.getValue().length()));
            body.add(new OperateIRNode(OperatorList.MALLOC, destIRRegister, lengthIRRegister, null));
            for (int i = 0; i < node.getValue().length(); i++) {
                IRRegister addressIRRegister = new IRRegister();
                IRRegister charIRRegister = new IRRegister();
                body.add(new AddIRNode(addressIRRegister, destIRRegister));
                body.add(new AddIRNode(addressIRRegister, i));
                body.add(new OperateIRNode(OperatorList.MEMORY, charIRRegister, addressIRRegister, null));
                body.add(new OperateIRNode(OperatorList.ASSIGN, charIRRegister, ((int) node.getValue().charAt(i))));
            }
            destIRRegister.setType(new ClassType("string"));
        } else {
            assert node.getType() instanceof PrimaryType;
            if (((PrimaryType) node.getType()).getType() == PrimaryTypeList.BOOL) {
                if (node.getValue().equals("true")) body.add(new OperateIRNode(OperatorList.ASSIGN, destIRRegister, 1));
                else body.add(new OperateIRNode(OperatorList.ASSIGN, destIRRegister, 0));
            } else body.add(new OperateIRNode(OperatorList.ASSIGN, destIRRegister, Integer.parseInt(node.getValue())));
            destIRRegister.setType(new PrimaryType(PrimaryTypeList.INT));
        }
        return new FunctionIRNode(body, destIRRegister);
    }

    @Override
    public FunctionIRNode visitUnaryExpressionNode(UnaryExpressionNode node) {
        IRRegister destIRRegister = new IRRegister();
        FunctionIRNode expression = visit(node.getExpressionNode());
        List<BaseIRNode> body = new ArrayList<>(expression.getBodyNode());
        body.add(new OperateIRNode(node.getOperator(), destIRRegister, expression.getReturnRegister(), null));
        return new FunctionIRNode(body, destIRRegister);
    }

}
