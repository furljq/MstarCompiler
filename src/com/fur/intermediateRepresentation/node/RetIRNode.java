package com.fur.intermediateRepresentation.node;

import com.fur.intermediateRepresentation.IRRegister;
import com.fur.intermediateRepresentation.IntermediateRepresentationVisitor;

public class RetIRNode extends BaseIRNode {

    private IRRegister returnIRRegister;
    private long immediate;

    public RetIRNode(IRRegister returnIRRegister) {
        this.returnIRRegister = returnIRRegister;
    }

    public RetIRNode(long immediate) {
        this.immediate = immediate;
    }

    public void setReturnIRRegister(IRRegister returnIRRegister) {
        this.returnIRRegister = returnIRRegister;
    }

    public IRRegister getReturnIRRegister() {
        return returnIRRegister;
    }

    public long getImmediate() {
        return immediate;
    }

    public void setImmediate(long immediate) {
        this.immediate = immediate;
    }

    @Override
    public <T> T accept(IntermediateRepresentationVisitor<? extends T> visitor) {
        return visitor.visitRetIRNode(this);
    }
}
