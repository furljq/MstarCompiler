package com.fur.nasm.memory;

import com.fur.nasm.label.NASMLabel;

public class NASMStaticMemory extends NASMMemory {

    private NASMLabel label;

    @Override
    public String print() {
        return "[rel " + label + "]";
    }

}
