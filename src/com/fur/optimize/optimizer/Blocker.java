package com.fur.optimize.optimizer;

import com.fur.enumerate.OperatorList;
import com.fur.intermediateRepresentation.IRRegister;
import com.fur.intermediateRepresentation.node.*;
import com.fur.nasm.memory.NASMStaticMemory;
import com.fur.optimize.BlockIRNode;
import com.fur.symbolTable.Entity.FunctionEntity;

import java.util.ArrayList;
import java.util.List;

public class Blocker {

    private FunctionEntity currentFunction = null;

    private void addStaticUse(IRRegister staticIRRegister) {
        if (staticIRRegister.getMemory() instanceof NASMStaticMemory)
            currentFunction.getStaticIRRegisterUse().add(staticIRRegister);
    }

    private void addStaticDefine(IRRegister staticIRRegister) {
        if (staticIRRegister.getMemory() instanceof NASMStaticMemory)
            currentFunction.getStaticIRRegisterDefine().add(staticIRRegister);
    }

    private void functionAnalyze(List<BaseIRNode> instructions) {
        while (true) {
            boolean diff = false;
            int staticUseSize = 0;
            int staticDefineSize = 0;
            for (BaseIRNode instruction : instructions) {
                if (instruction instanceof FunctionLabelIRNode) {
                    currentFunction = ((FunctionLabelIRNode) instruction).getEntity();
                    staticUseSize = currentFunction.getStaticIRRegisterUse().size();
                    staticDefineSize = currentFunction.getStaticIRRegisterDefine().size();
                }
                if (currentFunction != null) {
                    if (instruction instanceof BranchIRNode)
                        addStaticUse(((BranchIRNode) instruction).getConditionIRRegister());
                    if (instruction instanceof CmpIRNode) {
                        addStaticUse(((CmpIRNode) instruction).getOperateIRRegister1());
                        addStaticUse(((CmpIRNode) instruction).getOperateIRRegister2());
                        addStaticDefine(((CmpIRNode) instruction).getDestIRRegister());
                    }
                    if (instruction instanceof OpIRNode) {
                        addStaticUse(((OpIRNode) instruction).getDestIRRegister());
                        if (((OpIRNode) instruction).getSourceIRRegister() != null)
                            addStaticUse(((OpIRNode) instruction).getSourceIRRegister());
                        addStaticDefine(((OpIRNode) instruction).getDestIRRegister());
                    }
                    if (instruction instanceof RetIRNode) addStaticUse(((RetIRNode) instruction).getReturnIRRegister());
                    if (instruction instanceof CallIRNode) {
                        currentFunction.getStaticIRRegisterDefine().addAll(((CallIRNode) instruction).getFunctionEntry().getEntity().getStaticIRRegisterDefine());
                        currentFunction.getStaticIRRegisterUse().addAll(((CallIRNode) instruction).getFunctionEntry().getEntity().getStaticIRRegisterUse());
                        for (IRRegister parameterIRRegister : ((CallIRNode) instruction).getParameterIRRegisters()) addStaticUse(parameterIRRegister);
                        addStaticDefine(((CallIRNode) instruction).getDestIRRegister());
                    }
                }
                if (instruction instanceof RetIRNode) {
                    assert currentFunction != null;
                    if (currentFunction.getStaticIRRegisterUse().size() != staticUseSize) diff = true;
                    if (currentFunction.getStaticIRRegisterDefine().size() != staticDefineSize) diff = true;
                    currentFunction = null;
                }
            }
            if (!diff) break;
        }
    }

    private List<BlockIRNode> putBlock(List<BaseIRNode> instructions) {
        List<BlockIRNode> code = new ArrayList<>();
        for (BaseIRNode instruction : instructions) if (instruction instanceof LabelIRNode) instruction.setBlock(new BlockIRNode());
        BlockIRNode currentBlock = null;
        for (int i = 0 ; i < instructions.size(); i++) {
            BaseIRNode instruction = instructions.get(i);
            if (instruction instanceof LabelIRNode) {
                currentBlock = instruction.getBlock();
                code.add(currentBlock);
            }
            assert currentBlock != null;
            currentBlock.getInstructions().add(instruction);
            if (instruction instanceof JumpIRNode) {
                BlockIRNode destBlock = ((JumpIRNode) instruction).getDestLabelNode().getBlock();
                currentBlock.getOutNodes().add(destBlock);
                destBlock.getInNodes().add(currentBlock);
            }
            if (instruction instanceof BranchIRNode) {
                BlockIRNode destFalseBlock = ((BranchIRNode) instruction).getFalseDestIRNode().getBlock();
                BlockIRNode destTrueBlock = instructions.get(i + 1).getBlock();
                currentBlock.getOutNodes().add(destFalseBlock);
                destFalseBlock.getInNodes().add(currentBlock);
                currentBlock.getOutNodes().add(destTrueBlock);
                destTrueBlock.getInNodes().add(currentBlock);
            }
        }
        return code;
    }

    private List<BaseIRNode> constAnalyze(List<BaseIRNode> instructions) {
        List<BaseIRNode> code = new ArrayList<>();
        for (BaseIRNode instruction : instructions) {
            if (instruction instanceof BranchIRNode)
                if (((BranchIRNode) instruction).getConditionIRRegister().getConstValue() != null)
                    if (((BranchIRNode) instruction).getConditionIRRegister().getConstValue() == 1)
                        instruction.getBlock().getOutNodes().remove(((BranchIRNode) instruction).getFalseDestIRNode().getBlock());
                    else {
                        code.add(new JumpIRNode(((BranchIRNode) instruction).getFalseDestIRNode()));
                        instruction.getBlock().getOutNodes().clear();
                        instruction.getBlock().getOutNodes().add(((BranchIRNode) instruction).getFalseDestIRNode().getBlock());
                    }
                else code.add(instruction);
            if (instruction instanceof CallIRNode) {
                for (IRRegister defineStaticIRRegister : ((CallIRNode) instruction).getFunctionEntry().getEntity().getStaticIRRegisterDefine())
                    defineStaticIRRegister.setConstValue(null);
                ((CallIRNode) instruction).getDestIRRegister().setConstValue(null);
                code.add(instruction);
            }
            if (instruction instanceof CmpIRNode)
                if (((CmpIRNode) instruction).getOperateIRRegister1().getConstValue() != null && ((CmpIRNode) instruction).getOperateIRRegister2().getConstValue() != null) {
                    long operator1 = ((CmpIRNode) instruction).getOperateIRRegister1().getConstValue();
                    long operator2 = ((CmpIRNode) instruction).getOperateIRRegister2().getConstValue();
                    boolean res = false;
                    if (((CmpIRNode) instruction).getOperator() == OperatorList.LT) res = operator1 < operator2;
                    if (((CmpIRNode) instruction).getOperator() == OperatorList.LEQ) res = operator1 <= operator2;
                    if (((CmpIRNode) instruction).getOperator() == OperatorList.GT) res = operator1 > operator2;
                    if (((CmpIRNode) instruction).getOperator() == OperatorList.GEQ) res = operator1 >= operator2;
                    if (((CmpIRNode) instruction).getOperator() == OperatorList.EQUAL) res = operator1 == operator2;
                    if (((CmpIRNode) instruction).getOperator() == OperatorList.NOTEQUAL) res = operator1 != operator2;
                    if (res) ((CmpIRNode) instruction).getDestIRRegister().setConstValue(1L);
                    else ((CmpIRNode) instruction).getDestIRRegister().setConstValue(0L);
                    code.add(new OpIRNode(OperatorList.ASSIGN, ((CmpIRNode) instruction).getDestIRRegister(), ((CmpIRNode) instruction).getDestIRRegister().getConstValue()));
                } else {
                    ((CmpIRNode) instruction).getDestIRRegister().setConstValue(null);
                    code.add(instruction);
                }
            if (instruction instanceof OpIRNode) {
                if (((OpIRNode) instruction).getSourceIRRegister() != null && ((OpIRNode) instruction).getSourceIRRegister().getConstValue() != null) {
                    ((OpIRNode) instruction).setImmediate(((OpIRNode) instruction).getSourceIRRegister().getConstValue());
                    ((OpIRNode) instruction).setSourceIRRegister(null);
                }
                if (((OpIRNode) instruction).getOperator() == OperatorList.ASSIGN) {
                    if (((OpIRNode) instruction).getSourceIRRegister() == null) ((OpIRNode) instruction).getDestIRRegister().setConstValue(((OpIRNode) instruction).getImmediate());
                    else ((OpIRNode) instruction).getDestIRRegister().setConstValue(null);
                    code.add(instruction);
                }
                if (((OpIRNode) instruction).getOperator() == OperatorList.NEG) {
                    if (((OpIRNode) instruction).getDestIRRegister().getConstValue() != null)
                        code.add(new OpIRNode(OperatorList.ASSIGN, ((OpIRNode) instruction).getDestIRRegister(), -((OpIRNode) instruction).getDestIRRegister().getConstValue()));
                    else code.add(instruction);
                }
                if (((OpIRNode) instruction).getOperator() == OperatorList.LOAD) {
                    ((OpIRNode) instruction).getDestIRRegister().setConstValue(null);
                    code.add(instruction);
                }
                if (((OpIRNode) instruction).getOperator() == OperatorList.ADD || ((OpIRNode) instruction).getOperator() == OperatorList.SUB || ((OpIRNode) instruction).getOperator() == OperatorList.MUL || ((OpIRNode) instruction).getOperator() == OperatorList.DIV || ((OpIRNode) instruction).getOperator() == OperatorList.MOD || ((OpIRNode) instruction).getOperator() == OperatorList.LEFTSHIFT || ((OpIRNode) instruction).getOperator() == OperatorList.RIGHTSHIFT || ((OpIRNode) instruction).getOperator() == OperatorList.AND || ((OpIRNode) instruction).getOperator() == OperatorList.OR || ((OpIRNode) instruction).getOperator() == OperatorList.XOR) {
                    if (((OpIRNode) instruction).getDestIRRegister().getConstValue() != null && ((OpIRNode) instruction).getSourceIRRegister().getConstValue() != null) {
                        long res = 0;
                        long operator1 = ((OpIRNode) instruction).getDestIRRegister().getConstValue();
                        long operator2 = ((OpIRNode) instruction).getSourceIRRegister().getConstValue();
                        if (((OpIRNode) instruction).getOperator() == OperatorList.ADD) res = operator1 + operator2;
                        if (((OpIRNode) instruction).getOperator() == OperatorList.SUB) res = operator1 - operator2;
                        if (((OpIRNode) instruction).getOperator() == OperatorList.MUL) res = operator1 * operator2;
                        if (((OpIRNode) instruction).getOperator() == OperatorList.MOD) res = operator1 % operator2;
                        if (((OpIRNode) instruction).getOperator() == OperatorList.DIV) res = operator1 / operator2;
                        if (((OpIRNode) instruction).getOperator() == OperatorList.AND) res = operator1 & operator2;
                        if (((OpIRNode) instruction).getOperator() == OperatorList.OR) res = operator1 | operator2;
                        if (((OpIRNode) instruction).getOperator() == OperatorList.XOR) res = operator1 ^ operator2;
                        if (((OpIRNode) instruction).getOperator() == OperatorList.LEFTSHIFT) res = operator1 << operator2;
                        if (((OpIRNode) instruction).getOperator() == OperatorList.RIGHTSHIFT) res = operator1 >> operator2;
                        ((OpIRNode) instruction).getDestIRRegister().setConstValue(res);
                        code.add(new OpIRNode(OperatorList.ASSIGN, ((OpIRNode) instruction).getDestIRRegister(), res));
                    } else {
                        ((OpIRNode) instruction).getDestIRRegister().setConstValue(null);
                        code.add(instruction);
                    }
                }
            }
        }
        return code;
    }

    private void instructionAnalyze(BlockIRNode block) {
        block.setInstructions(constAnalyze(block.getInstructions()));
        for (int i = block.getInstructions().size() - 1; i >= 0; i--) {
            BaseIRNode instruction = block.getInstructions().get(i);
            IRRegister defineIRRegister = null;
            if (instruction instanceof CallIRNode) defineIRRegister = ((CallIRNode) instruction).getDestIRRegister();
            if (instruction instanceof CmpIRNode) defineIRRegister = ((CmpIRNode) instruction).getDestIRRegister();
            if (instruction instanceof OpIRNode) defineIRRegister = ((OpIRNode) instruction).getDestIRRegister();
        }
    }

    public List<BlockIRNode> block(List<BaseIRNode> instructions) {
        functionAnalyze(instructions);
        List<BlockIRNode> blocks = putBlock(instructions);
        for (BlockIRNode block : blocks) instructionAnalyze(block);
        return blocks;
    }

}
