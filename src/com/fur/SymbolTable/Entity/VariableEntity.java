package com.fur.symbolTable.Entity;

import com.fur.Position;
import com.fur.type.BaseType;

public class VariableEntity extends BaseEntity {

    private BaseType type;
    private ClassEntity classEntity;

    public VariableEntity(BaseType _type, ClassEntity _classEntity, BaseEntity _parentEntity, Position _position) {
        super(_parentEntity, _position);
        type = _type;
        classEntity = _classEntity;
    }

    public BaseType getType() {
        return type;
    }

    public ClassEntity getClassEntity() {
        return classEntity;
    }

}
