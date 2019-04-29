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
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class IntermediateRepresentationBuilder extends AbstractSyntaxTreeBaseVisitor<FunctionIRNode> {

    private ClassEntity globalEntity;
    private BaseEntity currentEntity;
    private List<IRRegister> parameterIRRegisters = new ArrayList<>();
    private List<BaseIRNode> constructorFunction;
    private List<IRRegister> reallocateIRRegisters = new ArrayList<>();

    public IntermediateRepresentationBuilder(ClassEntity _globalEntity) {
        globalEntity = _globalEntity;
        currentEntity = globalEntity;
        constructorFunction = getFunctionLabel().getBodyNode();
    }

    private FunctionIRNode getFunctionLabel() {
        List<BaseIRNode> body = new ArrayList<>();
        for (String name : globalEntity.getScope().keySet()) {
            BaseEntity entity = globalEntity.getScope().get(name);
            if (entity instanceof ClassEntity) {
                for (BaseEntity memberFunctionEntity : ((ClassEntity) entity).getScope().values())
                    if (memberFunctionEntity instanceof FunctionEntity) {
                        ((FunctionEntity) memberFunctionEntity).setEntryLabel(new LabelIRNode());
                        ((FunctionEntity) memberFunctionEntity).setReturnLabel(new LabelIRNode());
                        while (parameterIRRegisters.size() < ((FunctionEntity) memberFunctionEntity).getParameterList().size() + 1)
                            parameterIRRegisters.add(new IRRegister());
                    }
                if (!((ClassEntity) entity).hasFunctionEntity(name)) {
                    FunctionEntity constructorEntity = new FunctionEntity(entity, entity.getPosition());
                    LabelIRNode entryLabel = new LabelIRNode();
                    constructorEntity.setEntryLabel(entryLabel);
                    LabelIRNode returnLabel = new LabelIRNode();
                    constructorEntity.setReturnLabel(returnLabel);
                    ((ClassEntity) entity).putNew(name, constructorEntity);
                    IRRegister destIRRegister = new IRRegister();
                    body.add(entryLabel);
                    body.add(new OpIRNode(OperatorList.MALLOC, destIRRegister, ((ClassEntity) entity).getSize()));
                    body.add(returnLabel);
                    body.add(new RetIRNode());
                }
            }
            if (entity instanceof FunctionEntity) {
                ((FunctionEntity) entity).setEntryLabel(new LabelIRNode());
                ((FunctionEntity) entity).setReturnLabel(new LabelIRNode());
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
    
    private IRRegister reallocate(IRRegister irRegister) {
        if (irRegister.getReallocate() != null)
            return irRegister.getReallocate();
        Map<IRRegister, Boolean> reallocateMap = new HashMap<>();
        for (IRRegister reallocateIRRegister : reallocateIRRegisters)
            reallocateMap.put(reallocateIRRegister, true);
        for (IRRegister nearbyIRRegister : irRegister.getNearbyIRRegisters())
            reallocateMap.put(nearbyIRRegister.getReallocate(), false);
        for (IRRegister reallocateIRRegister : reallocateIRRegisters)
            if (reallocateMap.get(reallocateIRRegister)) {
                irRegister.setReallocate(reallocateIRRegister);
                return reallocateIRRegister;
            }
        IRRegister reallocateIRRegister = new IRRegister();
        reallocateIRRegisters.add(reallocateIRRegister);
        irRegister.setReallocate(reallocateIRRegister);
        return reallocateIRRegister;
    }

    private List<BaseIRNode> liveAnalyze(List<BaseIRNode> instructions) {
        while (true) {
            boolean diff = false;
            for (int i = 0; i < instructions.size() - 1; i++) {
                BaseIRNode instruction = instructions.get(i);
                List<IRRegister> liveIRRegister = new ArrayList<>(instruction.getLiveIRRegister());
                if (instruction instanceof BranchIRNode) {
                    instruction.getLiveIRRegister().addAll(((BranchIRNode) instruction).getTrueDestIRNode().getLiveIRRegister());
                    instruction.getLiveIRRegister().addAll(((BranchIRNode) instruction).getFalseDestIDNode().getLiveIRRegister());
                } else if (instruction instanceof JumpIRNode)
                    instruction.getLiveIRRegister().addAll(((JumpIRNode) instruction).getDestLabelNode().getLiveIRRegister());
                else if (instruction instanceof CallIRNode)
                    instruction.getLiveIRRegister().addAll(((CallIRNode) instruction).getFunctionEntry().getLiveIRRegister());
                else instruction.getLiveIRRegister().addAll(instructions.get(i + 1).getLiveIRRegister());
                if (instruction instanceof CmpIRNode)
                    instruction.getLiveIRRegister().remove(((CmpIRNode) instruction).getDestIRRegister());
                if (instruction instanceof OpIRNode)
                    if (((OpIRNode) instruction).getOperator() == OperatorList.ASSIGN)
                        instruction.getLiveIRRegister().remove(((OpIRNode) instruction).getDestIRRegister());
                if (instruction instanceof BranchIRNode)
                    instruction.getLiveIRRegister().add(((BranchIRNode) instruction).getConditionRegister());
                if (instruction instanceof CmpIRNode) {
                    instruction.getLiveIRRegister().add(((CmpIRNode) instruction).getOperateIRRegister1());
                    instruction.getLiveIRRegister().add(((CmpIRNode) instruction).getOperateIRRegister2());
                }
                if (instruction instanceof OpIRNode)
                    if (((OpIRNode) instruction).getSourceIRRegister() != null)
                        instruction.getLiveIRRegister().add(((OpIRNode) instruction).getSourceIRRegister());
                if (liveIRRegister.size() != instruction.getLiveIRRegister().size()) diff = true;
                else {
                    int j = 0;
                    for (IRRegister live : instruction.getLiveIRRegister())
                        if (live != liveIRRegister.get(j++)) diff = true;
                }
            }
            if (!diff) break;
        }
        for (BaseIRNode instruction : instructions)
            for (IRRegister irRegister1 : instruction.getLiveIRRegister())
                for (IRRegister irRegister2 : instruction.getLiveIRRegister())
                    irRegister1.getNearbyIRRegisters().add(irRegister2);
        for (BaseIRNode instruction : instructions) {
            if (instruction instanceof BranchIRNode)
                ((BranchIRNode) instruction).setConditionRegister(reallocate(((BranchIRNode) instruction).getConditionRegister()));
            if (instruction instanceof CmpIRNode) {
                ((CmpIRNode) instruction).setDestIRRegister(reallocate(((CmpIRNode) instruction).getDestIRRegister()));
                ((CmpIRNode) instruction).setOperateIRRegister1(reallocate(((CmpIRNode) instruction).getOperateIRRegister1()));
                ((CmpIRNode) instruction).setOperateIRRegister2(reallocate(((CmpIRNode) instruction).getOperateIRRegister2()));
            }
            if (instruction instanceof OpIRNode) {
                ((OpIRNode) instruction).setDestIRRegister(reallocate(((OpIRNode) instruction).getDestIRRegister()));
                if (((OpIRNode) instruction).getSourceIRRegister() != null)
                    ((OpIRNode) instruction).setSourceIRRegister(reallocate(((OpIRNode) instruction).getSourceIRRegister()));
            }
        }
        List<BaseIRNode> code = new ArrayList<>();
        for (BaseIRNode instruction : instructions) {
            if (instruction instanceof OpIRNode)
                if (((OpIRNode) instruction).getOperator() == OperatorList.ASSIGN)
                    if (((OpIRNode) instruction).getSourceIRRegister() == ((OpIRNode) instruction).getDestIRRegister())
                        continue;
            code.add(instruction);
        }
        return code;
    }

    @Override
    public FunctionIRNode visitCompilationUnitNode(CompilationUnitNode node) {
        List<BaseIRNode> body = new ArrayList<>();
        for (BaseNode variableDeclarationNode : node.getBaseNodes())
            if (variableDeclarationNode instanceof VariableDeclarationNode)
                body.addAll(visit(variableDeclarationNode).getBodyNode());
        for (BaseNode variableInitializeStatement : node.getBaseNodes())
            if (variableInitializeStatement instanceof ExpressionStatementNode)
                body.addAll(visit(variableInitializeStatement).getBodyNode());
        body.add(new CallIRNode(globalEntity.getFunctionEntity("main").getEntryLabel()));
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
        body.add(new LabelIRNode());
        body = liveAnalyze(body);
        return new FunctionIRNode(body, null);
    }

    @Override
    public FunctionIRNode visitFunctionDeclarationNode(FunctionDeclarationNode node) {
        assert currentEntity instanceof ClassEntity;
        ClassEntity oldEntity = (ClassEntity) currentEntity;
        currentEntity = ((ClassEntity) currentEntity).getFunctionEntity(node.getName());
        List<BaseIRNode> body = new ArrayList<>();
        IRRegister destIRRegister = new IRRegister();
        body.add(((FunctionEntity) currentEntity).getEntryLabel());
        if (oldEntity != globalEntity) {
            IRRegister parameterRegister = new IRRegister();
            VariableEntity parameterEntity = ((FunctionEntity) currentEntity).get("this");
            parameterEntity.setIRRegister(parameterRegister);
            body.add(new OpIRNode(OperatorList.ASSIGN, parameterRegister, 0));
        }
        for (VariableEntity parameterEntity : ((FunctionEntity) currentEntity).getParameterList()) {
            IRRegister parameterRegister = new IRRegister();
            parameterEntity.setIRRegister(parameterRegister);
            body.add(new OpIRNode(OperatorList.ASSIGN, parameterRegister, 0));
        }
        destIRRegister.setType(node.getTypeNode().getType());
        ((FunctionEntity) currentEntity).setReturnRegister(destIRRegister);
        for (int i = 0; i < ((FunctionEntity) currentEntity).getParameterList().size(); i++) {
            VariableEntity parameterEntity = ((FunctionEntity) currentEntity).getParameterList().get(i);
            IRRegister parameterRegister = parameterEntity.getIRRegister();
            body.add(new OpIRNode(OperatorList.ASSIGN, parameterRegister, parameterIRRegisters.get(i)));
        }
        body.addAll(visit(node.getBlockStatementNodes()).getBodyNode());
        body.add(((FunctionEntity) currentEntity).getReturnLabel());
        body.add(new RetIRNode());
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
            body.add(new OpIRNode(OperatorList.ASSIGN, ((FunctionEntity) functionEntity).getReturnRegister(), returnExpression.getReturnRegister()));
        }
        body.add(new JumpIRNode(((FunctionEntity) functionEntity).getReturnLabel()));
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
        LabelIRNode conditionLabel = new LabelIRNode();
        ((LoopEntity) currentEntity).setConditionLabel(conditionLabel);
        LabelIRNode continueLabel = new LabelIRNode();
        ((LoopEntity) currentEntity).setContinueLabel(continueLabel);
        LabelIRNode breakLabel = new LabelIRNode();
        ((LoopEntity) currentEntity).setBreakLabel(breakLabel);
        List<BaseIRNode> body = new ArrayList<>();
        if (node.getInitExpressionNode() != null)
            body.addAll(visit(node.getInitExpressionNode()).getBodyNode());
        body.add(conditionLabel);
        FunctionIRNode conditionExpression = visit(node.getConditionExpressionNode());
        body.addAll(conditionExpression.getBodyNode());
        body.add(new BranchIRNode(conditionExpression.getReturnRegister(), conditionLabel, breakLabel));
        body.add(continueLabel);
        FunctionIRNode bodyExpression = visit(node.getBodyStatementNode());
        body.addAll(bodyExpression.getBodyNode());
        FunctionIRNode updateExpression = visit(node.getUpdateExpressionNode());
        body.addAll(updateExpression.getBodyNode());
        body.add(new JumpIRNode(conditionLabel));
        body.add(breakLabel);
        currentEntity = oldEntity;
        return new FunctionIRNode(body, null);
    }

    @Override
    public FunctionIRNode visitBreakStatementNode(BreakStatementNode node) {
        BaseEntity loopEntity = currentEntity;
        List<BaseIRNode> body = new ArrayList<>();
        while (!(loopEntity instanceof LoopEntity)) loopEntity = loopEntity.getParentEntity();
        body.add(new JumpIRNode(((LoopEntity) loopEntity).getBreakLabel()));
        return new FunctionIRNode(body, null);
    }

    @Override
    public FunctionIRNode visitContinueStatementNode(ContinueStatementNode node) {
        BaseEntity loopEntity = currentEntity;
        List<BaseIRNode> body = new ArrayList<>();
        while (!(loopEntity instanceof LoopEntity)) loopEntity = loopEntity.getParentEntity();
        body.add(new JumpIRNode(((LoopEntity) loopEntity).getConditionLabel()));
        return new FunctionIRNode(body, null);
    }

    @Override
    public FunctionIRNode visitIfStatementNode(IfStatementNode node) {
        BaseEntity oldEntity = currentEntity;
        assert currentEntity instanceof BlockEntity;
        currentEntity = ((BlockEntity) currentEntity).get(node.getPosition());
        assert currentEntity instanceof IfEntity;
        LabelIRNode thenLabel = new LabelIRNode();
        ((IfEntity) currentEntity).setThenLabel(thenLabel);
        LabelIRNode elseLabel = new LabelIRNode();
        ((IfEntity) currentEntity).setElseLabel(elseLabel);
        LabelIRNode endLabel = new LabelIRNode();
        ((IfEntity) currentEntity).setEndLabel(endLabel);
        FunctionIRNode conditionExpression = visit(node.getConditionExpressionNode());
        List<BaseIRNode> body = new ArrayList<>(conditionExpression.getBodyNode());
        body.add(new BranchIRNode(conditionExpression.getReturnRegister(), thenLabel, elseLabel));
        body.add(thenLabel);
        body.addAll(visit(node.getThenStatementNode()).getBodyNode());
        body.add(new JumpIRNode(endLabel));
        body.add(elseLabel);
        body.addAll(visit(node.getThenStatementNode()).getBodyNode());
        body.add(new JumpIRNode(endLabel));
        body.add(endLabel);
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
        return new FunctionIRNode(new ArrayList<>(), variableRegister);
    }

    @Override
    public FunctionIRNode visitExpressionStatementNode(ExpressionStatementNode node) {
        List<BaseIRNode> instructions = visit(node.getExpressionNode()).getBodyNode();
        List<BaseIRNode> body = new ArrayList<>();
        List<BaseIRNode> preBody = new ArrayList<>();
        List<BaseIRNode> midBody = new ArrayList<>();
        List<BaseIRNode> sufBody = new ArrayList<>();
        for (BaseIRNode instruction : instructions)
            if (instruction instanceof OpIRNode) {
                if (((OpIRNode) instruction).getOperator() == OperatorList.PREFIXINC || ((OpIRNode) instruction).getOperator() == OperatorList.PREFIXDEC || ((OpIRNode) instruction).getOperator() == OperatorList.SUFFIXINC || ((OpIRNode) instruction).getOperator() == OperatorList.SUFFIXDEC) {
                    if (((OpIRNode) instruction).getOperator() == OperatorList.PREFIXINC)
                        preBody.add(new OpIRNode(OperatorList.ADD, ((OpIRNode) instruction).getDestIRRegister(), 1));
                    if (((OpIRNode) instruction).getOperator() == OperatorList.SUFFIXINC)
                        sufBody.add(new OpIRNode(OperatorList.ADD, ((OpIRNode) instruction).getDestIRRegister(), 1));
                    if (((OpIRNode) instruction).getOperator() == OperatorList.PREFIXDEC)
                        preBody.add(new OpIRNode(OperatorList.SUB, ((OpIRNode) instruction).getDestIRRegister(), 1));
                    if (((OpIRNode) instruction).getOperator() == OperatorList.SUFFIXDEC)
                        sufBody.add(new OpIRNode(OperatorList.SUB, ((OpIRNode) instruction).getDestIRRegister(), 1));
                } else midBody.add(instruction);
            } else midBody.add(instruction);
        body.addAll(preBody);
        body.addAll(midBody);
        body.addAll(sufBody);
        return new FunctionIRNode(body, null);
    }

    @Override
    public FunctionIRNode visitArrayExpressionNode(ArrayExpressionNode node) {
        FunctionIRNode address = visit(node.getAddress());
        FunctionIRNode index = visit(node.getIndex());
        List<BaseIRNode> body = new ArrayList<>();
        body.addAll(address.getBodyNode());
        body.addAll(index.getBodyNode());
        IRRegister destIRRegister = new IRRegister();
        destIRRegister.setType(((ArrayType) address.getReturnRegister().getType()).getBaseType());
        body.add(new OpIRNode(OperatorList.ADD, destIRRegister, address.getReturnRegister()));
        body.add(new OpIRNode(OperatorList.ADD, destIRRegister, index.getReturnRegister()));
        return new FunctionIRNode(body, destIRRegister);
    }

    @Override
    public FunctionIRNode visitBinaryExpressionNode(BinaryExpressionNode node) {
        FunctionIRNode leftExpression = visit(node.getLeftExpressionNode());
        FunctionIRNode rightExpression = visit(node.getRightExressionNode());
        List<BaseIRNode> body = new ArrayList<>(leftExpression.getBodyNode());
        if (node.getOperator() == OperatorList.ASSIGN) {
            body.addAll(rightExpression.getBodyNode());
            if (node.getLeftExpressionNode() instanceof DotExpressionNode || node.getLeftExpressionNode() instanceof ArrayExpressionNode)
                body.add(new OpIRNode(OperatorList.STORE, leftExpression.getReturnRegister(), rightExpression.getReturnRegister()));
            else body.add(new OpIRNode(OperatorList.ASSIGN, leftExpression.getReturnRegister(), rightExpression.getReturnRegister()));
            return new FunctionIRNode(body, leftExpression.getReturnRegister());
        } else {
            IRRegister destIRRegister = new IRRegister();
            if (node.getOperator() == OperatorList.LOGICALAND || node.getOperator() == OperatorList.LOGICALOR) {
                LabelIRNode continueLabel = new LabelIRNode();
                LabelIRNode breakLabel = new LabelIRNode();
                LabelIRNode endLabel = new LabelIRNode();
                if (node.getOperator() == OperatorList.AND) body.add(new BranchIRNode(leftExpression.getReturnRegister(), continueLabel, breakLabel));
                else body.add(new BranchIRNode(leftExpression.getReturnRegister(), breakLabel, continueLabel));
                body.add(continueLabel);
                body.addAll(rightExpression.getBodyNode());
                body.add(new OpIRNode(OperatorList.ASSIGN, destIRRegister, node.getOperator() == OperatorList.AND ? 1 : 0));
                if (node.getOperator() == OperatorList.AND) {
                    body.add(new OpIRNode(OperatorList.AND, destIRRegister, leftExpression.getReturnRegister()));
                    body.add(new OpIRNode(OperatorList.AND, destIRRegister, rightExpression.getReturnRegister()));
                } else {
                    body.add(new OpIRNode(OperatorList.OR, destIRRegister, leftExpression.getReturnRegister()));
                    body.add(new OpIRNode(OperatorList.OR, destIRRegister, rightExpression.getReturnRegister()));
                }
                body.add(new JumpIRNode(endLabel));
                body.add(breakLabel);
                body.add(new OpIRNode(OperatorList.ADD, destIRRegister, node.getOperator() == OperatorList.OR ? 1 : 0));
                body.add(new JumpIRNode(endLabel));
            }
            if (node.getOperator() == OperatorList.LT || node.getOperator() == OperatorList.GT || node.getOperator() == OperatorList.LEQ || node.getOperator() == OperatorList.GEQ || node.getOperator() == OperatorList.EQUAL || node.getOperator() == OperatorList.NOTEQUAL) {
                body.addAll(rightExpression.getBodyNode());
                body.add(new CmpIRNode(node.getOperator(), destIRRegister, leftExpression.getReturnRegister(), rightExpression.getReturnRegister()));
            }
            if (node.getOperator() == OperatorList.ADD || node.getOperator() == OperatorList.SUB || node.getOperator() == OperatorList.MUL || node.getOperator() == OperatorList.DIV || node.getOperator() == OperatorList.MOD || node.getOperator() == OperatorList.LEFTSHIFT || node.getOperator() == OperatorList.RIGHTSHIFT || node.getOperator() == OperatorList.AND || node.getOperator() == OperatorList.OR || node.getOperator() == OperatorList.XOR) {
                body.add(new OpIRNode(OperatorList.ASSIGN, destIRRegister, leftExpression.getReturnRegister()));
                body.addAll(rightExpression.getBodyNode());
                body.add(new OpIRNode(node.getOperator(), destIRRegister, rightExpression.getReturnRegister()));
            }
            return new FunctionIRNode(body, destIRRegister);
        }
    }

    @Override
    public FunctionIRNode visitCreatorExpressionNode(CreatorExpressionNode node) {
        List<BaseIRNode> body = new ArrayList<>();
        IRRegister destIRRegister = new IRRegister();
        if (node.getFixedDimension().size() == 0) {
            body.add(new OpIRNode(OperatorList.MALLOC, destIRRegister, 1));
            if (node.getRestDimension() == 0) {
                BaseType type = node.getTypeNode().getType();
                if (type instanceof ClassType) {
                    String className = ((ClassType) type).getClassName();
                    FunctionEntity constructorEntity = globalEntity.getClassEntity(className).getFunctionEntity(className);
                    body.add(new CallIRNode(constructorEntity.getEntryLabel()));
                    body.add(new OpIRNode(OperatorList.ASSIGN, destIRRegister, constructorEntity.getReturnRegister()));
                }
            }
        } else {
            FunctionIRNode dimension = visit(node.getFixedDimension().get(0));
            body.add(new OpIRNode(OperatorList.MALLOC, destIRRegister, dimension.getReturnRegister()));
            List<BaseExpressionNode> fixedDimension = new ArrayList<>();
            for (int i = 1; i < node.getFixedDimension().size(); i++) fixedDimension.add(node.getFixedDimension().get(i));
            CreatorExpressionNode baseCreatorExpression = new CreatorExpressionNode(node.getTypeNode(), fixedDimension, node.getRestDimension(), (Position) null);
            FunctionIRNode baseCreator = visit(baseCreatorExpression);
            IRRegister iteratorIRRegister = new IRRegister();
            LabelIRNode conditionLabel = new LabelIRNode();
            LabelIRNode continueLabel = new LabelIRNode();
            LabelIRNode breakLabel = new LabelIRNode();
            body.add(conditionLabel);
            IRRegister conditionIRRegister = new IRRegister();
            body.add(new CmpIRNode(OperatorList.LT, conditionIRRegister, iteratorIRRegister, dimension.getReturnRegister()));
            body.add(new BranchIRNode(conditionIRRegister, conditionLabel, breakLabel));
            body.add(continueLabel);
            body.addAll(baseCreator.getBodyNode());
            IRRegister addressIRRegister = new IRRegister();
            IRRegister elementIRRegister = new IRRegister();
            body.add(new OpIRNode(OperatorList.ADD, addressIRRegister, destIRRegister));
            body.add(new OpIRNode(OperatorList.ADD, addressIRRegister, iteratorIRRegister));
            body.add(new OpIRNode(OperatorList.MEMORY, elementIRRegister, addressIRRegister));
            body.add(new OpIRNode(OperatorList.ASSIGN, elementIRRegister, baseCreator.getReturnRegister()));
            body.add(new OpIRNode(OperatorList.ADD, iteratorIRRegister, 1));
            body.add(new JumpIRNode(conditionLabel));
            body.add(breakLabel);
        }
        destIRRegister.setType(getArrayType(node.getTypeNode().getType(), node.getFixedDimension().size() + node.getRestDimension()));
        return new FunctionIRNode(body, destIRRegister);
    }

    @Override
    public FunctionIRNode visitDotExpressionNode(DotExpressionNode node) {
        IRRegister destIRRegister = new IRRegister();
        FunctionIRNode object = visit(node.getObjectExpressionNode());
        List<BaseIRNode> body = new ArrayList<>(object.getBodyNode());
        ClassType classType = (ClassType) object.getReturnRegister().getType();
        String member = node.getIdentifierExpressionNode().getIdentifierName();
        ClassEntity classEntity = globalEntity.getClassEntity(classType.getClassName());
        int index = classEntity.getIndex(member);
        body.add(new OpIRNode(OperatorList.ADD, destIRRegister, object.getReturnRegister()));
        body.add(new OpIRNode(OperatorList.ADD, destIRRegister, index));
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
            body.add(new OpIRNode(OperatorList.ASSIGN, parameterIRRegisters.get(0), objectNode.getReturnRegister()));
            for (int i = 0; i < node.getArguments().size(); i++) {
                FunctionIRNode argumentNode = visit(node.getArguments().get(i));
                IRRegister parameterIRRegister = parameterIRRegisters.get(i + 1);
                body.addAll(argumentNode.getBodyNode());
                body.add(new OpIRNode(OperatorList.ASSIGN, parameterIRRegister, argumentNode.getReturnRegister()));
            }
            body.add(new CallIRNode(functionEntity.getEntryLabel()));
            body.add(new OpIRNode(OperatorList.ASSIGN, destIRRegister, functionEntity.getReturnRegister()));
        } else {
            assert node.getfunctionNode() instanceof IdentifierExpressionNode;
            FunctionEntity functionEntity = globalEntity.getFunctionEntity(((IdentifierExpressionNode) node.getfunctionNode()).getIdentifierName());
            for (int i = 0; i < node.getArguments().size(); i++) {
                FunctionIRNode argumentNode = visit(node.getArguments().get(i));
                IRRegister parameterIRRegister = parameterIRRegisters.get(i);
                body.addAll(argumentNode.getBodyNode());
                body.add(new OpIRNode(OperatorList.ASSIGN, parameterIRRegister, argumentNode.getReturnRegister()));
            }
            body.add(new CallIRNode(functionEntity.getEntryLabel()));
            body.add(new OpIRNode(OperatorList.ASSIGN, destIRRegister, functionEntity.getReturnRegister()));
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
                        body.add(new OpIRNode(OperatorList.ASSIGN, indexIRRegister, index));
                        IRRegister destIRRegister = new IRRegister();
                        body.add(new OpIRNode(OperatorList.ADD, destIRRegister, thisIRRegister));
                        body.add(new OpIRNode(OperatorList.ADD, destIRRegister, indexIRRegister));
                        if (variableEntity.getType() instanceof PrimaryType)
                            body.add(new OpIRNode(OperatorList.MEMORY, destIRRegister, destIRRegister));
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
            body.add(new OpIRNode(OperatorList.MALLOC, destIRRegister, node.getValue().length() + 1));
            for (int i = 0; i < node.getValue().length() + 1; i++) {
                IRRegister addressIRRegister = new IRRegister();
                IRRegister charIRRegister = new IRRegister();
                body.add(new OpIRNode(OperatorList.ADD, addressIRRegister, destIRRegister));
                body.add(new OpIRNode(OperatorList.ADD, addressIRRegister, i));
                body.add(new OpIRNode(OperatorList.MEMORY, charIRRegister, addressIRRegister));
                if (i == node.getValue().length()) body.add(new OpIRNode(OperatorList.ASSIGN, charIRRegister, 0));
                else body.add(new OpIRNode(OperatorList.ASSIGN, charIRRegister, ((int) node.getValue().charAt(i))));
            }
            destIRRegister.setType(new ClassType("string"));
        } else {
            assert node.getType() instanceof PrimaryType;
            if (((PrimaryType) node.getType()).getType() == PrimaryTypeList.BOOL) {
                if (node.getValue().equals("true")) body.add(new OpIRNode(OperatorList.ASSIGN, destIRRegister, 1));
                else body.add(new OpIRNode(OperatorList.ASSIGN, destIRRegister, 0));
            } else body.add(new OpIRNode(OperatorList.ASSIGN, destIRRegister, Integer.parseInt(node.getValue())));
            destIRRegister.setType(new PrimaryType(PrimaryTypeList.INT));
        }
        return new FunctionIRNode(body, destIRRegister);
    }

    @Override
    public FunctionIRNode visitUnaryExpressionNode(UnaryExpressionNode node) {
        IRRegister destIRRegister = new IRRegister();
        FunctionIRNode expression = visit(node.getExpressionNode());
        List<BaseIRNode> body = new ArrayList<>(expression.getBodyNode());
        if (node.getOperator() == OperatorList.NEG) body.add(new OpIRNode(OperatorList.SUB, destIRRegister, expression.getReturnRegister()));
        if (node.getOperator() == OperatorList.NOT) {
            body.add(new OpIRNode(OperatorList.ASSIGN, destIRRegister, 0xffff));
            body.add(new OpIRNode(OperatorList.XOR, destIRRegister, expression.getReturnRegister()));
        }
        if (node.getOperator() == OperatorList.LOGICALNOT) {
            body.add(new OpIRNode(OperatorList.ASSIGN, destIRRegister, 1));
            body.add(new OpIRNode(OperatorList.XOR, destIRRegister, expression.getReturnRegister()));
        }
        if (node.getOperator() == OperatorList.PREFIXINC || node.getOperator() == OperatorList.PREFIXDEC || node.getOperator() == OperatorList.SUFFIXINC || node.getOperator() == OperatorList.SUFFIXDEC)
            body.add(new OpIRNode(node.getOperator(), expression.getReturnRegister(), 1));
        return new FunctionIRNode(body, destIRRegister);
    }

}
