package com.fur.ast.node;

import org.antlr.v4.runtime.Token;

public class DeclarationNode extends BaseNode {

    private String name;

    DeclarationNode(String _name, Token token) {
        super(token);
        name = _name;
    }

    public String getName() {
        return name;
    }

}
