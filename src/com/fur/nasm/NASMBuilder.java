package com.fur.nasm;

import com.fur.intermediateRepresentation.node.BaseIRNode;
import com.fur.intermediateRepresentation.node.FunctionLabelIRNode;
import com.fur.nasm.register.NASMRegisters;

import java.io.*;
import java.util.ArrayList;
import java.util.List;

public class NASMBuilder {

    private NASMDataBuilder dataBuilder = new NASMDataBuilder();
    private NASMTextBuilder textBuilder;
    private List<BaseIRNode> instructions;

    public NASMBuilder(List<BaseIRNode> instructions, NASMRegisters registers) {
        this.instructions = instructions;
        textBuilder = new NASMTextBuilder(registers);
    }

    private List<String> inbuildFunctions() throws IOException {
        String inbuildFileName = "inbuild.asm";
        File filename = new File(inbuildFileName);
        InputStreamReader reader = new InputStreamReader(
                new FileInputStream(filename));
        BufferedReader bufferedReader = new BufferedReader(reader);
        List<String> code = new ArrayList<>();
        while (true) {
            String line = bufferedReader.readLine();
            if (line == null) return code;
            code.add(line);
        }
    }

    public List<String> build() throws IOException {
        List<String> code = new ArrayList<>();
        code.add("default rel");
        List<String> text = new ArrayList<>();
        List<String> data = new ArrayList<>();
        for (BaseIRNode instruction : instructions) {
            text.addAll(textBuilder.visit(instruction));
            text.add("; IR");
            List<String> bss = dataBuilder.visit(instruction);
            if (bss != null) data.addAll(bss);
            if (instruction instanceof FunctionLabelIRNode) code.add("global " + ((FunctionLabelIRNode) instruction).getNasmLabel().getName());
        }
        for (String bss : data)
            code.add("global " + bss.split(":", 2)[0]);
        code.addAll(inbuildFunctions());
        code.addAll(text);
        code.add("SECTION .data");
        code.add("SECTION .bss");
        code.addAll(data);
        code.add("SECTION .rodata");
        code.add("L_022:\tdb 25H, 73H, 00H");
        return code;
    }

}
