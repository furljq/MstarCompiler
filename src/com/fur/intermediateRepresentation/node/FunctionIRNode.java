package com.fur.intermediateRepresentation.node;

import com.fur.intermediateRepresentation.IRRegister;

import java.util.List;

public class FunctionIRNode extends BaseIRNode {

    private List<BaseIRNode> bodyNode;
    private IRRegister returnRegister;

    public FunctionIRNode(List<BaseIRNode> _bodyNode, IRRegister _returnRegister) {
        bodyNode = _bodyNode;
        returnRegister = _returnRegister;
    }

    public List<BaseIRNode> getBodyNode() {
        return bodyNode;
    }

    public IRRegister getReturnRegister() {
        return returnRegister;
    }

}
