package com.fur.intermediateRepresentation;


import com.fur.intermediateRepresentation.node.*;

public interface IntermediateRepresentationVisitor<T> {

    T visit(BaseIRNode node);

    T visitBranchIRNode(BranchIRNode node);
    T visitCmpIRNode(CmpIRNode node);
    T visitCallIRNode(CallIRNode node);
    T visitJumpIRNode(JumpIRNode node);
    T visitFunctionIRNode(FunctionIRNode node);
    T visitLabelIRNode(LabelIRNode node);
    T visitOpIRNode(OpIRNode node);
    T visitRetIRNode(RetIRNode node);

}
