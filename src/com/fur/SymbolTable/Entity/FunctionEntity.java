package com.fur.SymbolTable.Entity;

import java.util.List;

public class FunctionEntity extends BaseEntity {

    private String returnType;
    private List<VariableEntity> parameterEntities;

    public FunctionEntity(String _returnType, List<VariableEntity> _parameterEntities) {
        returnType = _returnType;
        parameterEntities = _parameterEntities;
    }

    public String getReturnType() {
        return returnType;
    }

    public List<VariableEntity> getParameterEntities() {
        return parameterEntities;
    }

}
