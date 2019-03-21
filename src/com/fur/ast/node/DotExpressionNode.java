package com.fur.ast.node;

import com.fur.ast.ASTVisitor;
import org.antlr.v4.runtime.Token;

public class DotExpressionNode extends BaseExpressionNode {

    private BaseExpressionNode objectExpressionNode;
    private IdentifierExpressionNode identifierExpressionNode;

    public DotExpressionNode(BaseExpressionNode _objectExpressionNode, IdentifierExpressionNode _identifierExpressionNode, Token token) {
        super(token);
        objectExpressionNode = _objectExpressionNode;
        identifierExpressionNode = _identifierExpressionNode;
    }

    public BaseExpressionNode getObjectExpressionNode() {
        return objectExpressionNode;
    }

    public IdentifierExpressionNode getIdentifierExpressionNode() {
        return identifierExpressionNode;
    }

    @Override
    public <T> T accept(ASTVisitor<? extends T> visitor) {
        return visitor.visitDotExpressionNode(this);
    }

}
