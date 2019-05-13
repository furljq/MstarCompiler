package com.fur.optimize.optimizer;

import com.fur.enumerate.OperatorList;
import com.fur.intermediateRepresentation.IRRegister;
import com.fur.intermediateRepresentation.node.*;
import com.fur.nasm.memory.NASMStaticMemory;
import com.fur.optimize.BlockIRNode;
import com.fur.symbolTable.Entity.FunctionEntity;
import com.fur.symbolTable.Entity.VariableEntity;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

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

    public void functionAnalyze(List<BaseIRNode> instructions) {
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
                        if (((CallIRNode) instruction).getFunctionEntry().getNasmLabel().getName().equals("print") || ((CallIRNode) instruction).getFunctionEntry().getNasmLabel().getName().equals("println")) currentFunction.setPrint(true);
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
            instruction.setBlock(currentBlock);
            if (instruction instanceof JumpIRNode) {
                BlockIRNode destBlock = ((JumpIRNode) instruction).getDestLabelNode().getBlock();
                currentBlock.getOutNodes().add(destBlock);
                destBlock.getInNodes().add(currentBlock);
            }
            if (instruction instanceof BranchIRNode) {
                BlockIRNode destFalseBlock = ((BranchIRNode) instruction).getFalseDestIRNode().getBlock();
                currentBlock.getOutNodes().add(destFalseBlock);
                destFalseBlock.getInNodes().add(currentBlock);
            }
            if (!(instruction instanceof JumpIRNode || instruction instanceof RetIRNode) && i != instructions.size() - 1 && instructions.get(i + 1) instanceof LabelIRNode) {
                BlockIRNode nextBlock = instructions.get(i + 1).getBlock();
                nextBlock.getInNodes().add(currentBlock);
                currentBlock.getOutNodes().add(nextBlock);
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
                    if (((OpIRNode) instruction).getDestIRRegister().getConstValue() != null) {
                        ((OpIRNode) instruction).getDestIRRegister().setConstValue(-((OpIRNode) instruction).getDestIRRegister().getConstValue());
                        code.add(new OpIRNode(OperatorList.ASSIGN, ((OpIRNode) instruction).getDestIRRegister(), ((OpIRNode) instruction).getDestIRRegister().getConstValue()));
                    } else code.add(instruction);
                }
                if (((OpIRNode) instruction).getOperator() == OperatorList.LOAD || ((OpIRNode) instruction).getOperator() == OperatorList.MALLOC) {
                    ((OpIRNode) instruction).getDestIRRegister().setConstValue(null);
                    code.add(instruction);
                }
                if (((OpIRNode) instruction).getOperator() == OperatorList.STORE) code.add(instruction);
                if (((OpIRNode) instruction).getOperator() == OperatorList.ADD || ((OpIRNode) instruction).getOperator() == OperatorList.SUB || ((OpIRNode) instruction).getOperator() == OperatorList.MUL || ((OpIRNode) instruction).getOperator() == OperatorList.DIV || ((OpIRNode) instruction).getOperator() == OperatorList.MOD || ((OpIRNode) instruction).getOperator() == OperatorList.LEFTSHIFT || ((OpIRNode) instruction).getOperator() == OperatorList.RIGHTSHIFT || ((OpIRNode) instruction).getOperator() == OperatorList.AND || ((OpIRNode) instruction).getOperator() == OperatorList.OR || ((OpIRNode) instruction).getOperator() == OperatorList.XOR) {
                    if (((OpIRNode) instruction).getDestIRRegister().getConstValue() != null && (((OpIRNode) instruction).getSourceIRRegister() == null || ((OpIRNode) instruction).getSourceIRRegister().getConstValue() != null)) {
                        long res = 0;
                        long operator1 = ((OpIRNode) instruction).getDestIRRegister().getConstValue();
                        long operator2;
                        if (((OpIRNode) instruction).getSourceIRRegister() == null) operator2 = ((OpIRNode) instruction).getImmediate();
                        else operator2 = ((OpIRNode) instruction).getSourceIRRegister().getConstValue();
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
            if (instruction instanceof RetIRNode) {
                if (((RetIRNode) instruction).getReturnIRRegister() != null && ((RetIRNode) instruction).getReturnIRRegister().getConstValue() != null) {
                    ((RetIRNode) instruction).setImmediate(((RetIRNode) instruction).getReturnIRRegister().getConstValue());
                    ((RetIRNode) instruction).setReturnIRRegister(null);
                }
                code.add(instruction);
            }
            if (instruction instanceof AnnotationIRNode || instruction instanceof JumpIRNode || instruction instanceof LabelIRNode) code.add(instruction);
        }
        for (BaseIRNode instruction : instructions) {
            if (instruction instanceof CmpIRNode) ((CmpIRNode) instruction).getDestIRRegister().setConstValue(null);
            if (instruction instanceof OpIRNode) ((OpIRNode) instruction).getDestIRRegister().setConstValue(null);
        }
        return code;
    }

    private void instructionAnalyze(BlockIRNode block) {
        block.setInstructions(constAnalyze(block.getInstructions()));
        for (int reverse = block.getInstructions().size() - 1; reverse >= 0; reverse--) {
            BaseIRNode instruction = block.getInstructions().get(reverse);
            List<IRRegister> defineIRRegisters = new ArrayList<>();
            if (instruction instanceof FunctionLabelIRNode)
                for (VariableEntity parameterEntity : ((FunctionLabelIRNode) instruction).getEntity().getParameterList())
                    defineIRRegisters.add(parameterEntity.getIRRegister());
            if (instruction instanceof CallIRNode){
                defineIRRegisters.add(((CallIRNode) instruction).getDestIRRegister());
                defineIRRegisters.addAll(((CallIRNode) instruction).getFunctionEntry().getEntity().getStaticIRRegisterDefine());
            }
            if (instruction instanceof CmpIRNode) defineIRRegisters.add(((CmpIRNode) instruction).getDestIRRegister());
            if (instruction instanceof OpIRNode && ((OpIRNode) instruction).getOperator() != OperatorList.STORE) defineIRRegisters.add(((OpIRNode) instruction).getDestIRRegister());
            for (IRRegister defineIRRegister : defineIRRegisters) {
                block.getUseIRRegisters().remove(defineIRRegister);
                block.getDefineIRRegisters().add(defineIRRegister);
            }
            if (instruction instanceof BranchIRNode) block.getUseIRRegisters().add(((BranchIRNode) instruction).getConditionIRRegister());
            if (instruction instanceof CallIRNode) {
                block.getUseIRRegisters().addAll(((CallIRNode) instruction).getParameterIRRegisters());
                block.getUseIRRegisters().addAll(((CallIRNode) instruction).getFunctionEntry().getEntity().getStaticIRRegisterUse());
            }
            if (instruction instanceof CmpIRNode) {
                block.getUseIRRegisters().add(((CmpIRNode) instruction).getOperateIRRegister1());
                block.getUseIRRegisters().add(((CmpIRNode) instruction).getOperateIRRegister2());
            }
            if (instruction instanceof OpIRNode) {
                if (((OpIRNode) instruction).getSourceIRRegister() != null) block.getUseIRRegisters().add(((OpIRNode) instruction).getSourceIRRegister());
                if (((OpIRNode) instruction).getOperator() != OperatorList.ASSIGN && ((OpIRNode) instruction).getOperator() != OperatorList.LOAD && ((OpIRNode) instruction).getOperator() != OperatorList.MALLOC)
                    block.getUseIRRegisters().add(((OpIRNode) instruction).getDestIRRegister());
            }
            if (instruction instanceof RetIRNode) block.getUseIRRegisters().add(((RetIRNode) instruction).getReturnIRRegister());
        }
    }

    private void blockAnalyze(List<BlockIRNode> blocks) {
        while (true) {
            boolean diff = false;
            for (BlockIRNode block : blocks) {
                Set<IRRegister> lastLiveIRRegister = new HashSet<>(block.getLiveIRRegister());
                for (BlockIRNode outBlock : block.getOutNodes()) block.getLiveIRRegister().addAll(outBlock.getLiveIRRegister());
                Set<IRRegister> defineIRRegisters = new HashSet<>(block.getDefineIRRegisters());
                Set<IRRegister> useIRRegister = new HashSet<>(block.getUseIRRegisters());
                block.getLiveIRRegister().removeAll(defineIRRegisters);
                block.getLiveIRRegister().addAll(useIRRegister);
                if (!(lastLiveIRRegister.containsAll(block.getLiveIRRegister()) && block.getLiveIRRegister().containsAll(lastLiveIRRegister))) diff = true;
            }
            if (!diff) break;
        }
        for (int reverse = blocks.size() - 1; reverse >= 0; reverse--) {
            BlockIRNode block = blocks.get(reverse);
            for (int i = block.getInstructions().size() - 1; i >= 0; i--) {
                if (i == block.getInstructions().size() - 1)
                    for (BlockIRNode outBlock : block.getOutNodes()) block.getInstructions().get(i).getLiveIRRegister().addAll(outBlock.getLiveIRRegister());
                else block.getInstructions().get(i).getLiveIRRegister().addAll(block.getInstructions().get(i + 1).getLiveIRRegister());
                BaseIRNode instruction = block.getInstructions().get(i);
                List<IRRegister> defineIRRegisters = new ArrayList<>();
                boolean reDefine = false;
                if (instruction instanceof FunctionLabelIRNode)
                    for (VariableEntity parameterEntity : ((FunctionLabelIRNode) instruction).getEntity().getParameterList())
                        defineIRRegisters.add(parameterEntity.getIRRegister());
                if (instruction instanceof CallIRNode) {
                    defineIRRegisters.add(((CallIRNode) instruction).getDestIRRegister());
                    defineIRRegisters.addAll(((CallIRNode) instruction).getFunctionEntry().getEntity().getStaticIRRegisterDefine());
                }
                if (instruction instanceof CmpIRNode) {
                    defineIRRegisters.add(((CmpIRNode) instruction).getDestIRRegister());
                    if (!(((CmpIRNode) instruction).getDestIRRegister().getMemory() instanceof NASMStaticMemory)) reDefine = true;
                }
                if (instruction instanceof OpIRNode && ((OpIRNode) instruction).getOperator() != OperatorList.STORE) {
                    defineIRRegisters.add(((OpIRNode) instruction).getDestIRRegister());
                    if (!(((OpIRNode) instruction).getDestIRRegister().getMemory() instanceof NASMStaticMemory)) reDefine = true;
                }
                for (IRRegister defineIRRegister : defineIRRegisters) if (block.getInstructions().get(i).getLiveIRRegister().contains(defineIRRegister)) reDefine = false;
                block.getInstructions().get(i).getLiveIRRegister().removeAll(defineIRRegisters);
                if (reDefine) block.getInstructions().get(i).remove();
                if (instruction instanceof BranchIRNode) block.getInstructions().get(i).getLiveIRRegister().add(((BranchIRNode) instruction).getConditionIRRegister());
                if (instruction instanceof CallIRNode) {
                    block.getInstructions().get(i).getLiveIRRegister().addAll(((CallIRNode) instruction).getParameterIRRegisters());
                    block.getInstructions().get(i).getLiveIRRegister().addAll(((CallIRNode) instruction).getFunctionEntry().getEntity().getStaticIRRegisterUse());
                }
                if (instruction instanceof CmpIRNode) {
                    block.getInstructions().get(i).getLiveIRRegister().add(((CmpIRNode) instruction).getOperateIRRegister1());
                    block.getInstructions().get(i).getLiveIRRegister().add(((CmpIRNode) instruction).getOperateIRRegister2());
                }
                if (instruction instanceof OpIRNode) {
                    if (((OpIRNode) instruction).getSourceIRRegister() != null) block.getInstructions().get(i).getLiveIRRegister().add(((OpIRNode) instruction).getSourceIRRegister());
                    if (((OpIRNode) instruction).getOperator() != OperatorList.ASSIGN && ((OpIRNode) instruction).getOperator() != OperatorList.LOAD && ((OpIRNode) instruction).getOperator() != OperatorList.MALLOC)
                        block.getInstructions().get(i).getLiveIRRegister().add(((OpIRNode) instruction).getDestIRRegister());
                }
                if (instruction instanceof RetIRNode) block.getInstructions().get(i).getLiveIRRegister().add(((RetIRNode) instruction).getReturnIRRegister());
            }
            List<BaseIRNode> code = new ArrayList<>();
            for (BaseIRNode instruction : block.getInstructions()) if (!instruction.isRemove()) code.add(instruction);
            block.setInstructions(code);
        }
    }

    public List<BlockIRNode> block(List<BaseIRNode> instructions) {
        List<BlockIRNode> blocks = putBlock(instructions);
        for (BlockIRNode block : blocks) instructionAnalyze(block);
        blockAnalyze(blocks);
        return blocks;
    }

}
