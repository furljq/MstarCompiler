package com.fur.ast.node;

import org.antlr.v4.runtime.Token;

public class NodePosition {

    private final int line, column;

    public NodePosition(int _line, int _column) {
        line = _line;
        column = _column;
    }

    public NodePosition(Token token) {
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
