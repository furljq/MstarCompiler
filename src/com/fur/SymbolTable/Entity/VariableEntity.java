package com.fur.SymbolTable.Entity;

import com.fur.type.BaseType;

public class VariableEntity extends BaseEntity {

    private BaseType type;

    public VariableEntity(BaseType _type) {
        type = _type;
    }

    public BaseType getType() {
        return type;
    }

}
