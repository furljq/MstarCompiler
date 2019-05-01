package com.fur.nasm.memory;

public class NASMStackMemory extends NASMMemory {

    private int rbpOffset;

    public NASMStackMemory(int rbpOffset) {
        this.rbpOffset = rbpOffset;
    }

    @Override
    public String print() {
        if (rbpOffset >= 0) return "qword [rbp-" + rbpOffset + "*8]";
        else return "qword [rbp+" + (-rbpOffset) + "*8]";
    }

}
