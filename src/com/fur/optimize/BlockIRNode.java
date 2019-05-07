package com.fur.optimize;

import com.fur.intermediateRepresentation.IRRegister;
import com.fur.intermediateRepresentation.node.BaseIRNode;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

public class BlockIRNode {

    private List<BaseIRNode> instructions = new ArrayList<>();
    private List<BlockIRNode> inNodes = new ArrayList<>();
    private List<BlockIRNode> outNodes = new ArrayList<>();
    private Set<IRRegister> defineIRRegisters = new HashSet<>();
    private Set<IRRegister> useIRRegisters = new HashSet<>();

    public List<BlockIRNode> getInNodes() {
        return inNodes;
    }

    public List<BlockIRNode> getOutNodes() {
        return outNodes;
    }

    public List<BaseIRNode> getInstructions() {
        return instructions;
    }

    public void setInstructions(List<BaseIRNode> instructions) {
        this.instructions = instructions;
    }

    public Set<IRRegister> getDefineIRRegisters() {
        return defineIRRegisters;
    }

    public Set<IRRegister> getUseIRRegisters() {
        return useIRRegisters;
    }
}
