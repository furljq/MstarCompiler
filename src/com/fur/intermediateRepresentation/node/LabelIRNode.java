package com.fur.intermediateRepresentation.node;

import com.fur.intermediateRepresentation.IRLabel;
import com.fur.intermediateRepresentation.IntermediateRepresentationVisitor;

public class LabelIRNode extends BaseIRNode {

    private IRLabel label;

    public LabelIRNode(IRLabel label) {
        this.label = label;
    }

    public IRLabel getLabel() {
        return label;
    }

    @Override
    public <T> T accept(IntermediateRepresentationVisitor<? extends T> visitor) {
        return visitor.visitLabelIRNode(this);
    }
}
