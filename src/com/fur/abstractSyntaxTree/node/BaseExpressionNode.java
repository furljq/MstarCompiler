package com.fur.abstractSyntaxTree.node;

import com.fur.Position;
import org.antlr.v4.runtime.Token;

public abstract class BaseExpressionNode extends BaseNode {

    public BaseExpressionNode(Token token) {
        super(token);
    }

    public BaseExpressionNode(Position _position) {
        super(_position);
    }

}
