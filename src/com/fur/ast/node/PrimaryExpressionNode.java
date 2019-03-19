package com.fur.ast.node;

import com.fur.ast.enumerate.TypeList;
import org.antlr.v4.runtime.Token;

public class PrimaryExpressionNode extends BaseNode {

    private TypeList type;

    public PrimaryExpressionNode(TypeList _type, Token token) {
        super(token);
        type = _type;
    }

    public TypeList getType() {
        return type;
    }

}
