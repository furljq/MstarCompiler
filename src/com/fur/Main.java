package com.fur;

public class Main {

    public static void main(String[] args) throws Exception {
        String mstarFile = "main.mx";
        //Compiler compiler = new Compiler(mstarFile);
        Compiler compiler = new Compiler();
        compiler.compile();
    }

}
