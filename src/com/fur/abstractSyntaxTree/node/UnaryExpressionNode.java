package com.fur.abstractSyntaxTree.node;

import com.fur.abstractSyntaxTree.AbstractSyntaxTreeVisitor;
import com.fur.enumerate.OperatorList;
import org.antlr.v4.runtime.Token;

public class UnaryExpressionNode extends BaseExpressionNode {

    private OperatorList operator;
    private BaseExpressionNode expressionNode;

    public UnaryExpressionNode(OperatorList _operator, BaseExpressionNode _expressionNode, Token token) {
        super(token);
        operator = _operator;
        expressionNode = _expressionNode;
    }

    public OperatorList getOperator() {
        return operator;
    }

    public BaseExpressionNode getExpressionNode() {
        return expressionNode;
    }

    @Override
    public <T> T accept(AbstractSyntaxTreeVisitor<? extends T> visitor) {
        return visitor.visitUnaryExpressionNode(this);
    }

}
