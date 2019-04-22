package com.fur.symbolTable.Entity;

import com.fur.Position;
import com.fur.intermediateRepresentation.IRRegister;
import com.fur.type.BaseType;

public class VariableEntity extends BaseEntity {

    private BaseType type;
    private IRRegister irRegister;

    public VariableEntity(BaseType _type, BaseEntity _parentEntity, Position _position) {
        super(_parentEntity, _position);
        type = _type;
    }

    public void setIRRegister(IRRegister irRegister) {
        this.irRegister = irRegister;
    }

    public IRRegister getIRRegister() {
        return irRegister;
    }

    public BaseType getType() {
        return type;
    }

}
