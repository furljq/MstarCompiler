package com.fur.intermediateRepresentation;

import com.fur.type.BaseType;

import java.util.HashSet;
import java.util.Set;

public class IRRegister {

    private BaseType type;
    private Set<IRRegister> nearbyIRRegisters = new HashSet<>();
    private IRRegister reallocate;

    public void setType(BaseType type) {
        this.type = type;
    }

    public BaseType getType() {
        return type;
    }

    public Set<IRRegister> getNearbyIRRegisters() {
        return nearbyIRRegisters;
    }

    public IRRegister getReallocate() {
        return reallocate;
    }

    public void setReallocate(IRRegister reallocate) {
        this.reallocate = reallocate;
    }

}
