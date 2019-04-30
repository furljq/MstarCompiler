package com.fur.nasm;

import com.fur.intermediateRepresentation.IntermediateRepresentationBaseVisitor;
import com.fur.intermediateRepresentation.node.FunctionLabelIRNode;
import com.fur.intermediateRepresentation.node.LabelIRNode;
import com.fur.nasm.label.NASMLabels;
import com.fur.nasm.memory.NASMMemory;
import com.fur.nasm.memory.NASMStackMemory;
import com.fur.nasm.register.NASMRegisters;

import java.util.ArrayList;
import java.util.List;

public class NASMBuilder extends IntermediateRepresentationBaseVisitor<List<String>> {

    private NASMRegisters registers;
    private NASMLabels labels;

    @Override
    public List<String> visitLabelIRNode(LabelIRNode node) {
        List<String> code = new ArrayList<>();
        code.add(labels.getnew().getName() + ":");
        if (node instanceof FunctionLabelIRNode) {
            code.add("push\trbp");
            code.add("mov\trbp, rsp");
            code.add("sub\trsp, " + ((FunctionLabelIRNode) node).getIrRegisterSize());
            for (int i = 0; i < ((FunctionLabelIRNode) node).getEntity().getParameterList().size(); i++) {
                NASMMemory parameterMemory = ((FunctionLabelIRNode) node).getEntity().getParameterList().get(i).getIRRegister().getReallocate().getMemory();
                if (parameterMemory == null) continue;
                assert parameterMemory instanceof NASMStackMemory;
                if (i == 0) code.add("mov\t" + ((NASMStackMemory) parameterMemory).print() + ", rdi");
                if (i == 1) code.add("mov\t" + ((NASMStackMemory) parameterMemory).print() + ", rsi");
                if (i == 2) code.add("mov\t" + ((NASMStackMemory) parameterMemory).print() + ", rdx");
                if (i == 3) code.add("mov\t" + ((NASMStackMemory) parameterMemory).print() + ", rcx");
                if (i == 4) code.add("mov\t" + ((NASMStackMemory) parameterMemory).print() + ", r8");
                if (i == 5) code.add("mov\t" + ((NASMStackMemory) parameterMemory).print() + ", r9");
                if (i > 5) code.add("mov\t" + ((NASMStackMemory) parameterMemory).print() + ", [rbp + " + (i - 4) + " * 8]");
            }
        }
        return code;
    }

}
