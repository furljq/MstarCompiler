package com.fur.abstractSyntaxTree.node;

import org.antlr.v4.runtime.Token;

public abstract class BaseDeclarationNode extends BaseNode {

    private String name;

    BaseDeclarationNode(String _name, Token token) {
        super(token);
        name = _name;
    }

    public String getName() {
        return name;
    }

}
