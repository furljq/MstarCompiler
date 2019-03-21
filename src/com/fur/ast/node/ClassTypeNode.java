package com.fur.ast.node;

import com.fur.ast.ASTVisitor;
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
    public <T> T accept(ASTVisitor<? extends T> visitor) {
        return visitor.visitClassTypeNode(this);
    }

}
