package com.fur.optimize;

import com.fur.enumerate.OperatorList;
import com.fur.intermediateRepresentation.node.BaseIRNode;
import com.fur.intermediateRepresentation.node.LabelIRNode;
import com.fur.intermediateRepresentation.node.OpIRNode;
import com.fur.nasm.register.NASMRegisters;
import com.fur.optimize.optimizer.*;

import java.util.ArrayList;
import java.util.List;

public class Optimizer {

    private Blocker blocker = new Blocker();
    private RegisterDistributor registerDistributor;
    private FunctionRecorder functionRecorder = new FunctionRecorder();
    private Allocator allocator = new Allocator();
    private FunctionCalleeSave functionCalleeSave = new FunctionCalleeSave();

    public Optimizer(NASMRegisters registers) {
        registerDistributor = new RegisterDistributor(registers);
    }

    public List<BaseIRNode> optimize(List<BaseIRNode> instructions) {
        blocker.functionAnalyze(instructions);
        instructions = functionRecorder.functionRecord(instructions);
        List<BlockIRNode> blocks = blocker.block(instructions);
        List<BaseIRNode> code = new ArrayList<>();
        for (BlockIRNode block : blocks) code.addAll(block.getInstructions());
        registerDistributor.distribute(code);
        functionCalleeSave.functionCalleeSave(code);
        allocator.allocate(code);
        return code;
    }

}
