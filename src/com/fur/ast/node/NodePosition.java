package com.fur.ast.node;

import org.antlr.v4.runtime.Token;

public class NodePosition {

    private final int line, column;

    NodePosition(Token token) {
        line = token.getLine();
        column = token.getCharPositionInLine();
    }

    public int getLine() {
        return line;
    }

    public int getColumn() {
        return column;
    }

}
