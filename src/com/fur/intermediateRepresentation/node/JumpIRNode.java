package com.fur.intermediateRepresentation.node;

import com.fur.intermediateRepresentation.IRLabel;

public class JumpIRNode extends BaseIRNode {

    private IRLabel irLabel;

    public JumpIRNode(IRLabel irLabel) {
        this.irLabel = irLabel;
    }

}
