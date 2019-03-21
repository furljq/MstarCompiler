package com.fur.ast.node;

import com.fur.ast.ASTVisitor;
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

    @Override
    public <T> T accept(ASTVisitor<? extends T> visitor) {
        return visitor.visitReturnStatementNode(this);
    }

}
