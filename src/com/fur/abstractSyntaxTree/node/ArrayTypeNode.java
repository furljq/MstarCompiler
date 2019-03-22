package com.fur.abstractSyntaxTree.node;

import com.fur.abstractSyntaxTree.AbstractSyntaxTreeVisitor;
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

    @Override
    public <T> T accept(AbstractSyntaxTreeVisitor<? extends T> visitor) {
        return visitor.visitArrayTypeNode(this);
    }

}
