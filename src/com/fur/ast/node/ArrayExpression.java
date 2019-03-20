package com.fur.ast.node;

import org.antlr.v4.runtime.Token;

public class ArrayExpression extends BaseExpressionNode {

    private BaseExpressionNode address;
    private BaseExpressionNode index;

    public ArrayExpression(BaseExpressionNode _address, BaseExpressionNode _index, Token token) {
        super(token);
        address = _address;
        index = _index;
    }

    public BaseExpressionNode getAddress() {
        return address;
    }

    public BaseExpressionNode getIndex() {
        return index;
    }

}
