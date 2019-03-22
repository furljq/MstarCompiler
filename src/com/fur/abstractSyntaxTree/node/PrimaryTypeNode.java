package com.fur.abstractSyntaxTree.node;


import com.fur.abstractSyntaxTree.AbstractSyntaxTreeVisitor;
import com.fur.enumerate.PrimaryTypeList;
import org.antlr.v4.runtime.Token;

public class PrimaryTypeNode extends BaseTypeNode {

    private PrimaryTypeList type;

    public PrimaryTypeNode(PrimaryTypeList _type, Token token) {
        super(token);
        type = _type;
    }

    public PrimaryTypeList getType() {
        return type;
    }

    @Override
    public <T> T accept(AbstractSyntaxTreeVisitor<? extends T> visitor) {
        return visitor.visitPrimaryTypeNode(this);
    }

}
