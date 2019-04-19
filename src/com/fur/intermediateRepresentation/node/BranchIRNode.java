package com.fur.intermediateRepresentation.node;

import com.fur.intermediateRepresentation.IRLabel;
import com.fur.intermediateRepresentation.IRRegister;

public class BranchIRNode extends BaseIRNode {
    
    private IRRegister conditionRegister;
    private IRLabel trueDestIRNode, falseDestIDNode;
    
    public BranchIRNode(IRRegister _conditionRegister, IRLabel _trueDestIRNode, IRLabel _falseDestIDNode) {
        conditionRegister = _conditionRegister;
        trueDestIRNode = _trueDestIRNode;
        falseDestIDNode = _falseDestIDNode;
    }

    public IRRegister getConditionRegister() {
        return conditionRegister;
    }

    public IRLabel getTrueDestIRNode() {
        return trueDestIRNode;
    }

    public IRLabel getFalseDestIDNode() {
        return falseDestIDNode;
    }
    
}
