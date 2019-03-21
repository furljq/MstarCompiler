package com.fur.ast.node;

import org.antlr.v4.runtime.Token;

public class BaseNode {

    private NodePosition position;

    BaseNode(Token token) {
        position = new NodePosition(token);
    }

    public NodePosition getPosition() {
        return position;
    }

}
