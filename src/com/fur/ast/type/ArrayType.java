package com.fur.ast.type;

public class ArrayType extends BaseType {

    BaseType baseType;

    public ArrayType(BaseType _baseType) {
        super(TypeList.ARRAY);
        baseType = _baseType;
    }

}
