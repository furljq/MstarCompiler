package com.fur.intermediateRepresentation;

import com.fur.nasm.memory.NASMMemory;
import com.fur.nasm.register.NASMRegister;
import com.fur.type.BaseType;

import java.util.HashSet;
import java.util.Set;

public class IRRegister {

    private BaseType type;
    private Set<IRRegister> nearbyIRRegisters = new HashSet<>();
    private IRRegister reallocate;
    private NASMMemory memory;
    private NASMRegister register;
    private Long constValue;

    public void setType(BaseType type) {
        this.type = type;
    }

    public BaseType getType() {
        return type;
    }

    Set<IRRegister> getNearbyIRRegisters() {
        return nearbyIRRegisters;
    }

    public IRRegister getReallocate() {
        if (reallocate == null) return this;
        return reallocate.getReallocate();
    }

    void setReallocate(IRRegister reallocate) {
        this.reallocate = reallocate;
    }

    public NASMMemory getMemory() {
        if (reallocate == null) return memory;
        return reallocate.getMemory();
    }

    public void setMemory(NASMMemory memory) {
        this.memory = memory;
    }

    public NASMRegister getRegister() {
        if (reallocate == null) return register;
        return reallocate.getRegister();
    }

    public void setRegister(NASMRegister register) {
        this.register = register;
    }

    public String print() {
        if (reallocate == null) {
            if (register == null) return memory.print();
            return register.getName();
        }
        return reallocate.print();
    }

    public String printWithoutLength() {
        if (reallocate == null) {
            if (register == null) return memory.printWithoutLength();
            return register.getName();
        }
        return reallocate.printWithoutLength();
    }

    public Long getConstValue() {
        return constValue;
    }

    public void setConstValue(Long constValue) {
        this.constValue = constValue;
    }
}
