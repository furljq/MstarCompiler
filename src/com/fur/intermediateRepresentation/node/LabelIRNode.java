package com.fur.intermediateRepresentation.node;

import com.fur.intermediateRepresentation.IntermediateRepresentationVisitor;

public class LabelIRNode extends BaseIRNode {
    @Override
    public <T> T accept(IntermediateRepresentationVisitor<? extends T> visitor) {
        return visitor.visitLabelIRNode(this);
    }
}
