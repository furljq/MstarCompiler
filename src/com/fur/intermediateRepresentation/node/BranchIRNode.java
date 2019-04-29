package com.fur.intermediateRepresentation.node;

import com.fur.intermediateRepresentation.IRRegister;
import com.fur.intermediateRepresentation.IntermediateRepresentationVisitor;

public class BranchIRNode extends BaseIRNode {
    
    private IRRegister conditionRegister;
    private LabelIRNode trueDestIRNode, falseDestIDNode;
    
    public BranchIRNode(IRRegister _conditionRegister, LabelIRNode _trueDestIRNode, LabelIRNode _falseDestIDNode) {
        conditionRegister = _conditionRegister;
        trueDestIRNode = _trueDestIRNode;
        falseDestIDNode = _falseDestIDNode;
    }

    public void setConditionRegister(IRRegister conditionRegister) {
        this.conditionRegister = conditionRegister;
    }

    public IRRegister getConditionRegister() {
        return conditionRegister;
    }

    public LabelIRNode getTrueDestIRNode() {
        return trueDestIRNode;
    }

    public LabelIRNode getFalseDestIDNode() {
        return falseDestIDNode;
    }

    @Override
    public <T> T accept(IntermediateRepresentationVisitor<? extends T> visitor) {
        return visitor.visitBranchIRNode(this);
    }
}
