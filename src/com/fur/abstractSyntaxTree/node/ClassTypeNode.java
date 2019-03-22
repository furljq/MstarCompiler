package com.fur.abstractSyntaxTree.node;

import com.fur.abstractSyntaxTree.AbstractSyntaxTreeVisitor;
import org.antlr.v4.runtime.Token;

public class ClassTypeNode extends BaseTypeNode {

    private String className;

    public ClassTypeNode(String _className, Token token) {
        super(token);
        className = _className;
    }

    public String getClassName() {
        return className;
    }

    @Override
    public <T> T accept(AbstractSyntaxTreeVisitor<? extends T> visitor) {
        return visitor.visitClassTypeNode(this);
    }

}
