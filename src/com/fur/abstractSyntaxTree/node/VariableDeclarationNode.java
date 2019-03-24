package com.fur.abstractSyntaxTree.node;

import com.fur.abstractSyntaxTree.AbstractSyntaxTreeVisitor;
import org.antlr.v4.runtime.Token;

public class VariableDeclarationNode extends BaseDeclarationNode {

    private TypeNode typeNode;

    public VariableDeclarationNode(TypeNode _typeNode, String _name, Token token) {
        super(_name, token);
        typeNode = _typeNode;
    }

    public TypeNode getTypeNode() {
        return typeNode;
    }

    @Override
    public <T> T accept(AbstractSyntaxTreeVisitor<? extends T> visitor) {
        return visitor.visitVariableDeclarationNode(this);
    }

}
