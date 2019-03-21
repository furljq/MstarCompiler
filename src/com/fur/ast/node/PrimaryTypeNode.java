package com.fur.ast.node;


import com.fur.ast.ASTVisitor;
import com.fur.ast.enumerate.PrimaryTypeList;
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
    public <T> T accept(ASTVisitor<? extends T> visitor) {
        return visitor.visitPrimaryTypeNode(this);
    }

}
