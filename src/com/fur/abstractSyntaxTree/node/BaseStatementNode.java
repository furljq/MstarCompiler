package com.fur.abstractSyntaxTree.node;

import com.fur.Position;
import org.antlr.v4.runtime.Token;

public abstract class BaseStatementNode extends BaseNode {

    public BaseStatementNode(Token token) {
        super(token);
    }

    public BaseStatementNode(Position _position) {
        super(_position);
    }

}
