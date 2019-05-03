package com.fur.type;

public class AddressType extends BaseType {

    private BaseType baseType;

    public AddressType(BaseType baseType) {
        this.baseType = baseType;
    }

    public BaseType getBaseType() {
        return baseType;
    }
}
