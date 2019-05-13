package com.fur.nasm.label;

public class NASMLabels {

    private int count;
    private String prefix;

    public NASMLabels(String prefix) {
        this.prefix = prefix;
    }

    public NASMLabel getnew() {
        return new NASMLabel(prefix + count++);
    }

}
