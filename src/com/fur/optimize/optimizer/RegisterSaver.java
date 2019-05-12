package com.fur.optimize.optimizer;

import com.fur.intermediateRepresentation.IRRegister;
import com.fur.intermediateRepresentation.node.*;

import java.util.List;

public class RegisterSaver {

    public void save(List<BaseIRNode> instructions) {
        FunctionLabelIRNode currentFunction = null;
        for (BaseIRNode instruction : instructions) {
            if (instruction instanceof FunctionLabelIRNode) currentFunction = (FunctionLabelIRNode) instruction;
            if (currentFunction != null) {
                if (instruction instanceof BranchIRNode)
                    if (((BranchIRNode) instruction).getConditionIRRegister().getRegister() != null) {
                        currentFunction.getUsedRegisters().add(((BranchIRNode) instruction).getConditionIRRegister().getRegister());
                    }
                if (instruction instanceof CallIRNode)
                    for (IRRegister parameterIRRegister : ((CallIRNode) instruction).getParameterIRRegisters())
                        if (parameterIRRegister.getRegister() != null)
                            currentFunction.getUsedRegisters().add(parameterIRRegister.getRegister());
                if (instruction instanceof CmpIRNode) {
                    if (((CmpIRNode) instruction).getOperateIRRegister1().getRegister() != null)
                        currentFunction.getUsedRegisters().add(((CmpIRNode) instruction).getOperateIRRegister1().getRegister());
                    if (((CmpIRNode) instruction).getOperateIRRegister2().getRegister() != null)
                        currentFunction.getUsedRegisters().add(((CmpIRNode) instruction).getOperateIRRegister2().getRegister());
                }
                if (instruction instanceof OpIRNode) {
                    if (((OpIRNode) instruction).getDestIRRegister().getRegister() != null)
                        currentFunction.getUsedRegisters().add(((OpIRNode) instruction).getDestIRRegister().getRegister());
                    if (((OpIRNode) instruction).getSourceIRRegister() != null)
                        if (((OpIRNode) instruction).getSourceIRRegister().getRegister() != null)
                            currentFunction.getUsedRegisters().add(((OpIRNode) instruction).getSourceIRRegister().getRegister());
                }
                if (instruction instanceof RetIRNode)
                    if (((RetIRNode) instruction).getReturnIRRegister().getRegister() != null)
                        currentFunction.getUsedRegisters().add(((RetIRNode) instruction).getReturnIRRegister().getRegister());
            }
        }
    }

}
