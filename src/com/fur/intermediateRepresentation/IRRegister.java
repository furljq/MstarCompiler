package com.fur.intermediateRepresentation;

import com.fur.type.BaseType;

import java.util.ArrayList;
import java.util.List;

public class IRRegister {

    private BaseType type;
    private List<IRRegister> nearbyIRRegisters = new ArrayList<>();
    private IRRegister reallocate;

    public void setType(BaseType type) {
        this.type = type;
    }

    public BaseType getType() {
        return type;
    }

    public List<IRRegister> getNearbyIRRegisters() {
        return nearbyIRRegisters;
    }

    public IRRegister getReallocate() {
        return reallocate;
    }

    public void setReallocate(IRRegister reallocate) {
        this.reallocate = reallocate;
    }

}
