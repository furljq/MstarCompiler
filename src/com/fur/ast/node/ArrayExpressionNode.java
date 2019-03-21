package com.fur.ast.node;

import com.fur.ast.ASTVisitor;
import org.antlr.v4.runtime.Token;

public class ArrayExpressionNode extends BaseExpressionNode {

    private BaseExpressionNode address;
    private BaseExpressionNode index;

    public ArrayExpressionNode(BaseExpressionNode _address, BaseExpressionNode _index, Token token) {
        super(token);
        address = _address;
        index = _index;
    }

    public BaseExpressionNode getAddress() {
        return address;
    }

    public BaseExpressionNode getIndex() {
        return index;
    }

    @Override
    public <T> T accept(ASTVisitor<? extends T> visitor) {
        return visitor.visitArrayExpressionNode(this);
    }

}
