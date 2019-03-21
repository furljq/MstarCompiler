package com.fur.ast.node;

import com.fur.ast.ASTVisitor;
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

    @Override
    public <T> T accept(ASTVisitor<? extends T> visitor) {
        return visitor.visitExpressionStatementNode(this);
    }

}
