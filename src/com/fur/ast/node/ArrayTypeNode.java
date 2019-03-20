package com.fur.ast.node;

import org.antlr.v4.runtime.Token;

public class ArrayTypeNode extends BaseTypeNode {

    private BaseTypeNode baseTypeNode;

    public ArrayTypeNode(BaseTypeNode _baseTypeNode, Token token) {
        super(token);
        baseTypeNode = _baseTypeNode;
    }

    public BaseTypeNode getBaseTypeNode() {
        return baseTypeNode;
    }

}
