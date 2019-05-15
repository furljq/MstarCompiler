package com.fur.optimize.optimizer;

import com.fur.intermediateRepresentation.node.*;

import java.util.List;

public class FunctionCalleeSave {

    public void functionCalleeSave(List<BaseIRNode> instructions) {
        FunctionLabelIRNode currentFunction = null;
        for (BaseIRNode instruction : instructions) {
            if (instruction instanceof FunctionLabelIRNode) currentFunction = (FunctionLabelIRNode) instruction;
            if (instruction instanceof OpIRNode) if (((OpIRNode) instruction).getDestIRRegister().getRegister() != null) {
                assert currentFunction != null;
                currentFunction.getCalleeSaveRegisters().add(((OpIRNode) instruction).getDestIRRegister().getRegister());
            }
            if (instruction instanceof CallIRNode) if (((CallIRNode) instruction).getDestIRRegister().getRegister() != null) {
                assert currentFunction != null;
                currentFunction.getCalleeSaveRegisters().add(((CallIRNode) instruction).getDestIRRegister().getRegister());
            }
            if (instruction instanceof CmpIRNode) if (((CmpIRNode) instruction).getDestIRRegister().getRegister() != null) {
                assert currentFunction != null;
                currentFunction.getCalleeSaveRegisters().add(((CmpIRNode) instruction).getDestIRRegister().getRegister());
            }
        }
    }

}
