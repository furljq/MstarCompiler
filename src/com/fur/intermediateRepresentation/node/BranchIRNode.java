package com.fur.intermediateRepresentation.node;

import com.fur.intermediateRepresentation.IRRegister;
import com.fur.intermediateRepresentation.IntermediateRepresentationVisitor;

public class BranchIRNode extends BaseIRNode {
    
    private IRRegister conditionIRRegister;
    private LabelIRNode trueDestIRNode, falseDestIDNode;
    
    public BranchIRNode(IRRegister _conditionRegister, LabelIRNode _trueDestIRNode, LabelIRNode _falseDestIDNode) {
        conditionIRRegister = _conditionRegister;
        trueDestIRNode = _trueDestIRNode;
        falseDestIDNode = _falseDestIDNode;
    }

    public void setConditionIRRegister(IRRegister conditionIRRegister) {
        this.conditionIRRegister = conditionIRRegister;
    }

    public IRRegister getConditionIRRegister() {
        return conditionIRRegister;
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
