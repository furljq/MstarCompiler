package com.fur.abstractSyntaxTree.node;

import com.fur.abstractSyntaxTree.AbstractSyntaxTreeVisitor;
import org.antlr.v4.runtime.Token;

public class LoopStatementNode extends BaseStatementNode {

    private BaseExpressionNode initExpressionNode;
    private BaseExpressionNode conditionExpressionNode;
    private BaseExpressionNode updateExpressionNode;
    private BlockStatementNode bodyStatementNode;

    public LoopStatementNode(BaseExpressionNode _initExpressionNode, BaseExpressionNode _conditionExpressionNode, BaseExpressionNode _updateExpressionNode, BlockStatementNode _bodyStatementNode, Token token) {
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

    public BlockStatementNode getBodyStatementNode() {
        return bodyStatementNode;
    }

    @Override
    public <T> T accept(AbstractSyntaxTreeVisitor<? extends T> visitor) {
        return visitor.visitLoopStatementNode(this);
    }

}
