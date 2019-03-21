package com.fur.ast.node;

import com.fur.ast.ASTVisitor;
import org.antlr.v4.runtime.Token;

public class ContinueStatementNode extends BaseStatementNode {

    public ContinueStatementNode(Token token) {
        super(token);
    }

    @Override
    public <T> T accept(ASTVisitor<? extends T> visitor) {
        return visitor.visitContinueStatementNode(this);
    }

}
