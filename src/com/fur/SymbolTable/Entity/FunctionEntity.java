package com.fur.SymbolTable.Entity;

import com.fur.type.BaseType;

import java.util.Map;

public class FunctionEntity extends BaseEntity {

    private BaseType returnType;
    private Map<String, VariableEntity> parameterEntityMap;

    public FunctionEntity(BaseType _returnType, Map<String, VariableEntity> _parameterEntityMap, BaseEntity _parentEntity) {
        super(_parentEntity);
        returnType = _returnType;
        parameterEntityMap = _parameterEntityMap;
    }

    public BaseType getReturnType() {
        return returnType;
    }

    public Map<String, VariableEntity> getParameterEntityMap() {
        return parameterEntityMap;
    }

}
