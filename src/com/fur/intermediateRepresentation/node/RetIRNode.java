package com.fur.intermediateRepresentation.node;

import com.fur.intermediateRepresentation.IRRegister;
import com.fur.intermediateRepresentation.IntermediateRepresentationVisitor;

public class RetIRNode extends BaseIRNode {

    private IRRegister returnIRRegister;

    public RetIRNode(IRRegister returnIRRegister) {
        this.returnIRRegister = returnIRRegister;
    }

    @Override
    public <T> T accept(IntermediateRepresentationVisitor<? extends T> visitor) {
        return visitor.visitRetIRNode(this);
    }

    public void setReturnIRRegister(IRRegister returnIRRegister) {
        this.returnIRRegister = returnIRRegister;
    }

    public IRRegister getReturnIRRegister() {
        return returnIRRegister;
    }
}
