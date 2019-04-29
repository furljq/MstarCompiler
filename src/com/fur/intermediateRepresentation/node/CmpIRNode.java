package com.fur.intermediateRepresentation.node;

import com.fur.enumerate.OperatorList;
import com.fur.intermediateRepresentation.IRRegister;
import com.fur.intermediateRepresentation.IntermediateRepresentationVisitor;

public class CmpIRNode extends BaseIRNode {

    private OperatorList operator;
    private IRRegister destIRRegister, operateIRRegister1, operateIRRegister2;

    public CmpIRNode(OperatorList _operator, IRRegister _destRegister, IRRegister _operateRegister1, IRRegister _operateRegister2) {
        operator = _operator;
        destIRRegister = _destRegister;
        operateIRRegister1 = _operateRegister1;
        operateIRRegister2 = _operateRegister2;
    }

    public OperatorList getOperator() {
        return operator;
    }

    public void setDestIRRegister(IRRegister destIRRegister) {
        this.destIRRegister = destIRRegister;
    }

    public IRRegister getDestIRRegister() {
        return destIRRegister;
    }

    public void setOperateIRRegister1(IRRegister operateIRRegister1) {
        this.operateIRRegister1 = operateIRRegister1;
    }

    public IRRegister getOperateIRRegister1() {
        return operateIRRegister1;
    }

    public void setOperateIRRegister2(IRRegister operateIRRegister2) {
        this.operateIRRegister2 = operateIRRegister2;
    }

    public IRRegister getOperateIRRegister2() {
        return operateIRRegister2;
    }

    @Override
    public <T> T accept(IntermediateRepresentationVisitor<? extends T> visitor) {
        return visitor.visitCmpIRNode(this);
    }
}
