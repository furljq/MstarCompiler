package com.fur.intermediateRepresentation.node;

import com.fur.enumerate.OperatorList;
import com.fur.intermediateRepresentation.IRRegister;

public class OperateIRNode extends BaseIRNode {

    private OperatorList operator;
    private IRRegister destIRRegister, operateIRRegister1, operateIRRegister2;
    private int operateInt;

    public OperateIRNode(OperatorList _operator, IRRegister _destRegister, IRRegister _operateRegister1, IRRegister _operateRegister2) {
        operator = _operator;
        destIRRegister = _destRegister;
        operateIRRegister1 = _operateRegister1;
        operateIRRegister2 = _operateRegister2;
    }

    public OperateIRNode(OperatorList _operator, IRRegister _destRegister, int _operateInt) {
        operator = _operator;
        destIRRegister = _destRegister;
        operateInt = _operateInt;
    }

    public int getOperateInt() {
        return operateInt;
    }

    public void setDestIRRegister(IRRegister destIRRegister) {
        this.destIRRegister = destIRRegister;
    }

    public OperatorList getOperator() {
        return operator;
    }

    public IRRegister getDestIRRegister() {
        return destIRRegister;
    }

    public IRRegister getOperateIRRegister1() {
        return operateIRRegister1;
    }

    public IRRegister getOperateIRRegister2() {
        return operateIRRegister2;
    }

}
