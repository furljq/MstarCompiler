package com.fur.ast.node;

import org.antlr.v4.runtime.Token;

public class TypeNode extends BaseNode {

    private String typeName;
    private int dimension;

    public TypeNode(String _typeName, int _dimension, Token token) {
        super(token);
        typeName = _typeName;
        dimension = _dimension;
    }

    public void setDimension(int dimension) {
        this.dimension = dimension;
    }

    public String getType() {
        return typeName;
    }

    public int getDimension() {
        return dimension;
    }

}
