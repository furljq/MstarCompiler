package com.fur;

import java.io.IOException;

public class Main {

    public static void main(String[] args) throws IOException {
        String mstarFile = "main.mx";
        Compiler compiler = new Compiler(mstarFile);
        compiler.compile();
    }

}
