package com.fur.type;

public class ArrayType extends BaseType {

    private BaseType baseType;

    public ArrayType(BaseType _baseType) {
        baseType = _baseType;
    }

    public BaseType getBaseType() {
        return baseType;
    }

}
