package com.fur.intermediateRepresentation.node;

import com.fur.intermediateRepresentation.IRLabel;

public class CallIRNode extends BaseIRNode {

    private IRLabel functionEntry;
    
    public CallIRNode(IRLabel _functionEntry) {
        functionEntry = _functionEntry;
    }

    public IRLabel getFunctionEntry() {
        return functionEntry;
    }
    
}
