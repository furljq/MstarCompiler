package com.fur.symbolTable.Entity;

import com.fur.Position;
import com.fur.intermediateRepresentation.node.LabelIRNode;

public class IfEntity extends BlockEntity {

    private LabelIRNode thenLabel, elseLabel, endLabel;

    public IfEntity(BaseEntity _parentEntity, Position _position) {
        super(_parentEntity, _position);
    }

    public void setThenLabel(LabelIRNode thenLabel) {
        this.thenLabel = thenLabel;
    }

    public void setElseLabel(LabelIRNode elseLabel) {
        this.elseLabel = elseLabel;
    }

    public void setEndLabel(LabelIRNode endLabel) {
        this.endLabel = endLabel;
    }

    public LabelIRNode getThenLabel() {
        return thenLabel;
    }

    public LabelIRNode getElseLabel() {
        return elseLabel;
    }

    public LabelIRNode getEndLabel() {
        return endLabel;
    }

}
