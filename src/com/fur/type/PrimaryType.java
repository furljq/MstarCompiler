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

    @Override
    public boolean equals(Object obj) {
        if (type == PrimaryTypeList.NULL) {
            if (obj instanceof ArrayType)
                return true;
            if (obj instanceof ClassType)
                if (!((ClassType) obj).getClassName().equals("string"))
                    return true;
        }
        if (type == PrimaryTypeList.VOID)
            if (obj == null)
                return true;
        if (!(obj instanceof PrimaryType)) return false;
        return type.equals(((PrimaryType) obj).type);
    }

}
