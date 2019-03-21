package com.fur.ast.node;

import org.antlr.v4.runtime.Token;

import java.util.List;

public class LoopStatementNode extends BaseStatementNode {

    private List<BaseExpressionNode> initExpressionNodes;
    private BaseExpressionNode conditionExpressionNode;
    private List<BaseExpressionNode> updateExpressionNodes;
    private BaseStatementNode bodyStatementNode;

    public LoopStatementNode(List<BaseExpressionNode> _initExpressionNodes, BaseExpressionNode _conditionExpressionNode, List<BaseExpressionNode> _updateExpressionNodes, BaseStatementNode _bodyStatementNode, Token token) {
        super(token);
        initExpressionNodes = _initExpressionNodes;
        conditionExpressionNode = _conditionExpressionNode;
        updateExpressionNodes = _updateExpressionNodes;
        bodyStatementNode = _bodyStatementNode;
    }

    public List<BaseExpressionNode> getInitExpressionNodes() {
        return initExpressionNodes;
    }

    public BaseExpressionNode getConditionExpressionNode() {
        return conditionExpressionNode;
    }

    public List<BaseExpressionNode> getUpdateExpressionNodes() {
        return updateExpressionNodes;
    }

    public BaseStatementNode getBodyStatementNode() {
        return bodyStatementNode;
    }

}
