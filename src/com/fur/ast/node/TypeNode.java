package com.fur.ast.node;

import com.fur.ast.type.BaseType;
import org.antlr.v4.runtime.Token;

public class TypeNode extends BaseNode {

    private BaseType type;

    public TypeNode(BaseType _type, Token token) {
        super(token);
        type = _type;
    }

    public BaseType getType() {
        return type;
    }

}
