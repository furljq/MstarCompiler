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
            code.add("sub\trsp, " + (((FunctionLabelIRNode) node).getIrRegisterSize() + 1) / 2 * 16 + 8);
            if (((FunctionLabelIRNode) node).getEntity() != null)
                for (int i = 0; i < ((FunctionLabelIRNode) node).getEntity().getParameterList().size(); i++) {
                    IRRegister parameterIRRegister = ((FunctionLabelIRNode) node).getEntity().getParameterList().get(i).getIRRegister();
                    if (parameterIRRegister.getMemory() == null) continue;
                    if (i < 6) code.add("mov\t" + parameterIRRegister.print() + ", " + registers.getParameterRegister(i).getName());
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
        code.add("cmp\t" + node.getConditionIRRegister().print() + ", 0");
        code.add("jz\t" + node.getFalseDestIRNode().getNasmLabel().getName());
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
        if (node.getOperator() == OperatorList.EQUAL) code.add("sete al");
        if (node.getOperator() == OperatorList.NOTEQUAL) code.add("setne al");
        if (node.getOperator() == OperatorList.GT) code.add("setg al");
        if (node.getOperator() == OperatorList.GEQ) code.add("setge al");
        if (node.getOperator() == OperatorList.LT) code.add("setl al");
        if (node.getOperator() == OperatorList.LEQ) code.add("setle al");
        code.add("movzx\teax, al");
        code.add("mov\t" + node.getDestIRRegister().print() + ", rax");
        return code;
    }

    @Override
    public List<String> visitOpIRNode(OpIRNode node) {
        List<String> code = new ArrayList<>();
        NASMRegister sourceRegister = registers.getRegister("r8");
        if (node.getSourceIRRegister() == null) code.add("mov\t" + sourceRegister.getName() + ", " + node.getImmediate());
        else code.addAll(sourceRegister.load(node.getSourceIRRegister()));
        if (node.getOperator() == OperatorList.STORE) {
            NASMRegister destRegister = registers.getRegister("r9");
            code.addAll(destRegister.load(node.getDestIRRegister()));
            String length = "qword ";
            code.add("mov\t" + length + "[" + node.getDestIRRegister().print() + "], " + sourceRegister.getName());
            node.getDestIRRegister().getRegister().store();
        }
        if (node.getOperator() == OperatorList.LOAD) {
            NASMRegister tmpRegister = registers.getRegister("r9");
            code.add("mov\t" + tmpRegister.getName() + ", [" + sourceRegister.getName() + "]");
            code.add("mov\t" + node.getDestIRRegister().print() + ", " + tmpRegister.getName());
        }
        if (node.getOperator() == OperatorList.MALLOC) {
            code.add("mov\t" + registers.getParameterRegister(0).getName() + ", " + sourceRegister.getName());
            code.add("call\tmalloc");
            code.add("mov\t" + node.getDestIRRegister().print() + ", rax");
            registers.getRegister("rax").store();
            registers.getParameterRegister(0).store();
        }
        if (node.getOperator() == OperatorList.MOD ||  node.getOperator() == OperatorList.DIV) {
            code.addAll(registers.getRegister("rax").load(node.getDestIRRegister()));
            code.add("cqo");
            code.add("idiv\t" + sourceRegister);
            String resultRegister = node.getOperator() == OperatorList.DIV ? "rax" : "rdx";
            registers.getRegister("rax").store();
            code.add("mov\t" + node.getDestIRRegister().print() + ", " + resultRegister);
        }
        if (node.getOperator() == OperatorList.LEFTSHIFT || node.getOperator() == OperatorList.RIGHTSHIFT) {
            String operator;
            if (node.getOperator() == OperatorList.LEFTSHIFT) operator = "shl";
            else operator = "sar";
            code.add("mov\trcx, " + sourceRegister.getName());
            code.add(operator + "\t" + node.getDestIRRegister().print() + " ,cl");
        }
        if (node.getOperator() == OperatorList.ASSIGN || node.getOperator() == OperatorList.ADD || node.getOperator() == OperatorList.SUB || node.getOperator() == OperatorList.MUL || node.getOperator() == OperatorList.XOR || node.getOperator() == OperatorList.AND || node.getOperator() == OperatorList.OR){
            String operator = null;
            NASMRegister destRegister = registers.getRegister("r9");
            if (node.getOperator() == OperatorList.ASSIGN) operator = "mov";
            if (node.getOperator() == OperatorList.ADD) operator = "add";
            if (node.getOperator() == OperatorList.SUB) operator = "sub";
            if (node.getOperator() == OperatorList.MUL) {
                operator = "imul";
                code.addAll(destRegister.load(node.getDestIRRegister()));
            }
            if (node.getOperator() == OperatorList.XOR) operator = "xor";
            if (node.getOperator() == OperatorList.OR) operator = "or";
            if (node.getOperator() == OperatorList.AND) operator = "and";
            code.add(operator + "\t" + node.getDestIRRegister().print() + ", " + sourceRegister.getName());
            if (node.getOperator() == OperatorList.MUL) code.addAll(destRegister.store());
        }
        if (node.getOperator() == OperatorList.NEG) {
            NASMRegister destRegister = registers.getRegister("r9");
            code.addAll(destRegister.load(node.getDestIRRegister()));
            code.add("neg\t" + destRegister.getName());
            code.addAll(node.getDestIRRegister().getRegister().store());
        }
        if (node.getSourceIRRegister() != null) sourceRegister.store();
        return code;
    }

    @Override
    public List<String> visitAnnotationIRNode(AnnotationIRNode node) {
        List<String> code = new ArrayList<>();
        code.add("; " + node.getLine());
        return code;
    }
}
