package com.fur.symbolTable.Entity;

import com.fur.Position;

import java.util.HashMap;
import java.util.Map;

public class BlockEntity extends BaseEntity {

    private Map<String, VariableEntity> variableScope = new HashMap<>();
    private Map<Position, BlockEntity> blockScope = new HashMap<>();

    public BlockEntity(BaseEntity _parentEntity, Position _position) {
        super(_parentEntity, _position);
    }

    public VariableEntity get(String name) {
        return variableScope.get(name);
    }

    public BlockEntity get(Position _position) {
        return blockScope.get(_position);
    }

    public void put(String name, VariableEntity variableEntity) {
        variableScope.put(name, variableEntity);
    }

    public void put(Position _position, BlockEntity blockEntity) {
        blockScope.put(_position, blockEntity);
    }

}
