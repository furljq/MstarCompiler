package com.fur;

import org.antlr.v4.runtime.Token;

public class Position {

    private final int line, column;

    public Position(Token token) {
        line = token.getLine();
        column = token.getCharPositionInLine();
    }

    public boolean above(Position position) {
        if (line == position.line) return column <= position.column;
        else return line <= position.line;
    }

}
