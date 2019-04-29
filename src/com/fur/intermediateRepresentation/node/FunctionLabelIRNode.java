package com.fur.intermediateRepresentation.node;

import com.fur.intermediateRepresentation.IRRegister;
import com.fur.symbolTable.Entity.FunctionEntity;

import java.util.Set;

public class FunctionLabelIRNode extends LabelIRNode {

    private Set<IRRegister> irRegisters;
    private FunctionEntity entity;

    public FunctionLabelIRNode(FunctionEntity entity) {
        this.entity = entity;
    }

    public Set<IRRegister> getIrRegisters() {
        return irRegisters;
    }

    public FunctionEntity getEntity() {
        return entity;
    }

}
