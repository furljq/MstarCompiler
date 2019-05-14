package com.fur.optimize.optimizer;

import com.fur.enumerate.OperatorList;
import com.fur.enumerate.PrimaryTypeList;
import com.fur.intermediateRepresentation.IRRegister;
import com.fur.intermediateRepresentation.node.*;
import com.fur.nasm.label.NASMLabels;
import com.fur.nasm.memory.NASMStackMemory;
import com.fur.nasm.memory.NASMStaticMemory;
import com.fur.type.PrimaryType;

import java.util.ArrayList;
import java.util.List;

public class FunctionRecorder {

    private NASMLabels labels = new NASMLabels("table");

    private boolean check(BaseIRNode instruction) {
        if (!(instruction instanceof FunctionLabelIRNode)) return false;
        if (((FunctionLabelIRNode) instruction).getEntity().isPrint()) return false;
        if (!((FunctionLabelIRNode) instruction).getEntity().getStaticIRRegisterDefine().isEmpty()) return false;
        if (!((FunctionLabelIRNode) instruction).getEntity().getStaticIRRegisterUse().isEmpty()) return false;
        if (((FunctionLabelIRNode) instruction).getEntity().getReturnType() == null) return false;
        if (!(((FunctionLabelIRNode) instruction).getEntity().getReturnType().equals(new PrimaryType(PrimaryTypeList.INT)))) return false;
        if (((FunctionLabelIRNode) instruction).getEntity().getParameterList().size() != 1) return false;
        return ((FunctionLabelIRNode) instruction).getEntity().getParameterList().get(0).getType().equals(new PrimaryType(PrimaryTypeList.INT));
    }

    public List<BaseIRNode> functionRecord(List<BaseIRNode> instructions) {
        List<BaseIRNode> initial = new ArrayList<>();
        for (BaseIRNode instruction : instructions) {
            if (check(instruction)) {
                assert instruction instanceof FunctionLabelIRNode;
                ((FunctionLabelIRNode) instruction).setDataTable(new IRRegister());
                ((FunctionLabelIRNode) instruction).setEnableTable(new IRRegister());
                int currentSize = ((FunctionLabelIRNode) instruction).getIrRegisterSize();
                ((FunctionLabelIRNode) instruction).getEnableTable().setMemory(new NASMStaticMemory(labels.getnew()));
                ((FunctionLabelIRNode) instruction).getDataTable().setMemory(new NASMStaticMemory(labels.getnew()));
                ((FunctionLabelIRNode) instruction).setIrRegisterSize(currentSize);
                initial.add(new OpIRNode(OperatorList.MALLOC, ((FunctionLabelIRNode) instruction).getDataTable(), 100 * 8));
                initial.add(new OpIRNode(OperatorList.MALLOC, ((FunctionLabelIRNode) instruction).getEnableTable(), 100 * 8));
            }
        }
        List<BaseIRNode> code = new ArrayList<>();
        FunctionLabelIRNode currentFunction = null;
        IRRegister currentArgumentInSize = null;
        for (BaseIRNode instruction : instructions) {
            if (instruction instanceof FunctionLabelIRNode && ((FunctionLabelIRNode) instruction).getNasmLabel().getName().equals("main")) {
                code.add(instruction);
                code.addAll(initial);
                continue;
            }
            if (instruction instanceof RetIRNode) {
                if (currentFunction != null) {
                    IRRegister argumentIRRegister = new IRRegister();
                    argumentIRRegister.allocateMemory(currentFunction);
                    LabelIRNode breakLabel = new LabelIRNode();
                    code.add(new BranchIRNode(currentArgumentInSize, breakLabel));
                    code.add(new OpIRNode(OperatorList.ASSIGN, argumentIRRegister, currentFunction.getEntity().getParameterList().get(0).getIRRegister()));
                    code.add(new OpIRNode(OperatorList.LEFTSHIFT, argumentIRRegister, 3));
                    code.add(new OpIRNode(OperatorList.ADD, argumentIRRegister, currentFunction.getEnableTable()));
                    code.add(new OpIRNode(OperatorList.STORE, argumentIRRegister, 1));
                    code.add(new OpIRNode(OperatorList.ASSIGN, argumentIRRegister, currentFunction.getEntity().getParameterList().get(0).getIRRegister()));
                    code.add(new OpIRNode(OperatorList.LEFTSHIFT, argumentIRRegister, 3));
                    code.add(new OpIRNode(OperatorList.ADD, argumentIRRegister, currentFunction.getDataTable()));
                    code.add(new OpIRNode(OperatorList.STORE, argumentIRRegister, ((RetIRNode) instruction).getReturnIRRegister()));
                    code.add(breakLabel);
                }
                currentFunction = null;
            }
            code.add(instruction);
            if (check(instruction)) {
                assert instruction instanceof FunctionLabelIRNode;
                currentFunction = (FunctionLabelIRNode) instruction;
                IRRegister argumentIRRegister = new IRRegister();
                argumentIRRegister.allocateMemory(currentFunction);
                currentArgumentInSize = new IRRegister();
                currentArgumentInSize.allocateMemory(currentFunction);
                LabelIRNode breakLabel = new LabelIRNode();
                code.add(new OpIRNode(OperatorList.ASSIGN, currentArgumentInSize, 100));
                code.add(new OpIRNode(OperatorList.ASSIGN, argumentIRRegister, currentFunction.getEntity().getParameterList().get(0).getIRRegister()));
                code.add(new CmpIRNode(OperatorList.LT, currentArgumentInSize, argumentIRRegister, currentArgumentInSize));
                code.add(new BranchIRNode(currentArgumentInSize, breakLabel));
                code.add(new OpIRNode(OperatorList.LEFTSHIFT, argumentIRRegister, 3));
                code.add(new OpIRNode(OperatorList.ADD, argumentIRRegister, currentFunction.getEnableTable()));
                code.add(new OpIRNode(OperatorList.LOAD, argumentIRRegister, argumentIRRegister));
                code.add(new BranchIRNode(argumentIRRegister, breakLabel));
                code.add(new OpIRNode(OperatorList.ASSIGN, argumentIRRegister, currentFunction.getEntity().getParameterList().get(0).getIRRegister()));
                code.add(new OpIRNode(OperatorList.LEFTSHIFT, argumentIRRegister, 3));
                code.add(new OpIRNode(OperatorList.ADD, argumentIRRegister, currentFunction.getDataTable()));
                code.add(new OpIRNode(OperatorList.LOAD, currentFunction.getEntity().getReturnIRRegister(), argumentIRRegister));
                code.add(new JumpIRNode(currentFunction.getEntity().getReturnLabel()));
                code.add(breakLabel);
            }
        }
        return code;
    }

}
