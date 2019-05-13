package com.fur.intermediateRepresentation;

import com.fur.intermediateRepresentation.node.FunctionLabelIRNode;
import com.fur.nasm.memory.NASMMemory;
import com.fur.nasm.memory.NASMStackMemory;
import com.fur.nasm.register.NASMRegister;
import com.fur.type.BaseType;

import java.util.HashSet;
import java.util.Set;

public class IRRegister implements Comparable<IRRegister> {

    private BaseType type;
    private Long constValue;
    private Set<IRRegister> conflictIRRegisters = new HashSet<>();
    private NASMMemory memory;
    private NASMRegister register;

    public void setType(BaseType type) {
        this.type = type;
    }

    public BaseType getType() {
        return type;
    }

    public Set<IRRegister> getConflictIRRegisters() {
        return conflictIRRegisters;
    }

    public NASMMemory getMemory() {
        return memory;
    }

    public void setMemory(NASMMemory memory) {
        this.memory = memory;
    }

    public void allocateMemory(FunctionLabelIRNode function) {
        int count = function.getIrRegisterSize();
        memory = new NASMStackMemory(++count);
        function.setIrRegisterSize(count);
    }

    public NASMRegister getRegister() {
        return register;
    }

    public void setRegister(NASMRegister register) {
        this.register = register;
    }

    public String print() {
        if (register != null) return register.getName();
        return memory.print();
    }

    public Long getConstValue() {
        return constValue;
    }

    public void setConstValue(Long constValue) {
        this.constValue = constValue;
    }

    @Override
    public int compareTo(IRRegister o) {
        return Integer.compare(conflictIRRegisters.size(), o.conflictIRRegisters.size());
    }
}
