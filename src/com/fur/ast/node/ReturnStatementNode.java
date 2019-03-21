package com.fur.ast.node;

import org.antlr.v4.runtime.Token;

public class ReturnStatementNode extends BaseStatementNode {

    private BaseExpressionNode returnExpressionNode;

    public ReturnStatementNode(BaseExpressionNode _returnExpressionNode, Token token) {
        super(token);
        returnExpressionNode = _returnExpressionNode;
    }

    public BaseExpressionNode getReturnExpressionNode() {
        return returnExpressionNode;
    }

}
