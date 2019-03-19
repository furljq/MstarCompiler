package com.fur.ast.type;

import com.fur.ast.enumerate.TypeList;

public class ArrayType extends BaseType {

    BaseType baseType;

    public ArrayType(BaseType _baseType) {
        super(TypeList.ARRAY);
        baseType = _baseType;
    }

}
