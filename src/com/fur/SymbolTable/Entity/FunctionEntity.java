package com.fur.SymbolTable.Entity;

import com.fur.Position;

import java.util.HashMap;
import java.util.Map;

public class FunctionEntity extends BaseEntity {

    private VariableEntity returnType;
    private Map<String, VariableEntity> variableScope = new HashMap<>();
    private BlockEntity blockEntity;

    public FunctionEntity(VariableEntity _returnType, BaseEntity _parentEntity, Position _position) {
        super(_parentEntity, _position);
        returnType = _returnType;
    }

    public void setBlockEntity(BlockEntity blockEntity) {
        this.blockEntity = blockEntity;
    }

    public VariableEntity getReturnType() {
        return returnType;
    }

    public BlockEntity getBlockEntity() {
        return blockEntity;
    }

    public VariableEntity get(String name) {
        return variableScope.get(name);
    }

    public void put(String name, VariableEntity variableEntity) {
        variableScope.put(name, variableEntity);
    }

}