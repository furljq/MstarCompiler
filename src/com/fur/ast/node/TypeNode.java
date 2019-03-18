package com.fur.ast.node;

import com.fur.type.Type;
import org.antlr.v4.runtime.Token;

public class TypeNode extends BaseNode {

    private Type type;

    public TypeNode(Type _type, Token token) {
        super(token);
        type = _type;
    }

    public void setType(Type type) {
        this.type = type;
    }

    public Type getType() {
        return type;
    }

}
