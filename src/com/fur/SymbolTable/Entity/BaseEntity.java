package com.fur.SymbolTable.Entity;

import com.fur.Position;

abstract public class BaseEntity {

    private BaseEntity parentEntity;

    private Position position;

    BaseEntity(BaseEntity _parentEntity, Position _position) {
        parentEntity = _parentEntity;
        position = _position;
    }

    public BaseEntity getParentEntity() {
        return parentEntity;
    }

    public Position getPosition() {
        return position;
    }

}
