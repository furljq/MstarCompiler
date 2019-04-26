package com.fur.intermediateRepresentation.node;

import com.fur.intermediateRepresentation.IRRegister;

public class AddIRNode extends BaseIRNode {

    private IRRegister destIRRegister, sourceIRRegister;
    private int immediate;

    public AddIRNode(IRRegister destIRRegister, IRRegister sourceIRRegister) {
        this.destIRRegister = destIRRegister;
        this.sourceIRRegister = sourceIRRegister;
    }

    public AddIRNode(IRRegister destIRRegister, int immediate) {
        this.destIRRegister = destIRRegister;
        this.immediate = immediate;
    }

}
