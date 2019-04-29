package com.fur.intermediateRepresentation.node;

import com.fur.intermediateRepresentation.IntermediateRepresentationVisitor;

public class CallIRNode extends BaseIRNode {

    private LabelIRNode functionEntry;
    
    public CallIRNode(LabelIRNode _functionEntry) {
        functionEntry = _functionEntry;
    }

    public LabelIRNode getFunctionEntry() {
        return functionEntry;
    }

    @Override
    public <T> T accept(IntermediateRepresentationVisitor<? extends T> visitor) {
        return visitor.visitCallIRNode(this);
    }
}
