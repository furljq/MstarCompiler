package com.fur.symbolTable.Entity;

import com.fur.Position;
import com.fur.intermediateRepresentation.IRLabel;

public class IfEntity extends BlockEntity {

    private IRLabel thenLabel, elseLabel, endLabel;

    public IfEntity(BaseEntity _parentEntity, Position _position) {
        super(_parentEntity, _position);
    }

    public void setThenLabel(IRLabel thenLabel) {
        this.thenLabel = thenLabel;
    }

    public void setElseLabel(IRLabel elseLabel) {
        this.elseLabel = elseLabel;
    }

    public void setEndLabel(IRLabel endLabel) {
        this.endLabel = endLabel;
    }

    public IRLabel getThenLabel() {
        return thenLabel;
    }

    public IRLabel getElseLabel() {
        return elseLabel;
    }

    public IRLabel getEndLabel() {
        return endLabel;
    }

}
