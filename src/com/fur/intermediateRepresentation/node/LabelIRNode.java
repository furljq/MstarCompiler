package com.fur.intermediateRepresentation.node;

import com.fur.intermediateRepresentation.IRLabel;

public class LabelIRNode extends BaseIRNode {

    private IRLabel label;

    public LabelIRNode(IRLabel label) {
        this.label = label;
    }

    public IRLabel getLabel() {
        return label;
    }

}
