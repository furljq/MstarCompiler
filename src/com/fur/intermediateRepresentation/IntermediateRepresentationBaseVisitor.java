package com.fur.intermediateRepresentation;

import com.fur.intermediateRepresentation.node.*;

public class IntermediateRepresentationBaseVisitor<T> implements IntermediateRepresentationVisitor<T> {
    @Override
    public T visit(BaseIRNode node) {
        return node.accept(this);
    }

    @Override
    public T visitAnnotationIRNode(AnnotationIRNode node) {
        return null;
    }

    @Override
    public T visitBranchIRNode(BranchIRNode node) {
        return null;
    }

    @Override
    public T visitCmpIRNode(CmpIRNode node) {
        return null;
    }

    @Override
    public T visitCallIRNode(CallIRNode node) {
        return null;
    }

    @Override
    public T visitJumpIRNode(JumpIRNode node) {
        return null;
    }

    @Override
    public T visitFunctionIRNode(FunctionIRNode node) {
        return null;
    }

    @Override
    public T visitLabelIRNode(LabelIRNode node) {
        return null;
    }

    @Override
    public T visitOpIRNode(OpIRNode node) {
        return null;
    }

    @Override
    public T visitRetIRNode(RetIRNode node) {
        return null;
    }
}
