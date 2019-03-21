package com.fur.ast.node;

import org.antlr.v4.runtime.Token;

public class ExpressionStatementNode extends BaseStatementNode {

    private BaseExpressionNode expressionNode;

    public ExpressionStatementNode(BaseExpressionNode _expressionNode, Token token) {
        super(token);
        expressionNode = _expressionNode;
    }

    public BaseExpressionNode getExpressionNode() {
        return expressionNode;
    }

}
