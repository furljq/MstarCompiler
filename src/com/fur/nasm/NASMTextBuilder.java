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

    private NASMRegisters registers;

    NASMTextBuilder(NASMRegisters registers) {
        this.registers = registers;
    }

    @Override
    public List<String> visitLabelIRNode(LabelIRNode node) {
        List<String> code = new ArrayList<>();
        code.add(node.getNasmLabel().getName() + ":");
        if (node instanceof FunctionLabelIRNode) {
            code.add("push\trbp");
            code.add("mov\trbp, rsp");
            code.add("sub\trsp, " + (((FunctionLabelIRNode) node).getIrRegisterSize() + 1) / 2 * 16 + 8);
            if (((FunctionLabelIRNode) node).getEntity() != null)
                for (int i = 0; i < ((FunctionLabelIRNode) node).getEntity().getParameterList().size(); i++) {
                    IRRegister parameterIRRegister = ((FunctionLabelIRNode) node).getEntity().getParameterList().get(i).getIRRegister();
                    if (parameterIRRegister.getMemory() == null) continue;
                    if (i < 4) code.add("mov\t" + parameterIRRegister.print() + ", " + registers.getParameterRegister(i).getName());
                }
        }
        return code;
    }

    @Override
    public List<String> visitCallIRNode(CallIRNode node) {
        List<String> code = new ArrayList<>(registers.store());
        for (int i = node.getParameterIRRegisters().size() - 1; i >= 0; i--) {
            IRRegister parameterIRRegister = node.getParameterIRRegisters().get(i);
            if (i < 4) code.add("mov\t" + registers.getParameterRegister(i).getName() + ", " + parameterIRRegister.print());
            else code.add("push\t" + parameterIRRegister.print());
        }
        code.add("call\t" + node.getFunctionEntry().getNasmLabel().getName());
        int extendRegisterSize = node.getParameterIRRegisters().size() - 4;
        if (extendRegisterSize < 0) extendRegisterSize = 0;
        code.add("add\trsp, " + extendRegisterSize * 8);
        code.addAll(registers.load());
        code.add("mov\t" + node.getDestIRRegister().print() + ", rax");
        return code;
    }

    @Override
    public List<String> visitRetIRNode(RetIRNode node) {
        List<String> code = new ArrayList<>();
        code.add("mov\trax, " + node.getReturnIRRegister().print());
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
        code.add("mov\trcx, " + node.getOperateIRRegister2().print());
        code.add("cmp\t" + node.getOperateIRRegister1().print() + ", rcx");
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
        NASMRegister sourceRegister = registers.getRegister("rcx");
        NASMRegister temporaryRegister = registers.getRegister("rdx");
        if (node.getSourceIRRegister() == null) code.add("mov\t" + sourceRegister.getName() + ", " + node.getImmediate());
        else code.add("mov\t" + sourceRegister.getName() + ", " + node.getSourceIRRegister().print());
        if (node.getOperator() == OperatorList.STORE) {
            code.add("mov\t" + temporaryRegister.getName() + ", " + node.getDestIRRegister().print());
            code.add("mov\tqword [" + temporaryRegister.getName() + "], " + sourceRegister.getName());
        }
        if (node.getOperator() == OperatorList.LOAD) {
            code.add("mov\t" + temporaryRegister.getName() + ", [" + sourceRegister.getName() + "]");
            code.add("mov\t" + node.getDestIRRegister().print() + ", " + temporaryRegister.getName() + "");
        }
        if (node.getOperator() == OperatorList.MALLOC) {
            code.addAll(registers.store());
            code.add("mov\trdi, " + sourceRegister.getName());
            code.add("call\tmalloc");
            code.addAll(registers.load());
            code.add("mov\t" + node.getDestIRRegister().print() + ", rax");
        }
        if (node.getOperator() == OperatorList.MOD ||  node.getOperator() == OperatorList.DIV) {
            code.add("mov\trax, " + node.getDestIRRegister().print());
            code.add("cqo");
            code.add("idiv\t" + sourceRegister.getName());
            String resultRegisterName = node.getOperator() == OperatorList.DIV ? "rax" : "rdx";
            code.add("mov\t" + node.getDestIRRegister().print() + ", " + resultRegisterName);
        }
        if (node.getOperator() == OperatorList.LEFTSHIFT || node.getOperator() == OperatorList.RIGHTSHIFT) {
            String operator;
            if (node.getOperator() == OperatorList.LEFTSHIFT) operator = "shl";
            else operator = "sar";
            code.add(operator + "\t" + node.getDestIRRegister().print() + " ,cl");
        }
        if (node.getOperator() == OperatorList.MUL) {
            code.add("mov\t" + temporaryRegister.getName() + ", " + node.getDestIRRegister().print());
            code.add("imul\t" + temporaryRegister.getName() + ", " + sourceRegister.getName());
            code.add("mov\t" + node.getDestIRRegister().print() + ", " + temporaryRegister.getName() + "");
        }
        if (node.getOperator() == OperatorList.NEG) {
            code.add("mov\t" + temporaryRegister.getName() + ", " + node.getDestIRRegister().print());
            code.add("neg\t" + temporaryRegister.getName() + "");
            code.add("mov\t" + node.getDestIRRegister().print() + ", " + temporaryRegister.getName() + "");
        }
        if (node.getOperator() == OperatorList.ASSIGN || node.getOperator() == OperatorList.ADD || node.getOperator() == OperatorList.SUB || node.getOperator() == OperatorList.XOR || node.getOperator() == OperatorList.AND || node.getOperator() == OperatorList.OR){
            String operator = null;
            if (node.getOperator() == OperatorList.ASSIGN) operator = "mov";
            if (node.getOperator() == OperatorList.ADD) operator = "add";
            if (node.getOperator() == OperatorList.SUB) operator = "sub";
            if (node.getOperator() == OperatorList.XOR) operator = "xor";
            if (node.getOperator() == OperatorList.OR) operator = "or";
            if (node.getOperator() == OperatorList.AND) operator = "and";
            code.add(operator + "\t" + node.getDestIRRegister().print() + ", " + sourceRegister.getName());
        }
        return code;
    }

    @Override
    public List<String> visitAnnotationIRNode(AnnotationIRNode node) {
        List<String> code = new ArrayList<>();
        code.add("; " + node.getLine());
        return code;
    }
}
