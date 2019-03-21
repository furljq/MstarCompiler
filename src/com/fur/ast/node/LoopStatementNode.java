package com.fur.ast.node;

import org.antlr.v4.runtime.Token;

public class LoopStatementNode extends BaseStatementNode {

    private BaseExpressionNode initExpressionNode;
    private BaseExpressionNode conditionExpressionNode;
    private BaseExpressionNode updateExpressionNode;
    private BaseStatementNode bodyStatementNode;

    public LoopStatementNode(BaseExpressionNode _initExpressionNode, BaseExpressionNode _conditionExpressionNode, BaseExpressionNode _updateExpressionNode, BaseStatementNode _bodyStatementNode, Token token) {
        super(token);
        initExpressionNode = _initExpressionNode;
        conditionExpressionNode = _conditionExpressionNode;
        updateExpressionNode = _updateExpressionNode;
        bodyStatementNode = _bodyStatementNode;
    }

    public BaseExpressionNode getInitExpressionNode() {
        return initExpressionNode;
    }

    public BaseExpressionNode getConditionExpressionNode() {
        return conditionExpressionNode;
    }

    public BaseExpressionNode getUpdateExpressionNode() {
        return updateExpressionNode;
    }

    public BaseStatementNode getBodyStatementNode() {
        return bodyStatementNode;
    }

}
