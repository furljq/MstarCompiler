package com.fur.intermediateRepresentation.node;

import com.fur.intermediateRepresentation.IRRegister;

import java.util.Set;

public class FunctionLabelIRNode extends LabelIRNode {

    private Set<IRRegister> irRegisters;

    public Set<IRRegister> getIrRegisters() {
        return irRegisters;
    }
}
