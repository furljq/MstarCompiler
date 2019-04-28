package com.fur.nasm;

import com.fur.enumerate.OperatorList;
import com.fur.intermediateRepresentation.IntermediateRepresentationBaseVisitor;
import com.fur.intermediateRepresentation.node.OpIRNode;

import java.util.ArrayList;
import java.util.List;

public class NASMBuilder extends IntermediateRepresentationBaseVisitor<List<String>> {

    @Override
    public List<String> visitOpIRNode(OpIRNode node) {
        List<String> code = new ArrayList<>();
        if (node.getOperator() == OperatorList.ADD) code.add("");
    }
}
