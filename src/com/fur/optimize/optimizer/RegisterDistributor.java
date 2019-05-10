package com.fur.optimize.optimizer;

import com.fur.intermediateRepresentation.IRRegister;
import com.fur.intermediateRepresentation.node.BaseIRNode;
import com.fur.nasm.memory.NASMStackMemory;
import com.fur.nasm.memory.NASMStaticMemory;
import com.fur.nasm.register.NASMRegister;
import com.fur.nasm.register.NASMRegisters;

import java.util.*;

public class RegisterDistributor {

    private NASMRegisters registers;

    public RegisterDistributor(NASMRegisters registers) {
        this.registers = registers;
    }

    public void distribute(List<BaseIRNode> instructions) {
        List<IRRegister> allIRRegisters = new ArrayList<>();
        for (BaseIRNode instruction : instructions) {
            for (IRRegister irRegister1 : instruction.getLiveIRRegister()) {
                if (irRegister1.getMemory() instanceof NASMStaticMemory) continue;
                if (((NASMStackMemory) irRegister1.getMemory()).getRbpOffset() < 0) continue;
                allIRRegisters.add(irRegister1);
                for (IRRegister irRegister2 : instruction.getLiveIRRegister()) if (irRegister1 != irRegister2) {
                    if (irRegister2.getMemory() instanceof NASMStaticMemory) continue;
                    if (((NASMStackMemory) irRegister1.getMemory()).getRbpOffset() < 0) continue;
                    irRegister1.getConflictIRRegisters().add(irRegister2);
                    irRegister2.getConflictIRRegisters().add(irRegister1);
                }
            }
        }
        while (true) {
            boolean diff = false;
            Collections.sort(allIRRegisters);
            for (IRRegister irRegister : allIRRegisters) {
                if (irRegister.getRegister() != null) continue;
                Set<NASMRegister> approachRegisters = new HashSet<>(registers.getCallerSaveRegisters());
                for (IRRegister conflictIRRegister : irRegister.getConflictIRRegisters())
                    if (conflictIRRegister.getRegister() != null)
                        approachRegisters.remove(conflictIRRegister.getRegister());
                List<NASMRegister> chooseRegisters = new ArrayList<>(approachRegisters);
                if (chooseRegisters.size() == 0) break;
                irRegister.setRegister(chooseRegisters.get(0));
                diff = true;
            }
            if (!diff) break;
        }
    }

}
