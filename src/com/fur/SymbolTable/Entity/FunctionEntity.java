package com.fur.symbolTable.Entity;

import com.fur.Position;
import com.fur.intermediateRepresentation.IRRegister;
import com.fur.intermediateRepresentation.node.FunctionLabelIRNode;
import com.fur.intermediateRepresentation.node.LabelIRNode;
import com.fur.type.BaseType;

import java.util.*;

public class FunctionEntity extends BaseEntity {

    private BaseType returnType;
    private List<VariableEntity> parameterList = new ArrayList<>();
    private Map<String, VariableEntity> variableScope = new HashMap<>();
    private BlockEntity blockEntity;

    private IRRegister returnIRRegister;
    private FunctionLabelIRNode entryLabel;
    private LabelIRNode returnLabel;
    private Set<IRRegister> staticIRRegisterDefine = new HashSet<>();
    private Set<IRRegister> staticIRRegisterUse = new HashSet<>();
    private boolean print;

    public void setEntryLabel(FunctionLabelIRNode entryLabel) {
        this.entryLabel = entryLabel;
    }

    public void setReturnLabel(LabelIRNode returnLabel) {
        this.returnLabel = returnLabel;
    }

    public FunctionLabelIRNode getEntryLabel() {
        return entryLabel;
    }

    public LabelIRNode getReturnLabel() {
        return returnLabel;
    }

    public FunctionEntity(BaseEntity _parentEntity, Position _position) {
        super(_parentEntity, _position);
    }

    public void setReturnType(BaseType returnType) {
        this.returnType = returnType;
    }

    public void setBlockEntity(BlockEntity blockEntity) {
        this.blockEntity = blockEntity;
    }

    public BaseType getReturnType() {
        return returnType;
    }

    public List<VariableEntity> getParameterList() {
        return parameterList;
    }

    public BlockEntity getBlockEntity() {
        return blockEntity;
    }

    public VariableEntity get(String name) {
        return variableScope.get(name);
    }

    public void put(String name, VariableEntity variableEntity) {
        variableScope.put(name, variableEntity);
        parameterList.add(variableEntity);
    }

    public void setReturnIRRegister(IRRegister returnIRRegister) {
        this.returnIRRegister = returnIRRegister;
    }

    public IRRegister getReturnIRRegister() {
        return returnIRRegister;
    }

    public Set<IRRegister> getStaticIRRegisterUse() {
        return staticIRRegisterUse;
    }

    public Set<IRRegister> getStaticIRRegisterDefine() {
        return staticIRRegisterDefine;
    }

    public boolean isPrint() {
        return print;
    }

    public void setPrint(boolean print) {
        this.print = print;
    }
}
