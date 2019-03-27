package com.fur.type;

import com.fur.enumerate.PrimaryTypeList;

public class ClassType extends BaseType {

    private String className;

    public ClassType(String _className) {
        className = _className;
    }

    public String getClassName() {
        return className;
    }

    @Override
    public boolean equals(Object obj) {
        if (obj instanceof PrimaryType)
            if (((PrimaryType) obj).getType() == PrimaryTypeList.NULL)
                return true;
        if (!(obj instanceof ClassType)) return false;
        return className.equals(((ClassType) obj).className);
    }

}
