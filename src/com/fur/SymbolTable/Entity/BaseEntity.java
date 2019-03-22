package com.fur.SymbolTable.Entity;

abstract public class BaseEntity {

    private BaseEntity parentEntity;

    BaseEntity(BaseEntity _parentEntity) {
        parentEntity = _parentEntity;
    }

    public BaseEntity getParentEntity() {
        return parentEntity;
    }

}
