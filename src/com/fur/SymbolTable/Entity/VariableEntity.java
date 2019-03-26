package com.fur.symbolTable.Entity;

import com.fur.Position;
import com.fur.type.BaseType;

public class VariableEntity extends BaseEntity {

    private BaseType type;

    public VariableEntity(BaseType _type, BaseEntity _parentEntity, Position _position) {
        super(_parentEntity, _position);
        type = _type;
    }

    public BaseType getType() {
        return type;
    }

}
