package com.fur.optimize;

import com.fur.intermediateRepresentation.node.BaseIRNode;
import com.fur.optimize.optimizer.Blocker;

import java.util.List;

public class Optimizer {

    private Blocker blocker = new Blocker();

    List<BaseIRNode> optimize(List<BaseIRNode> instructions) {
        List<BlockIRNode> blocks = blocker.block(instructions);
        return instructions;
    }

}
