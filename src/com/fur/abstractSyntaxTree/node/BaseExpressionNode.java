package com.fur.abstractSyntaxTree.node;

import com.fur.Position;
import com.fur.type.BaseType;
import org.antlr.v4.runtime.Token;

public abstract class BaseExpressionNode extends BaseNode {

    private BaseType type;

    public BaseExpressionNode(Token token) {
        super(token);
    }

    public BaseExpressionNode(Position _position) {
        super(_position);
    }

    public BaseType getType() {
        return type;
    }

    public void setType(BaseType type) {
        this.type = type;
    }

}
