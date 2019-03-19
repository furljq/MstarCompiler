package com.fur.ast.type;

import com.fur.ast.enumerate.TypeList;

public class BaseType {

    TypeList type;

    public BaseType(TypeList _type) {
        type = _type;
    }

    public TypeList getType() {
        return type;
    }

}
