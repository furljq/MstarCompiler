package com.fur.nasm.label;

public class NASMLabels {

    private int count;

    public NASMLabel getnew() {
        return new NASMLabel("LABEL" + count);
    }

}
