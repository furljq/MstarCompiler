package com.fur.nasm.memory;

public class NASMStackMemory extends NASMMemory {

    private int rbpOffset;

    public NASMStackMemory(int rbpOffset) {
        this.rbpOffset = rbpOffset;
    }

    @Override
    public String printWithoutLength() {
        if (rbpOffset >= 0) return "[rbp-" + rbpOffset + "*8]";
        else return "[rbp+" + (-rbpOffset) + "*8]";
    }

}
