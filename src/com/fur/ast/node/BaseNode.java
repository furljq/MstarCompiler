package com.fur.ast.node;

import com.fur.ast.ASTVisitor;
import org.antlr.v4.runtime.Token;

public abstract class BaseNode {

    private class NodePosition {

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

    private NodePosition position;

    BaseNode(Token token) {
        position = new NodePosition(token);
    }

    public NodePosition getPosition() {
        return position;
    }

    public abstract <T> T accept(ASTVisitor<? extends T> visitor);

}
