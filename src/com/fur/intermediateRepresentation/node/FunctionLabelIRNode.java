package com.fur.intermediateRepresentation.node;

import com.fur.symbolTable.Entity.FunctionEntity;

public class FunctionLabelIRNode extends LabelIRNode {

    private FunctionEntity entity;
    private int irRegisterSize;

    public FunctionLabelIRNode(FunctionEntity entity) {
        this.entity = entity;
    }

    public FunctionEntity getEntity() {
        return entity;
    }

    public int getIrRegisterSize() {
        return irRegisterSize;
    }

    public void setIrRegisterSize(int irRegisterSize) {
        this.irRegisterSize = irRegisterSize;
    }
}
