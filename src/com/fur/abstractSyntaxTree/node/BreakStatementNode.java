package com.fur.abstractSyntaxTree.node;

import com.fur.abstractSyntaxTree.AbstractSyntaxTreeVisitor;
import org.antlr.v4.runtime.Token;

public class BreakStatementNode extends BaseStatementNode {

    public BreakStatementNode(Token token) {
        super(token);
    }

    @Override
    public <T> T accept(AbstractSyntaxTreeVisitor<? extends T> visitor) {
        return visitor.visitBreakStatementNode(this);
    }

}
