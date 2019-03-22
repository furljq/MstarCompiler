package com.fur.SymbolTable.Entity;

import java.util.Map;

public class ClassEntity extends BaseEntity {

    private Map<String, BaseEntity> scope;

    public void setScope(Map<String, BaseEntity> scope) {
        this.scope = scope;
    }

    public Map<String, BaseEntity> getScope() {
        return scope;
    }

}
