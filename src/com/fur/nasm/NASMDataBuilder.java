package com.fur.nasm;

import com.fur.intermediateRepresentation.IRRegister;
import com.fur.intermediateRepresentation.IntermediateRepresentationBaseVisitor;
import com.fur.intermediateRepresentation.node.*;
import com.fur.nasm.memory.NASMStaticMemory;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

public class NASMDataBuilder extends IntermediateRepresentationBaseVisitor<List<String>> {

    private Set<IRRegister> staticIRRegisters = new HashSet<>();

    @Override
    public List<String> visitOpIRNode(OpIRNode node) {
        List<String> code = new ArrayList<>();
        if (node.getDestIRRegister().getMemory() instanceof NASMStaticMemory)
            if (!staticIRRegisters.contains(node.getDestIRRegister())) {
                staticIRRegisters.add(node.getDestIRRegister());
                code.add(((NASMStaticMemory) node.getDestIRRegister().getMemory()).getName() + ":\tresq\t1");
            }
        if (node.getSourceIRRegister() != null)
            if (node.getSourceIRRegister().getMemory() instanceof NASMStaticMemory)
                if (!staticIRRegisters.contains(node.getSourceIRRegister())) {
                    staticIRRegisters.add(node.getSourceIRRegister());
                    code.add(((NASMStaticMemory) node.getSourceIRRegister().getMemory()).getName() + ":\tresq\t1");
                }
        return code;
    }

    @Override
    public List<String> visitCmpIRNode(CmpIRNode node) {
        List<String> code = new ArrayList<>();
        if (node.getDestIRRegister().getMemory() instanceof NASMStaticMemory)
            if (!staticIRRegisters.contains(node.getDestIRRegister())) {
                staticIRRegisters.add(node.getDestIRRegister());
                code.add(((NASMStaticMemory) node.getDestIRRegister().getMemory()).getName() + ":\tresq\t1");
            }
        if (node.getOperateIRRegister1().getMemory() instanceof NASMStaticMemory)
            if (!staticIRRegisters.contains(node.getOperateIRRegister1())) {
                staticIRRegisters.add(node.getOperateIRRegister1());
                code.add(((NASMStaticMemory) node.getOperateIRRegister1().getMemory()).getName() + ":\tresq\t1");
            }
        if (node.getOperateIRRegister2().getMemory() instanceof NASMStaticMemory)
            if (!staticIRRegisters.contains(node.getOperateIRRegister2())) {
                staticIRRegisters.add(node.getOperateIRRegister2());
                code.add(((NASMStaticMemory) node.getOperateIRRegister2().getMemory()).getName() + ":\tresq\t1");
            }
        return code;
    }

    @Override
    public List<String> visitRetIRNode(RetIRNode node) {
        List<String> code = new ArrayList<>();
        if (node.getReturnIRRegister().getMemory() instanceof NASMStaticMemory)
            if (!staticIRRegisters.contains(node.getReturnIRRegister())) {
                staticIRRegisters.add(node.getReturnIRRegister());
                code.add(((NASMStaticMemory) node.getReturnIRRegister().getMemory()).getName() + ":\tresq\t1");
            }
        return code;
    }

    @Override
    public List<String> visitBranchIRNode(BranchIRNode node) {
        List<String> code = new ArrayList<>();
        if (node.getConditionIRRegister().getMemory() instanceof NASMStaticMemory)
            if (!staticIRRegisters.contains(node.getConditionIRRegister())) {
                staticIRRegisters.add(node.getConditionIRRegister());
                code.add(((NASMStaticMemory) node.getConditionIRRegister().getMemory()).getName() + ":\tresq\t1");
            }
        return code;
    }

    @Override
    public List<String> visitCallIRNode(CallIRNode node) {
        List<String> code = new ArrayList<>();
        for (IRRegister parameterIRRegister : node.getParameterIRRegisters())
            if (parameterIRRegister.getMemory() instanceof NASMStaticMemory)
                if (!staticIRRegisters.contains(parameterIRRegister)) {
                    staticIRRegisters.add(parameterIRRegister);
                    code.add(((NASMStaticMemory) parameterIRRegister.getMemory()).getName() + ":\tresq\t1");
                }
        return code;
    }

}
