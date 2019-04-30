package com.fur.nasm.register;

import com.fur.intermediateRepresentation.IRRegister;

public class NASMRegister {

    private IRRegister irRegister;
    private String name;

    public NASMRegister(String name) {
        this.name = name;
    }

    public IRRegister getIrRegister() {
        return irRegister;
    }

    public void setIrRegister(IRRegister irRegister) {
        this.irRegister = irRegister;
    }

    public String getName() {
        return name;
    }
}
