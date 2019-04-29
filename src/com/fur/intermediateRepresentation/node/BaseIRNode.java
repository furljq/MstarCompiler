package com.fur.intermediateRepresentation.node;

import com.fur.intermediateRepresentation.IRRegister;
import com.fur.intermediateRepresentation.IntermediateRepresentationVisitor;

import java.util.HashSet;
import java.util.Set;

public abstract class BaseIRNode {

    private Set<IRRegister> liveIRRegister = new HashSet<>();

    public abstract <T> T accept(IntermediateRepresentationVisitor<? extends T> visitor);

    public Set<IRRegister> getLiveIRRegister() {
        return liveIRRegister;
    }

}
