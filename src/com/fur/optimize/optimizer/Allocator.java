package com.fur.optimize.optimizer;

import com.fur.intermediateRepresentation.IRRegister;
import com.fur.intermediateRepresentation.node.*;
import com.fur.nasm.label.NASMLabels;

import java.util.List;

public class Allocator {

    private NASMLabels labels = new NASMLabels("label");
    private FunctionLabelIRNode currentFunction = null;

    private void setStackMemory(IRRegister irRegister) {
        if (irRegister.getMemory() == null && irRegister.getRegister() == null)
            irRegister.allocateMemory(currentFunction);
    }

    public void allocate(List<BaseIRNode> instructions) {
        for (BaseIRNode instruction : instructions) {
            if (instruction instanceof FunctionLabelIRNode) currentFunction = (FunctionLabelIRNode) instruction;
            if (currentFunction != null) {
                if (instruction instanceof BranchIRNode) setStackMemory(((BranchIRNode) instruction).getConditionIRRegister());
                if (instruction instanceof OpIRNode) {
                    setStackMemory(((OpIRNode) instruction).getDestIRRegister());
                    if (((OpIRNode) instruction).getSourceIRRegister() != null) setStackMemory(((OpIRNode) instruction).getSourceIRRegister());
                }
                if (instruction instanceof CallIRNode) {
                    setStackMemory(((CallIRNode) instruction).getDestIRRegister());
                    for (IRRegister parameterIRRegister : ((CallIRNode) instruction).getParameterIRRegisters()) setStackMemory(parameterIRRegister);
                }
                if (instruction instanceof CmpIRNode) {
                    setStackMemory(((CmpIRNode) instruction).getDestIRRegister());
                    setStackMemory(((CmpIRNode) instruction).getOperateIRRegister1());
                    setStackMemory(((CmpIRNode) instruction).getOperateIRRegister2());
                }
                if (instruction instanceof RetIRNode) setStackMemory(((RetIRNode) instruction).getReturnIRRegister());
            }
            if (instruction instanceof RetIRNode) {
                currentFunction = null;
            }
        }
        for (BaseIRNode label : instructions) if (label instanceof LabelIRNode) if (((LabelIRNode) label).getNasmLabel() == null)
            ((LabelIRNode) label).setNasmLabel(labels.getnew());
    }
}
