package com.fur.intermediateRepresentation.node;

import com.fur.enumerate.OperatorList;
import com.fur.intermediateRepresentation.IRRegister;

public class OperateIRNode extends BaseIRNode {

    private OperatorList operator;
    private IRRegister destRegister, operateRegister1, operateRegister2;

    public OperateIRNode(OperatorList _operator, IRRegister _destRegister, IRRegister _operateRegister1, IRRegister _operateRegister2) {
        operator = _operator;
        destRegister = _destRegister;
        operateRegister1 = _operateRegister1;
        operateRegister2 = _operateRegister2;
    }

    public void setDestRegister(IRRegister destRegister) {
        this.destRegister = destRegister;
    }

    public OperatorList getOperator() {
        return operator;
    }

    public IRRegister getDestRegister() {
        return destRegister;
    }

    public IRRegister getOperateRegister1() {
        return operateRegister1;
    }

    public IRRegister getOperateRegister2() {
        return operateRegister2;
    }

}
