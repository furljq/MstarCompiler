package com.fur.ast.node;

import org.antlr.v4.runtime.Token;

public class ClassTypeNode extends BaseTypeNode {

    private String className;

    public ClassTypeNode(String _className, Token token) {
        super(token);
        className = _className;
    }

    public String getClassName() {
        return className;
    }

}
