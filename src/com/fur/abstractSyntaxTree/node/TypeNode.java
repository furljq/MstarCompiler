package com.fur.abstractSyntaxTree.node;

import com.fur.abstractSyntaxTree.AbstractSyntaxTreeVisitor;
import com.fur.type.BaseType;
import org.antlr.v4.runtime.Token;

public class TypeNode extends BaseNode {

    private BaseType type;

    public TypeNode(BaseType _type, Token token) {
        super(token);
        type = _type;
    }

    public BaseType getType() {
        return type;
    }

    @Override
    public <T> T accept(AbstractSyntaxTreeVisitor<? extends T> visitor) {
        return visitor.visitTypeNode(this);
    }

}
