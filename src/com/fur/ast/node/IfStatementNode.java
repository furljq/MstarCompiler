package com.fur.ast.node;

import org.antlr.v4.runtime.Token;

public class IfStatementNode extends BaseStatementNode {

    private BaseExpressionNode conditionExpressionNode;
    private BaseStatementNode thenStatementNode;
    private BaseStatementNode elseStatementNode;

    public IfStatementNode(BaseExpressionNode _conditionExpressionNode, BaseStatementNode _thenStatementNode, BaseStatementNode _elseStatementNode, Token token) {
        super(token);
        conditionExpressionNode = _conditionExpressionNode;
        thenStatementNode = _thenStatementNode;
        elseStatementNode = _elseStatementNode;
    }

    public BaseExpressionNode getConditionExpressionNode() {
        return conditionExpressionNode;
    }

    public BaseStatementNode getThenStatementNode() {
        return thenStatementNode;
    }

    public BaseStatementNode getElseStatementNode() {
        return elseStatementNode;
    }

}
