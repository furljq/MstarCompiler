package com.fur.SymbolTable.Entity;

import com.fur.Position;

import java.util.HashMap;
import java.util.Map;

public class FunctionEntity extends BaseEntity {

    private VariableEntity returnType;
    private Map<String, VariableEntity> scope = new HashMap<>();

    public FunctionEntity(VariableEntity _returnType, BaseEntity _parentEntity, Position _position) {
        super(_parentEntity, _position);
        returnType = _returnType;
    }

    public VariableEntity getReturnType() {
        return returnType;
    }

    public VariableEntity get(String name) {
        return scope.get(name);
    }

    public void put(String name, VariableEntity variableEntity) {
        scope.put(name, variableEntity);
    }

}
