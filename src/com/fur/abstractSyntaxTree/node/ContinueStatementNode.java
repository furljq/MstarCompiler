package com.fur.abstractSyntaxTree.node;

import com.fur.abstractSyntaxTree.AbstractSyntaxTreeVisitor;
import org.antlr.v4.runtime.Token;

public class ContinueStatementNode extends BaseStatementNode {

    public ContinueStatementNode(Token token) {
        super(token);
    }

    @Override
    public <T> T accept(AbstractSyntaxTreeVisitor<? extends T> visitor) {
        return visitor.visitContinueStatementNode(this);
    }

}
