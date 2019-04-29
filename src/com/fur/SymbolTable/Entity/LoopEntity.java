package com.fur.symbolTable.Entity;

import com.fur.Position;
import com.fur.intermediateRepresentation.node.LabelIRNode;

public class LoopEntity extends BlockEntity {

    private LabelIRNode conditionLabel, continueLabel, breakLabel;

    public LoopEntity(BaseEntity _parentEntity, Position _position) {
        super(_parentEntity, _position);
    }

    public void setConditionLabel(LabelIRNode conditionLabel) {
        this.conditionLabel = conditionLabel;
    }

    public void setContinueLabel(LabelIRNode continueLabel) {
        this.continueLabel = continueLabel;
    }

    public void setBreakLabel(LabelIRNode breakLabel) {
        this.breakLabel = breakLabel;
    }

    public LabelIRNode getConditionLabel() {
        return conditionLabel;
    }

    public LabelIRNode getContinueLabel() {
        return continueLabel;
    }

    public LabelIRNode getBreakLabel() {
        return breakLabel;
    }

}
