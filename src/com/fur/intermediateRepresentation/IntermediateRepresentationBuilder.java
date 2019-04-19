package com.fur.intermediateRepresentation;

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
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class IntermediateRepresentationBuilder extends AbstractSyntaxTreeBaseVisitor<FunctionIRNode> {

    private TemplateName templateName = new TemplateName();
    private ClassEntity globalEntity;
    private BaseEntity currentEntity;
    private List<IRRegister> parameterRegisters;

    public IntermediateRepresentationBuilder(ClassEntity _globalEntity) {
        globalEntity = _globalEntity;
        currentEntity = globalEntity;
        getFunctionLabel();
    }

    private void getFunctionLabel() {
        for (BaseEntity entity : globalEntity.getScope().values()) {
            if (entity instanceof ClassEntity)
                for (BaseEntity memberFunctionEntity : ((ClassEntity) entity).getScope().values())
                    if (memberFunctionEntity instanceof FunctionEntity) {
                        ((FunctionEntity) memberFunctionEntity).setEntryLabel(new IRLabel());
                        ((FunctionEntity) memberFunctionEntity).setReturnLabel(new IRLabel());
                        while (parameterRegisters.size() < ((FunctionEntity) memberFunctionEntity).getParameterList().size() + 1)
                            parameterRegisters.add(new IRRegister(null));
                    }
            if (entity instanceof FunctionEntity) {
                ((FunctionEntity) entity).setEntryLabel(new IRLabel());
                ((FunctionEntity) entity).setReturnLabel(new IRLabel());
                while (parameterRegisters.size() < ((FunctionEntity) entity).getParameterList().size())
                    parameterRegisters.add(new IRRegister(null));
            }
        }
    }

    @Override
    public FunctionIRNode visitCompilationUnitNode(CompilationUnitNode node) {
        List<BaseIRNode> body = new ArrayList<>();
        for (BaseNode variableInitializeStatement : node.getBaseNodes())
            if (variableInitializeStatement instanceof ExpressionStatementNode)
                body.addAll(visit(variableInitializeStatement).getBodyNode());//TODO
        body.add(new FunctionCallIRNode(globalEntity.getFunctionEntity("main").getEntryLabel()));
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
                body.addAll(visit(baseNode).getBodyNode());//TODO
        }
        return new FunctionIRNode(body, null);
    }

    @Override
    public FunctionIRNode visitFunctionDeclarationNode(FunctionDeclarationNode node) {
        assert currentEntity instanceof ClassEntity;
        ClassEntity oldEntity = (ClassEntity) currentEntity;
        currentEntity = ((ClassEntity) currentEntity).getFunctionEntity(node.getName());
        List<BaseIRNode> body = new ArrayList<>();
        body.add(new LabelIRNode(((FunctionEntity) currentEntity).getEntryLabel()));
        if (oldEntity != globalEntity) {
            IRRegister parameterRegister = new IRRegister(new ClassType(node.getClassName()));
            VariableEntity parameterEntity = ((FunctionEntity) currentEntity).get("this");
            parameterEntity.setRegister(parameterRegister);
            body.add(new OperateIRNode(OperatorList.ALLOC, parameterRegister, null, null));
        }
        for (int i = 0; i < node.getParameterNodes().size(); i++) {
            VariableDeclarationNode parameterNode = node.getParameterNodes().get(i);
            IRRegister parameterRegister = new IRRegister(parameterNode.getTypeNode().getType());
            VariableEntity parameterEntity = ((FunctionEntity) currentEntity).getParameterList().get(i);
            parameterEntity.setRegister(parameterRegister);
            body.add(new OperateIRNode(OperatorList.ALLOC, parameterRegister, null, null));
        }
        IRRegister returnRegister = new IRRegister(((FunctionEntity) currentEntity).getReturnType());
        ((FunctionEntity) currentEntity).setReturnRegister(returnRegister);
        body.addAll(visit(node.getBlockStatementNodes()).getBodyNode());//TODO
        body.add(new LabelIRNode(((FunctionEntity) currentEntity).getReturnLabel()));
        body.add(new OperateIRNode(OperatorList.RETURN, returnRegister, null, null));
        currentEntity = oldEntity;
        return new FunctionIRNode(body, returnRegister);
    }

    @Override
    public FunctionIRNode visitBlockStatementNode(BlockStatementNode node) {
        BaseEntity oldEntity = currentEntity;
        if (currentEntity instanceof FunctionEntity) currentEntity = ((FunctionEntity) currentEntity).getBlockEntity();
        if (currentEntity instanceof BlockEntity) currentEntity = ((BlockEntity) currentEntity).get(node.getPosition());
        List<BaseIRNode> body = new ArrayList<>();
        for (BaseNode variableDeclarationNode : node.getStatementNodes())
            if (variableDeclarationNode instanceof VariableDeclarationNode)
                body.addAll(visit(variableDeclarationNode).getBodyNode());
        for (BaseNode statementNode : node.getStatementNodes())
            if (statementNode instanceof BaseStatementNode)
                body.addAll(visit(statementNode).getBodyNode());//TODO
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
        return super.visitBreakStatementNode(node);
    }

    @Override
    public FunctionIRNode visitVariableDeclarationNode(VariableDeclarationNode node) {
        IRRegister variableRegister = new IRRegister(node.getTypeNode().getType());
        assert currentEntity instanceof BlockEntity;
        VariableEntity variableEntity = ((BlockEntity) currentEntity).get(node.getName());
        variableEntity.setRegister(variableRegister);
        List<BaseIRNode> body = new ArrayList<>();
        body.add(new OperateIRNode(OperatorList.ALLOC, variableRegister, null, null));
        return new FunctionIRNode(body, variableRegister);
    }

    @Override
    public FunctionIRNode visitExpressionStatementNode(ExpressionStatementNode node) {
        return visit(node.getExpressionNode());
    }

    @Override
    public List<BaseIRNode> visitArrayExpressionNode(ArrayExpressionNode node) {
        List<BaseIRNode> address = visit(node.getAddress());
        List<BaseIRNode> index = visit(node.getIndex());
        List<BaseIRNode> body = new ArrayList<>();
        body.addAll(address);
        body.addAll(index);
        body.add(operate);
        assert address.getType() instanceof ArrayType;
        BaseType type = ((ArrayType) address.getType()).getBaseType();
        if (intOrBool(type)) body.add("MOV " + name + " [" + name + "]");
        return new IntermediateRepresentationNode(body, name, type);
    }

    @Override
    public IntermediateRepresentationNode visitBinaryExpressionNode(BinaryExpressionNode node) {
        IntermediateRepresentationNode leftExpression = visit(node.getLeftExpressionNode());
        IntermediateRepresentationNode rightExpression = visit(node.getRightExressionNode());
        List<String> code = new ArrayList<>();
        code.addAll(leftExpression.getCode());
        code.addAll(rightExpression.getCode());
        String name = templateName.getNew();
        String operator = "";
        if (node.getOperator() == OperatorList.ADD) operator = "ADD";
        if (node.getOperator() == OperatorList.SUB) operator = "SUB";
        if (node.getOperator() == OperatorList.MUL) operator = "MUL";
        if (node.getOperator() == OperatorList.DIV) operator = "DIV";
        if (node.getOperator() == OperatorList.MOD) operator = "MOD";
        if (node.getOperator() == OperatorList.LEFTSHIFT) operator = "LSH";
        if (node.getOperator() == OperatorList.RIGHTSHIFT) operator = "RSH";
        if (node.getOperator() == OperatorList.LEQ) operator = "LEQ";
        if (node.getOperator() == OperatorList.GEQ) operator = "GEQ";
        if (node.getOperator() == OperatorList.LT) operator = "SLT";
        if (node.getOperator() == OperatorList.GT) operator = "SGT";
        if (node.getOperator() == OperatorList.EQUAL) operator = "EQL";
        if (node.getOperator() == OperatorList.NOTEQUAL) operator = "NEQ";
        if (node.getOperator() == OperatorList.AND || node.getOperator() == OperatorList.LOGICALAND) operator = "AND";
        if (node.getOperator() == OperatorList.OR || node.getOperator() == OperatorList.LOGICALOR) operator = "OR";
        if (node.getOperator() == OperatorList.XOR) operator = "XOR";
        code.add(operator + " " + name + " " + leftExpression.getResult() + " " + rightExpression.getResult());
        return new IntermediateRepresentationNode(code, name, leftExpression.getType());
    }

    @Override
    public IntermediateRepresentationNode visitCreatorExpressionNode(CreatorExpressionNode node) {
        return null;
    }

    @Override
    public IntermediateRepresentationNode visitDotExpressionNode(DotExpressionNode node) {
        IntermediateRepresentationNode object = visit(node.getObjectExpressionNode());
        List<String> code = new ArrayList<>(object.getCode());
        assert object.getType() instanceof ClassType;
        ClassEntity classEntity = globalEntity.getClassEntity(((ClassType) object.getType()).getClassName());
        int index = classEntity.getIndex(node.getIdentifierExpressionNode().getIdentifierName());
        String name = templateName.getNew();
        String operate = "ADD " + name + " " + object.getResult() + " " + index * 8;
        code.add(operate);
        BaseType type = classEntity.getVariableEntity(node.getIdentifierExpressionNode().getIdentifierName()).getType();
        if (intOrBool(type)) code.add("MOV " + name + " [" + name + "]");
        return new IntermediateRepresentationNode(code, name, type);
    }

    @Override
    public IntermediateRepresentationNode visitFunctionExpressionNode(FunctionExpressionNode node) {
        List<String> code = new ArrayList<>();
        BaseExpressionNode function = node.getfunctionNode();
        StringBuilder operate;
        BaseType type;
        if (function instanceof DotExpressionNode) {
            IntermediateRepresentationNode functionNode = visit(((DotExpressionNode) function).getObjectExpressionNode());
            code.addAll(functionNode.getCode());
            BaseType classType = functionNode.getType();
            if (classType instanceof ClassType) {
                String className = ((ClassType) classType).getClassName();
                operate = new StringBuilder("CALL " + className + "__classFunction__" + ((DotExpressionNode) function).getIdentifierExpressionNode().getIdentifierName() + " " + functionNode.getResult());
                type = globalEntity.getClassEntity(className).getFunctionEntity(((DotExpressionNode) function).getIdentifierExpressionNode().getIdentifierName()).getReturnType();
            } else {
                operate = new StringBuilder("CALL " + "Array__classFunction__" + ((DotExpressionNode) function).getIdentifierExpressionNode().getIdentifierName() + " " + functionNode.getResult());
                type = new PrimaryType(PrimaryTypeList.INT);
            }
        } else {
            assert function instanceof IdentifierExpressionNode;
            operate = new StringBuilder("CALL " + ((IdentifierExpressionNode) function).getIdentifierName());
            type = globalEntity.getFunctionEntity(((IdentifierExpressionNode) function).getIdentifierName()).getReturnType();
        }
        for (BaseExpressionNode argument : node.getArguments()) {
            IntermediateRepresentationNode argumentNode = visit(argument);
            code.addAll(argumentNode.getCode());
            operate.append(" ").append(argumentNode.getResult());
        }
        code.add(operate.toString());
        if (!(type instanceof PrimaryType) || ((PrimaryType) type).getType() != PrimaryTypeList.VOID) {
            String name = templateName.getNew();
            code.add("MOC " + name);
            return new IntermediateRepresentationNode(code, name, type);
        } else return new IntermediateRepresentationNode(code, null, null);
    }

    @Override
    public IntermediateRepresentationNode visitIdentifierExpressionNode(IdentifierExpressionNode node) {
        BaseEntity entity = currentEntity;
        while (entity != null) {
            if (entity instanceof BlockEntity) {
                VariableEntity variableEntity = ((BlockEntity) entity).get(node.getIdentifierName());
                if (variableEntity != null)
                    if (variableEntity.getPosition().above(node.getPosition()))
                        return new IntermediateRepresentationNode(null, node.getIdentifierName(), variableEntity.getType());
            }
            if (entity instanceof FunctionEntity) {
                VariableEntity variableEntity = ((FunctionEntity) entity).get(node.getIdentifierName());
                if (variableEntity != null)
                    if (variableEntity.getPosition().above(node.getPosition()))
                        return new IntermediateRepresentationNode(null, node.getIdentifierName(), variableEntity.getType());
            }
            if (entity instanceof ClassEntity) {
                if (entity == globalEntity) {
                    VariableEntity variableEntity = ((ClassEntity) entity).getVariableEntity(node.getIdentifierName());
                    if (variableEntity != null)
                        if (variableEntity.getPosition().above(node.getPosition()))
                            return new IntermediateRepresentationNode(null, node.getIdentifierName(), variableEntity.getType());
                } else {
                    VariableEntity variableEntity = ((ClassEntity) entity).getVariableEntity(node.getIdentifierName());
                    if (variableEntity != null) {
                        int index = ((ClassEntity) entity).getIndex(node.getIdentifierName());
                        List<String> code = new ArrayList<>();
                        String name = templateName.getNew();
                        code.add("ADD " + name + " this " + index * 8);
                        if (intOrBool(variableEntity.getType())) code.add("MOV " + name + " [" + name + "] ");
                        return new IntermediateRepresentationNode(code, name, variableEntity.getType());
                    }
                }
            }
            entity = entity.getParentEntity();
        }
        return null;
    }

    @Override
    public IntermediateRepresentationNode visitLiteralExpressionNode(LiteralExpressionNode node) {
        String name = templateName.getNew();
        List<String> code = new ArrayList<>();
        if (node.getType() instanceof ClassType) code.add("MOV " + name + " " + stringStaticTable.get(node.getValue()));
        else code.add("MOV " + name + " " + node.getValue());
        return new IntermediateRepresentationNode(code, name, node.getType());
    }

    @Override
    public IntermediateRepresentationNode visitUnaryExpressionNode(UnaryExpressionNode node) {
        return super.visitUnaryExpressionNode(node);
    }
}
