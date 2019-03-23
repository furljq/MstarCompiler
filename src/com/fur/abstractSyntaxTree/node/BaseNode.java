package com.fur.abstractSyntaxTree.node;

import com.fur.Position;
import com.fur.abstractSyntaxTree.AbstractSyntaxTreeVisitor;
import org.antlr.v4.runtime.Token;

public abstract class BaseNode {

    private Position position;

    BaseNode(Token token) {
        position = new Position(token);
    }

    public Position getPosition() {
        return position;
    }

    public abstract <T> T accept(AbstractSyntaxTreeVisitor<? extends T> visitor);

}
