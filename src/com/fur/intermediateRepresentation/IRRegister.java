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
        return memory;
    }

    public void setMemory(NASMMemory memory) {
        this.memory = memory;
    }

    public NASMRegister getRegister() {
        return register;
    }

    public void setRegister(NASMRegister register) {
        this.register = register;
    }
}
