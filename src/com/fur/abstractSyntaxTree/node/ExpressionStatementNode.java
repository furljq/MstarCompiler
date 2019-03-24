package com.fur.abstractSyntaxTree.node;

import com.fur.Position;
import com.fur.abstractSyntaxTree.AbstractSyntaxTreeVisitor;
import org.antlr.v4.runtime.Token;

public class ExpressionStatementNode extends BaseStatementNode {

    private BaseExpressionNode expressionNode;

    public ExpressionStatementNode(BaseExpressionNode _expressionNode, Token token) {
        super(token);
        expressionNode = _expressionNode;
    }

    public ExpressionStatementNode(BaseExpressionNode _expressionNode, Position _position) {
        super(_position);
        expressionNode = _expressionNode;
    }

    public BaseExpressionNode getExpressionNode() {
        return expressionNode;
    }

    @Override
    public <T> T accept(AbstractSyntaxTreeVisitor<? extends T> visitor) {
        return visitor.visitExpressionStatementNode(this);
    }

}
