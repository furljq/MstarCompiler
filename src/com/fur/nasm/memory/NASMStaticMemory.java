package com.fur.nasm.memory;

import com.fur.nasm.label.NASMLabel;

public class NASMStaticMemory extends NASMMemory {

    private NASMLabel label;

    public NASMStaticMemory(NASMLabel label) {
        this.label = label;
    }

    public String getName() {
        return label.getName();
    }

    @Override
    public String print() {
        return "[rel " + label + "]";
    }

}
