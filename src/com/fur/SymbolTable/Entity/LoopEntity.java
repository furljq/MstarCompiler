package com.fur.symbolTable.Entity;

import com.fur.Position;
import com.fur.intermediateRepresentation.IRLabel;

public class LoopEntity extends BlockEntity {

    private IRLabel conditionLabel, continueLabel, breakLabel;

    public LoopEntity(BaseEntity _parentEntity, Position _position) {
        super(_parentEntity, _position);
    }

    public void setConditionLabel(IRLabel conditionLabel) {
        this.conditionLabel = conditionLabel;
    }

    public void setContinueLabel(IRLabel continueLabel) {
        this.continueLabel = continueLabel;
    }

    public void setBreakLabel(IRLabel breakLabel) {
        this.breakLabel = breakLabel;
    }

    public IRLabel getConditionLabel() {
        return conditionLabel;
    }

    public IRLabel getContinueLabel() {
        return continueLabel;
    }

    public IRLabel getBreakLabel() {
        return breakLabel;
    }

}
