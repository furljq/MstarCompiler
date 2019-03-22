package com.fur.type;

import com.fur.enumerate.PrimaryTypeList;

public class PrimaryType extends BaseType {

    private PrimaryTypeList type;

    public PrimaryType(PrimaryTypeList _type) {
        type = _type;
    }

    public PrimaryTypeList getType() {
        return type;
    }

}
