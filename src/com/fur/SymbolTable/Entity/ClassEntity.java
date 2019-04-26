package com.fur.symbolTable.Entity;

import com.fur.Position;

import java.util.HashMap;
import java.util.Map;

public class ClassEntity extends BaseEntity {

    private Map<String, BaseEntity> scope = new HashMap<>();
    private Map<String, Integer> index = new HashMap<>();
    private int size = 0;

    public ClassEntity(BaseEntity _parentEntity, Position _position) {
        super(_parentEntity, _position);
    }

    public void putCover(String name, BaseEntity entity) {
        scope.put(name, entity);
        if (entity instanceof VariableEntity)
            index.put(name, size++);
    }

    public void putNew(String name, BaseEntity entity) {
        if (scope.get(name) != null) throw new Error();
        else putCover(name, entity);
    }

    public ClassEntity getClassEntity(String name) {
        BaseEntity classEntity = scope.get(name);
        if (!(classEntity instanceof ClassEntity)) throw new Error();
        return (ClassEntity) classEntity;
    }

    public FunctionEntity getFunctionEntity(String name) {
        BaseEntity functionEntity = scope.get(name);
        if (!(functionEntity instanceof FunctionEntity)) throw new Error();
        return (FunctionEntity) functionEntity;
    }

    public boolean hasFunctionEntity(String name) {
        BaseEntity functionEntity = scope.get(name);
        if (functionEntity == null) return false;
        return functionEntity instanceof FunctionEntity;
    }

    public VariableEntity getVariableEntity(String name) {
        BaseEntity variableEntity = scope.get(name);
        if (!(variableEntity instanceof VariableEntity)) return null;
        return (VariableEntity) variableEntity;
    }

    public int getIndex(String name) {
        return index.get(name);
    }

    public Map<String, BaseEntity> getScope() {
        return scope;
    }

    public int getSize() {
        return size;
    }

}
