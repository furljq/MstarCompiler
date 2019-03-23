package com.fur;

import org.antlr.v4.runtime.Token;

public class Position {

    private final int line, column;

    public Position(Token token) {
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
