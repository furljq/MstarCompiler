package com.fur.intermediateRepresentation.node;

import com.fur.intermediateRepresentation.IRLabel;
import com.fur.intermediateRepresentation.IntermediateRepresentationVisitor;

public class CallIRNode extends BaseIRNode {

    private IRLabel functionEntry;
    
    public CallIRNode(IRLabel _functionEntry) {
        functionEntry = _functionEntry;
    }

    public IRLabel getFunctionEntry() {
        return functionEntry;
    }

    @Override
    public <T> T accept(IntermediateRepresentationVisitor<? extends T> visitor) {
        return visitor.visitCallIRNode(this);
    }
}
