package com.fur.intermediateRepresentation.node;

import com.fur.intermediateRepresentation.IRLabel;
import com.fur.intermediateRepresentation.IntermediateRepresentationVisitor;

public class JumpIRNode extends BaseIRNode {

    private IRLabel irLabel;

    public JumpIRNode(IRLabel irLabel) {
        this.irLabel = irLabel;
    }

    @Override
    public <T> T accept(IntermediateRepresentationVisitor<? extends T> visitor) {
        return visitor.visitJumpIRNode(this);
    }
}
