package com.fur.optimize;

import com.fur.intermediateRepresentation.node.BaseIRNode;
import com.fur.optimize.optimizer.Blocker;

import java.util.ArrayList;
import java.util.List;

public class Optimizer {

    private Blocker blocker = new Blocker();

    public List<BaseIRNode> optimize(List<BaseIRNode> instructions) {
        List<BlockIRNode> blocks = blocker.block(instructions);
        List<BaseIRNode> code = new ArrayList<>();
        for (BlockIRNode block : blocks) code.addAll(block.getInstructions());
        return code;
    }

}
