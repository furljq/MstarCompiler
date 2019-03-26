package com.fur.symbolTable.Entity;

import com.fur.Position;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class FunctionEntity extends BaseEntity {

    private VariableEntity returnType;
    private List<VariableEntity> parameterList = new ArrayList<>();
    private Map<String, VariableEntity> variableScope = new HashMap<>();
    private BlockEntity blockEntity;

    public FunctionEntity(BaseEntity _parentEntity, Position _position) {
        super(_parentEntity, _position);
    }

    public void setReturnType(VariableEntity returnType) {
        this.returnType = returnType;
    }

    public void setBlockEntity(BlockEntity blockEntity) {
        this.blockEntity = blockEntity;
    }

    public VariableEntity getReturnType() {
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

}
