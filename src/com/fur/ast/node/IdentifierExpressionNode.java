package com.fur.ast.node;

import org.antlr.v4.runtime.Token;

public class IdentifierExpressionNode extends BaseExpressionNode {

    String identifierName;

    public IdentifierExpressionNode(String _identifierName, Token token) {
        super(token);
        identifierName = _identifierName;
    }

    public String getIdentifierName() {
        return identifierName;
    }

}
