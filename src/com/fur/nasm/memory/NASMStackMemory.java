package com.fur.nasm.memory;

public class NASMStackMemory extends NASMMemory {

    private int rbpOffset;

    public NASMStackMemory(int rbpOffset) {
        this.rbpOffset = rbpOffset;
    }

    public String print() {
        return "qword [rbp - " + rbpOffset + " * 8]";
    }

}
