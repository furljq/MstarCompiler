package com.fur.intermediateRepresentation.node;

import com.fur.intermediateRepresentation.IRRegister;
import com.fur.intermediateRepresentation.IntermediateRepresentationVisitor;

public class BranchIRNode extends BaseIRNode {
    
    private IRRegister conditionIRRegister;
    private LabelIRNode falseDestIRNode;
    
    public BranchIRNode(IRRegister _conditionRegister, LabelIRNode _falseDestIDNode) {
        conditionIRRegister = _conditionRegister;
        falseDestIRNode = _falseDestIDNode;
    }

    public void setConditionIRRegister(IRRegister conditionIRRegister) {
        this.conditionIRRegister = conditionIRRegister;
    }

    public IRRegister getConditionIRRegister() {
        return conditionIRRegister;
    }

    public LabelIRNode getFalseDestIRNode() {
        return falseDestIRNode;
    }

    @Override
    public <T> T accept(IntermediateRepresentationVisitor<? extends T> visitor) {
        return visitor.visitBranchIRNode(this);
    }
}
