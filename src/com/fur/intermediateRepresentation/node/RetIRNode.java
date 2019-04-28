package com.fur.intermediateRepresentation.node;

import com.fur.intermediateRepresentation.IntermediateRepresentationVisitor;

public class RetIRNode extends BaseIRNode {

    @Override
    public <T> T accept(IntermediateRepresentationVisitor<? extends T> visitor) {
        return visitor.visitRetIRNode(this);
    }

}
