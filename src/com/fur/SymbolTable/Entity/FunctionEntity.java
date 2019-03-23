package com.fur.SymbolTable.Entity;

import com.fur.Position;
import com.fur.type.BaseType;

import java.util.HashMap;
import java.util.Map;

public class FunctionEntity extends BaseEntity {

    private BaseType returnType;
    private Map<String, VariableEntity> scope = new HashMap<>();

    public FunctionEntity(BaseEntity _parentEntity, Position _position) {
        super(_parentEntity, _position);
    }

    public BaseType getReturnType() {
        return returnType;
    }

    public void setReturnType(BaseType returnType) {
        this.returnType = returnType;
    }

    public VariableEntity get(String name) {
        return scope.get(name);
    }

    public VariableEntity put(String name, VariableEntity variableEntity) {
        scope.put(name, variableEntity);
        return variableEntity;
    }

}
