package com.fur.ast.node;

import com.fur.ast.ASTVisitor;
import org.antlr.v4.runtime.Token;

public class BreakStatementNode extends BaseStatementNode {

    public BreakStatementNode(Token token) {
        super(token);
    }

    @Override
    public <T> T accept(ASTVisitor<? extends T> visitor) {
        return visitor.visitBreakStatementNode(this);
    }

}
