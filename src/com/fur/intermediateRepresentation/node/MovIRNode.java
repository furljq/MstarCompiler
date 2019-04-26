package com.fur.intermediateRepresentation.node;

import com.fur.intermediateRepresentation.IRRegister;

public class MovIRNode extends BaseIRNode {

    private IRRegister destIRRegister, sourceIRRegister;
    private int immediate;

    public MovIRNode(IRRegister destIRRegister, int immediate) {
        this.destIRRegister = destIRRegister;
        this.immediate = immediate;
    }

    public MovIRNode(IRRegister destIRRegister, IRRegister sourceIRRegister) {
        this.destIRRegister = destIRRegister;
        this.sourceIRRegister = sourceIRRegister;
    }

    public IRRegister getDestIRRegister() {
        return destIRRegister;
    }

    public int getImmediate() {
        return immediate;
    }

    public IRRegister getSourceIRRegister() {
        return sourceIRRegister;
    }

}
