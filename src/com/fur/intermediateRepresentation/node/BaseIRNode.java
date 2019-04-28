package com.fur.intermediateRepresentation.node;

import com.fur.intermediateRepresentation.IntermediateRepresentationVisitor;

public abstract class BaseIRNode {

    public abstract <T> T accept(IntermediateRepresentationVisitor<? extends T> visitor);

}
