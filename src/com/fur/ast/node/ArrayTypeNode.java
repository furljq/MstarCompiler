package com.fur.ast.node;

import com.fur.ast.ASTVisitor;
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
    public <T> T accept(ASTVisitor<? extends T> visitor) {
        return visitor.visitArrayTypeNode(this);
    }

}
