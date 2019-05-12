package com.fur.optimize.optimizer;

import com.fur.intermediateRepresentation.IRRegister;
import com.fur.intermediateRepresentation.node.*;
import com.fur.nasm.register.NASMRegister;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

public class RegisterSaver {

    public void save(List<BaseIRNode> instructions) {
        FunctionLabelIRNode currentFunction = null;
        Set<NASMRegister> usedRegisters = null;
        for (BaseIRNode instruction : instructions) {
            if (instruction instanceof FunctionLabelIRNode) {
                currentFunction = (FunctionLabelIRNode) instruction;
                usedRegisters = new HashSet<>();
            }
            if (currentFunction != null) {
                if (instruction instanceof BranchIRNode)
                    if (((BranchIRNode) instruction).getConditionIRRegister().getRegister() != null)
                        usedRegisters.add(((BranchIRNode) instruction).getConditionIRRegister().getRegister());
                if (instruction instanceof CallIRNode)
                    for (IRRegister parameterIRRegister : ((CallIRNode) instruction).getParameterIRRegisters())
                        if (parameterIRRegister.getRegister() != null)
                            usedRegisters.add(parameterIRRegister.getRegister());
                if (instruction instanceof CmpIRNode) {
                    if (((CmpIRNode) instruction).getOperateIRRegister1().getRegister() != null)
                        usedRegisters.add(((CmpIRNode) instruction).getOperateIRRegister1().getRegister());
                    if (((CmpIRNode) instruction).getOperateIRRegister2().getRegister() != null)
                        usedRegisters.add(((CmpIRNode) instruction).getOperateIRRegister2().getRegister());
                }
                if (instruction instanceof OpIRNode) {
                    if (((OpIRNode) instruction).getDestIRRegister().getRegister() != null)
                        usedRegisters.add(((OpIRNode) instruction).getDestIRRegister().getRegister());
                    if (((OpIRNode) instruction).getSourceIRRegister() != null)
                        if (((OpIRNode) instruction).getSourceIRRegister().getRegister() != null)
                            usedRegisters.add(((OpIRNode) instruction).getSourceIRRegister().getRegister());
                }
                if (instruction instanceof RetIRNode) {
                    if (((RetIRNode) instruction).getReturnIRRegister().getRegister() != null)
                        usedRegisters.add(((RetIRNode) instruction).getReturnIRRegister().getRegister());
                    List<NASMRegister> registerList = new ArrayList<>(usedRegisters);
                    currentFunction.setUsedRegisters(registerList);
                }
            }
        }
    }

}
