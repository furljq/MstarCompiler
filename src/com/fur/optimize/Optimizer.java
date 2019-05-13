package com.fur.optimize;

import com.fur.intermediateRepresentation.node.BaseIRNode;
import com.fur.intermediateRepresentation.node.LabelIRNode;
import com.fur.nasm.label.NASMLabels;
import com.fur.nasm.register.NASMRegisters;
import com.fur.optimize.optimizer.Blocker;
import com.fur.optimize.optimizer.RegisterDistributor;

import java.util.ArrayList;
import java.util.List;

public class Optimizer {

    private Blocker blocker = new Blocker();
    private RegisterDistributor registerDistributor;
    private NASMLabels labels = new NASMLabels("label");

    public Optimizer(NASMRegisters registers) {
        registerDistributor = new RegisterDistributor(registers);
    }

    public List<BaseIRNode> optimize(List<BaseIRNode> instructions) {
        List<BlockIRNode> blocks = blocker.block(instructions);
        List<BaseIRNode> code = new ArrayList<>();
        for (BlockIRNode block : blocks) code.addAll(block.getInstructions());
        registerDistributor.distribute(code);
        for (BaseIRNode label : code) if (label instanceof LabelIRNode) if (((LabelIRNode) label).getNasmLabel() == null) ((LabelIRNode) label).setNasmLabel(labels.getnew());
        return code;
    }

}
