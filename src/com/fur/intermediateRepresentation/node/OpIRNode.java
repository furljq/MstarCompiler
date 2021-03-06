package com.fur.intermediateRepresentation.node;

import com.fur.enumerate.OperatorList;
import com.fur.intermediateRepresentation.IRRegister;
import com.fur.intermediateRepresentation.IntermediateRepresentationVisitor;

public class OpIRNode extends BaseIRNode {

    private OperatorList operator;
    private IRRegister destIRRegister, sourceIRRegister;
    private long immediate;

    public OpIRNode(OperatorList operator, IRRegister destIRRegister, IRRegister sourceIRRegister) {
        this.operator = operator;
        this.destIRRegister = destIRRegister;
        this.sourceIRRegister = sourceIRRegister;
    }

    public OpIRNode(OperatorList operator, IRRegister destIRRegister, long immediate) {
        this.operator = operator;
        this.destIRRegister = destIRRegister;
        this.immediate = immediate;
    }

    public OperatorList getOperator() {
        return operator;
    }

    public void setDestIRRegister(IRRegister destIRRegister) {
        this.destIRRegister = destIRRegister;
    }

    public IRRegister getDestIRRegister() {
        return destIRRegister;
    }

    public void setSourceIRRegister(IRRegister sourceIRRegister) {
        this.sourceIRRegister = sourceIRRegister;
    }

    public IRRegister getSourceIRRegister() {
        return sourceIRRegister;
    }

    public long getImmediate() {
        return immediate;
    }

    public void setImmediate(long immediate) {
        this.immediate = immediate;
    }

    @Override
    public <T> T accept(IntermediateRepresentationVisitor<? extends T> visitor) {
        return visitor.visitOpIRNode(this);
    }

}
