package com.fur.intermediateRepresentation.node;

import com.fur.intermediateRepresentation.IntermediateRepresentationVisitor;

public class JumpIRNode extends BaseIRNode {

    private LabelIRNode destLabelNode;

    public JumpIRNode(LabelIRNode irLabel) {
        this.destLabelNode = irLabel;
    }

    public LabelIRNode getDestLabelNode() {
        return destLabelNode;
    }

    @Override
    public <T> T accept(IntermediateRepresentationVisitor<? extends T> visitor) {
        return visitor.visitJumpIRNode(this);
    }
}
