package com.fur.nasm;

import com.fur.intermediateRepresentation.node.BaseIRNode;
import com.fur.intermediateRepresentation.node.FunctionLabelIRNode;

import java.util.ArrayList;
import java.util.List;

public class NASMBuilder {

    private NASMDataBuilder dataBuilder = new NASMDataBuilder();
    private NASMTextBuilder textBuilder = new NASMTextBuilder();
    private List<BaseIRNode> instructions;

    public NASMBuilder(List<BaseIRNode> instructions) {
        this.instructions = instructions;
    }

    public List<String> build() {
        List<String> code = new ArrayList<>();
        code.add("default rel");
        List<String> text = new ArrayList<>();
        List<String> data = new ArrayList<>();
        for (BaseIRNode instruction : instructions) {
            text.addAll(textBuilder.visit(instruction));
            List<String> bss = dataBuilder.visit(instruction);
            if (bss != null) data.addAll(bss);
            if (instruction instanceof FunctionLabelIRNode) code.add("global " + ((FunctionLabelIRNode) instruction).getNasmLabel().getName());
        }
        for (String bss : data)
            code.add("global " + bss.split(":", 2)[0]);
        code.add("SECTION .text");
        code.addAll(text);
        code.add("SECTION .data");
        code.add("SECTION .bss");
        code.addAll(data);
        return code;
    }
}
