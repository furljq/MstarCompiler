package com.fur.nasm.memory;

public abstract class NASMMemory {

    public String print() {
        return "qword " + printWithoutLength();
    }

    public abstract String printWithoutLength();

}
