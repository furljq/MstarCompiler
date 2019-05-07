package com.fur.intermediateRepresentation.node;

import com.fur.intermediateRepresentation.IRRegister;
import com.fur.intermediateRepresentation.IntermediateRepresentationVisitor;
import com.fur.optimize.BlockIRNode;

import java.util.HashSet;
import java.util.Set;

public abstract class BaseIRNode {

    private boolean remove = false;
    private BlockIRNode block;
    private Set<IRRegister> liveIRRegister = new HashSet<>();

    public abstract <T> T accept(IntermediateRepresentationVisitor<? extends T> visitor);

    public Set<IRRegister> getLiveIRRegister() {
        return liveIRRegister;
    }

    public BlockIRNode getBlock() {
        return block;
    }

    public void setBlock(BlockIRNode block) {
        this.block = block;
    }

    public boolean isRemove() {
        return remove;
    }

    public void remove() {
        this.remove = true;
    }
}
