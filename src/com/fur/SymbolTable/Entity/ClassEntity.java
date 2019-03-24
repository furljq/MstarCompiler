package com.fur.SymbolTable.Entity;

import com.fur.Position;

import java.util.HashMap;
import java.util.Map;

public class ClassEntity extends BaseEntity {

    private final String CLASSPREFIX = "#CLASS#";
    private final String FUNCTIONPREFIX = "#FUNCTION";
    private final String VARIABLEPREFIX = "#VARIABLE#";

    private Map<String, BaseEntity> scope = new HashMap<>();

    public ClassEntity(BaseEntity _parentEntity, Position _position) {
        super(_parentEntity, _position);
    }

    public void putCover(String name, BaseEntity entity) {
        if (entity instanceof ClassEntity) scope.put(CLASSPREFIX + name, entity);
        if (entity instanceof FunctionEntity) scope.put(FUNCTIONPREFIX + name, entity);
        if (entity instanceof VariableEntity) scope.put(VARIABLEPREFIX + name, entity);
    }

    public void putNew(String name, BaseEntity entity) {
        if (entity instanceof ClassEntity)
            if (getClassEntity(name) != null) throw new Error();
            else putCover(name, entity);
        if (entity instanceof FunctionEntity)
            if (getFunctionEntity(name) != null) throw new Error();
            else putCover(name, entity);
        if (entity instanceof VariableEntity)
            if (getVariableEntity(name) != null) throw new Error();
            else putCover(name, entity);
    }

    public ClassEntity getClassEntity(String name) {
        return (ClassEntity) scope.get(CLASSPREFIX + name);
    }

    public FunctionEntity getFunctionEntity(String name) {
        return (FunctionEntity) scope.get(FUNCTIONPREFIX + name);
    }

    public VariableEntity getVariableEntity(String name) {
        return (VariableEntity) scope.get(VARIABLEPREFIX + name);
    }

}
