package com.fur.intermediateRepresentation.node;

import com.fur.nasm.register.NASMRegister;
import com.fur.symbolTable.Entity.FunctionEntity;

import java.util.ArrayList;
import java.util.List;

public class FunctionLabelIRNode extends LabelIRNode {

    private FunctionEntity entity;
    private int irRegisterSize;
    private List<NASMRegister> usedRegisters = new ArrayList<>();

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

    public List<NASMRegister> getUsedRegisters() {
        return usedRegisters;
    }
}
