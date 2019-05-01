package com.fur.nasm.register;

import com.fur.intermediateRepresentation.IRRegister;
import com.fur.nasm.memory.NASMMemory;

import java.util.ArrayList;
import java.util.List;

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

    public List<String> store() {
        List<String> code = new ArrayList<>();
        if (irRegister == null) return new ArrayList<>();
        NASMMemory memory = irRegister.getMemory();
        code.add("mov\t" + memory.print() + ", " + name);
        return code;
    }

    public List<String> load(IRRegister register) {
        List<String> code = new ArrayList<>();
        if (register.getRegister() != null) code.addAll(register.getRegister().store());
        if (irRegister != null) code.addAll(store());
        code.add("mov\t" + name + ", " + register.getMemory().print());
        register.setRegister(this);
        return code;
    }

}
