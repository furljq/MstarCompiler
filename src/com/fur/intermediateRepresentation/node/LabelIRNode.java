package com.fur.intermediateRepresentation.node;

import com.fur.intermediateRepresentation.IntermediateRepresentationVisitor;
import com.fur.nasm.label.NASMLabel;

public class LabelIRNode extends BaseIRNode {

    private NASMLabel nasmLabel;

    @Override
    public <T> T accept(IntermediateRepresentationVisitor<? extends T> visitor) {
        return visitor.visitLabelIRNode(this);
    }

    public NASMLabel getNasmLabel() {
        return nasmLabel;
    }

    public void setNasmLabel(NASMLabel nasmLabel) {
        this.nasmLabel = nasmLabel;
    }
}
