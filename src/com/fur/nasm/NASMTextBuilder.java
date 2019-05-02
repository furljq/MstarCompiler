package com.fur.nasm;

import com.fur.enumerate.OperatorList;
import com.fur.intermediateRepresentation.IRRegister;
import com.fur.intermediateRepresentation.IntermediateRepresentationBaseVisitor;
import com.fur.intermediateRepresentation.node.*;
import com.fur.nasm.register.NASMRegister;
import com.fur.nasm.register.NASMRegisters;

import java.util.ArrayList;
import java.util.List;

public class NASMTextBuilder extends IntermediateRepresentationBaseVisitor<List<String>> {

    private NASMRegisters registers = new NASMRegisters();

    @Override
    public List<String> visitLabelIRNode(LabelIRNode node) {
        List<String> code = new ArrayList<>();
        code.add(node.getNasmLabel().getName() + ":");
        if (node instanceof FunctionLabelIRNode) {
            code.add("push\trbp");
            code.add("mov\trbp, rsp");
            code.add("sub\trsp, " + ((FunctionLabelIRNode) node).getIrRegisterSize() * 8);
            if (((FunctionLabelIRNode) node).getEntity() != null)
                for (int i = 0; i < ((FunctionLabelIRNode) node).getEntity().getParameterList().size(); i++) {
                    IRRegister parameterIRRegister = ((FunctionLabelIRNode) node).getEntity().getParameterList().get(i).getIRRegister();
                    if (parameterIRRegister.getMemory() == null) continue;
                    if (i < 6) code.add("mov\t" + parameterIRRegister.print() + ", " + registers.getParameterRegister(i));
                    else {
                        NASMRegister freeRegister = registers.getFreeRegister();
                        if (freeRegister == null) freeRegister = registers.getRegister("r8");
                        code.addAll(freeRegister.load(parameterIRRegister));
                    }
                }
        }
        return code;
    }

    @Override
    public List<String> visitCallIRNode(CallIRNode node) {
        List<String> code = new ArrayList<>(registers.getRegister("rax").store());
        for (int i = node.getParameterIRRegisters().size() - 1; i >= 0; i--) {
            IRRegister parameterIRRegister = node.getParameterIRRegisters().get(i);
            if (i < 6) code.addAll(registers.getParameterRegister(i).load(parameterIRRegister));
            else code.add("push\t" + parameterIRRegister.print());
        }
        code.add("call\t" + node.getFunctionEntry().getNasmLabel().getName());
        code.add("mov\t" + node.getDestIRRegister().print() + ", rax");
        return code;
    }

    @Override
    public List<String> visitRetIRNode(RetIRNode node) {
        List<String> code = new ArrayList<>(registers.getRegister("rax").load(node.getReturnIRRegister()));
        code.add("leave");
        code.add("ret");
        return code;
    }

    @Override
    public List<String> visitBranchIRNode(BranchIRNode node) {
        List<String> code = new ArrayList<>();
        code.add("cmp\t" + node.getConditionRegister().print() + ", 0");
        code.add("jz\t" + node.getFalseDestIDNode().getNasmLabel().getName());
        code.add("jmp\t" + node.getTrueDestIRNode().getNasmLabel().getName());
        return code;
    }

    @Override
    public List<String> visitJumpIRNode(JumpIRNode node) {
        List<String> code = new ArrayList<>();
        code.add("jmp\t" + node.getDestLabelNode().getNasmLabel().getName());
        return code;
    }

    @Override
    public List<String> visitCmpIRNode(CmpIRNode node) {
        List<String> code = new ArrayList<>();
        if (node.getOperateIRRegister2().getRegister() == null) {
            NASMRegister freeRegister = registers.getFreeRegister();
            if (freeRegister == null) freeRegister = registers.getRegister("r8");
            code.addAll(freeRegister.load(node.getOperateIRRegister2()));
        }
        code.add("cmp\t" + node.getOperateIRRegister1().print() + ", " + node.getOperateIRRegister2().print());
        String cmpOperator = null;
        if (node.getOperator() == OperatorList.EQUAL) cmpOperator = "sete";
        if (node.getOperator() == OperatorList.NOTEQUAL) cmpOperator = "setne";
        if (node.getOperator() == OperatorList.GT) cmpOperator = "setg";
        if (node.getOperator() == OperatorList.GEQ) cmpOperator = "setge";
        if (node.getOperator() == OperatorList.LT) cmpOperator = "setl";
        if (node.getOperator() == OperatorList.LEQ) cmpOperator = "setle";
        code.add(cmpOperator + "\t" + node.getDestIRRegister().print());
        return code;
    }

    @Override
    public List<String> visitOpIRNode(OpIRNode node) {
        List<String> code = new ArrayList<>();
        if (node.getDestIRRegister().getRegister() == null) {
            NASMRegister freeRegister = registers.getFreeRegister();
            if (freeRegister == null) freeRegister = registers.getRegister("r8");
            code.addAll(freeRegister.load(node.getDestIRRegister()));
        }
        if (node.getOperator() == OperatorList.STORE) {
            NASMRegister sourceRegister = registers.getFreeRegister();
            if (sourceRegister == null) sourceRegister = registers.getRegister("r8");
            code.addAll(sourceRegister.load(node.getSourceIRRegister()));
            NASMRegister destRegister = registers.getFreeRegister();
            if (destRegister == null) destRegister = registers.getRegister("r9");
            code.addAll(destRegister.load(node.getDestIRRegister()));
            code.add("mov\t[" + destRegister.getName() + "], " + sourceRegister.getName());
        } else if (node.getOperator() == OperatorList.MALLOC) {
            code.addAll(registers.getRegister("rax").store());
            if (node.getSourceIRRegister() == null) code.addAll(registers.getParameterRegister(0).load(node.getImmediate()));
            else code.addAll(registers.getParameterRegister(0).load(node.getSourceIRRegister()));
            code.add("call\tmalloc");
            code.add("mov\t" + node.getDestIRRegister().print() + ", rax");
        } else if (node.getOperator() == OperatorList.MOD ||  node.getOperator() == OperatorList.DIV) {
            code.addAll(registers.getRegister("rdx").store());
            code.addAll(registers.getRegister("rax").load(node.getDestIRRegister()));
            code.add("cqo");
            code.add("idiv\t" + node.getSourceIRRegister().print());
            String resultRegister = node.getOperator() == OperatorList.DIV ? "rax" : "rdx";
            code.add("mov\t" + node.getDestIRRegister().print() + ", " + resultRegister);
        } else {
            String operator = null;
            if (node.getOperator() == OperatorList.ASSIGN) operator = "mov";
            if (node.getOperator() == OperatorList.ADD) operator = "add";
            if (node.getOperator() == OperatorList.SUB) operator = "sub";
            if (node.getOperator() == OperatorList.MUL) operator = "imul";
            if (node.getOperator() == OperatorList.XOR) operator = "xor";
            if (node.getOperator() == OperatorList.OR) operator = "or";
            if (node.getOperator() == OperatorList.AND) operator = "and";
            if (node.getOperator() == OperatorList.LEFTSHIFT) operator = "sal";
            if (node.getOperator() == OperatorList.RIGHTSHIFT) operator = "sar";
            String source = node.getSourceIRRegister() == null ? String.valueOf(node.getImmediate()) : node.getSourceIRRegister().print();
            code.add(operator + "\t" + node.getDestIRRegister().print() + ", " + source);
        }
        return code;
    }

}
