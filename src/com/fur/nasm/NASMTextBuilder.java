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
            registers.store();
            code.add("push\trbp");
            code.add("mov\trbp, rsp");
            code.add("sub\trsp, " + (((FunctionLabelIRNode) node).getIrRegisterSize() + 1) * 8);
            if (((FunctionLabelIRNode) node).getEntity() != null)
                for (int i = 0; i < ((FunctionLabelIRNode) node).getEntity().getParameterList().size(); i++) {
                    IRRegister parameterIRRegister = ((FunctionLabelIRNode) node).getEntity().getParameterList().get(i).getIRRegister();
                    if (parameterIRRegister.getMemory() == null) continue;
                    if (i < 6) code.add("mov\t" + parameterIRRegister.print() + ", " + registers.getParameterRegister(i));
                }
        }
        return code;
    }

    @Override
    public List<String> visitCallIRNode(CallIRNode node) {
        List<String> code = new ArrayList<>(registers.store());
        for (int i = node.getParameterIRRegisters().size() - 1; i >= 0; i--) {
            IRRegister parameterIRRegister = node.getParameterIRRegisters().get(i);
            if (i < 6) code.addAll(registers.getParameterRegister(i).load(parameterIRRegister));
            else code.add("push\t" + parameterIRRegister.print());
        }
        code.add("call\t" + node.getFunctionEntry().getNasmLabel().getName());
        code.add("mov\t" + node.getDestIRRegister().print() + ", rax");
        registers.store();
        return code;
    }

    @Override
    public List<String> visitRetIRNode(RetIRNode node) {
        List<String> code = new ArrayList<>(registers.store());
        code.addAll(registers.getRegister("rax").load(node.getReturnIRRegister()));
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
            NASMRegister freeRegister = registers.getRegister("r8");
            code.addAll(freeRegister.load(node.getOperateIRRegister2()));
        }
        code.add("cmp\t" + node.getOperateIRRegister1().print() + ", " + node.getOperateIRRegister2().print());
        node.getOperateIRRegister2().getRegister().store();
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
        if (node.getOperator() == OperatorList.STORE || node.getOperator() == OperatorList.STORECHAR) {
            if (node.getDestIRRegister().getRegister() == null) code.addAll(registers.getRegister("r8").load(node.getDestIRRegister()));
            String length = node.getOperator() == OperatorList.STORE ? "qword " : "";
            if (node.getSourceIRRegister() == null) {
                code.add("mov\tr9, " + node.getImmediate());
                code.add("mov\t" + length + "[" + node.getDestIRRegister().print() + "], r9");
            }
            else {
                code.addAll(registers.getRegister("r9").load(node.getSourceIRRegister()));
                code.add("mov\t" + length + "[" + node.getDestIRRegister().print() + "], " + node.getSourceIRRegister().print());
                node.getSourceIRRegister().getRegister().store();
            }
        } else if (node.getOperator() == OperatorList.MALLOC) {
            if (node.getSourceIRRegister() == null) code.add("mov\t" + registers.getParameterRegister(0).getName() + ", " + node.getImmediate());
            else code.addAll(registers.getParameterRegister(0).load(node.getSourceIRRegister()));
            code.add("call\tmalloc");
            code.add("mov\t" + node.getDestIRRegister().print() + ", rax");
            registers.getRegister("rax").store();
            registers.getParameterRegister(0).store();
        } else if (node.getOperator() == OperatorList.MOD ||  node.getOperator() == OperatorList.DIV) {
            code.addAll(registers.getRegister("rax").load(node.getDestIRRegister()));
            code.add("cqo");
            code.add("idiv\t" + node.getSourceIRRegister().print());
            String resultRegister = node.getOperator() == OperatorList.DIV ? "rax" : "rdx";
            code.add("mov\t" + node.getDestIRRegister().print() + ", " + resultRegister);
            registers.getRegister("rax").store();
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
            if (node.getSourceIRRegister() == null) code.add(operator + "\t" + node.getDestIRRegister().print() + ", " + node.getImmediate());
            else {
                code.addAll(registers.getRegister("r8").load(node.getSourceIRRegister()));
                code.add(operator + "\t" + node.getDestIRRegister().print() + ", " + node.getSourceIRRegister().print());
                node.getSourceIRRegister().getRegister().store();
            }
        }
        return code;
    }

}
