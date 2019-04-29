package com.fur.intermediateRepresentation.node;

import com.fur.intermediateRepresentation.IRRegister;
import com.fur.intermediateRepresentation.IntermediateRepresentationVisitor;

import java.util.List;

public class CallIRNode extends BaseIRNode {

    private FunctionLabelIRNode functionEntry;
    private List<IRRegister> parameterIRRegisters;
    
    public CallIRNode(FunctionLabelIRNode _functionEntry, List<IRRegister> paramaterIRRegisters) {
        functionEntry = _functionEntry;
        this.parameterIRRegisters = paramaterIRRegisters;
    }

    public FunctionLabelIRNode getFunctionEntry() {
        return functionEntry;
    }

    @Override
    public <T> T accept(IntermediateRepresentationVisitor<? extends T> visitor) {
        return visitor.visitCallIRNode(this);
    }

    public List<IRRegister> getParameterIRRegisters() {
        return parameterIRRegisters;
    }

    public void setParameterIRRegisters(int index, IRRegister irRegister) {
        parameterIRRegisters.set(index, irRegister);
    }

}
