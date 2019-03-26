package com.fur.type;

public class ArrayType extends BaseType {

    private BaseType baseType;

    public ArrayType(BaseType _baseType) {
        baseType = _baseType;
    }

    public BaseType getBaseType() {
        return baseType;
    }

    @Override
    public boolean equals(Object obj) {
        if (!(obj instanceof ArrayType)) return false;
        return baseType.equals(((ArrayType) obj).baseType);
    }

}
