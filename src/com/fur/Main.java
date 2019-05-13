package com.fur;

public class Main {

    public static void main(String[] args) throws Exception {
        Compiler compiler = new Compiler("main.mx", "main.asm");
//        Compiler compiler = new Compiler();
        compiler.compile();
    }

}
