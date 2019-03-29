package com.fur.abstractSyntaxTree.node;

import com.fur.abstractSyntaxTree.AbstractSyntaxTreeVisitor;
import org.antlr.v4.runtime.Token;

public class IfStatementNode extends BaseStatementNode {

    private BaseExpressionNode conditionExpressionNode;
    private BlockStatementNode thenStatementNode;
    private BlockStatementNode elseStatementNode;

    public IfStatementNode(BaseExpressionNode _conditionExpressionNode, BlockStatementNode _thenStatementNode, BlockStatementNode _elseStatementNode, Token token) {
        super(token);
        conditionExpressionNode = _conditionExpressionNode;
        thenStatementNode = _thenStatementNode;
        elseStatementNode = _elseStatementNode;
    }

    public BaseExpressionNode getConditionExpressionNode() {
        return conditionExpressionNode;
    }

    public BlockStatementNode getThenStatementNode() {
        return thenStatementNode;
    }

    public BlockStatementNode getElseStatementNode() {
        return elseStatementNode;
    }

    @Override
    public <T> T accept(AbstractSyntaxTreeVisitor<? extends T> visitor) {
        return visitor.visitIfStatementNode(this);
    }

}
