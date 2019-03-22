package com.fur.abstractSyntaxTree.node;

import org.antlr.v4.runtime.Token;

public abstract class BaseStatementNode extends BaseNode {

    public BaseStatementNode(Token token) {
        super(token);
    }

}
