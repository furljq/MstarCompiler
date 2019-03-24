package com.fur.abstractSyntaxTree.node;

import com.fur.Position;
import com.fur.abstractSyntaxTree.AbstractSyntaxTreeVisitor;
import org.antlr.v4.runtime.Token;

public class IdentifierExpressionNode extends BaseExpressionNode {

    String identifierName;

    public IdentifierExpressionNode(String _identifierName, Token token) {
        super(token);
        identifierName = _identifierName;
    }

    public IdentifierExpressionNode(String _identifierName, Position _position) {
        super(_position);
        identifierName = _identifierName;
    }

    public String getIdentifierName() {
        return identifierName;
    }

    @Override
    public <T> T accept(AbstractSyntaxTreeVisitor<? extends T> visitor) {
        return visitor.visitIdentifierExpressionNode(this);
    }

}
