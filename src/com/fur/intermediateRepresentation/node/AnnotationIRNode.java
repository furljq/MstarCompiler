package com.fur.intermediateRepresentation.node;

import com.fur.intermediateRepresentation.IntermediateRepresentationVisitor;

public class AnnotationIRNode extends BaseIRNode {
    private int line;

    public AnnotationIRNode(int line) {
        this.line = line;
    }

    @Override
    public <T> T accept(IntermediateRepresentationVisitor<? extends T> visitor) {
        return visitor.visitAnnotationIRNode(this);
    }

    public int getLine() {
        return line;
    }
}
