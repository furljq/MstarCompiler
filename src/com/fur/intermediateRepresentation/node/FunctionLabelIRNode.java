package com.fur.intermediateRepresentation.node;

import com.fur.intermediateRepresentation.IRRegister;
import com.fur.nasm.register.NASMRegister;
import com.fur.symbolTable.Entity.FunctionEntity;

import java.util.HashSet;
import java.util.Set;

public class FunctionLabelIRNode extends LabelIRNode {

    private FunctionEntity entity;
    private int irRegisterSize;
    private IRRegister dataTable, enableTable;
    private Set<NASMRegister> calleeSaveRegisters = new HashSet<>();

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

    public IRRegister getEnableTable() {
        return enableTable;
    }

    public void setEnableTable(IRRegister enableTable) {
        this.enableTable = enableTable;
    }

    public IRRegister getDataTable() {
        return dataTable;
    }

    public void setDataTable(IRRegister dataTable) {
        this.dataTable = dataTable;
    }

    public Set<NASMRegister> getCalleeSaveRegisters() {
        return calleeSaveRegisters;
    }
}
