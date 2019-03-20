package com.fur.ast.node;

import org.antlr.v4.runtime.Token;

import java.util.List;

public class CreatorExpressionNode extends BaseExpressionNode {

    private BaseTypeNode typeNode;
    private List<BaseExpressionNode> fixedDimension;
    private int restDimension;

    public CreatorExpressionNode(BaseTypeNode _typeNode, List<BaseExpressionNode> _fixedDimension, int _restDimension, Token token) {
        super(token);
        typeNode = _typeNode;
        fixedDimension = _fixedDimension;
        restDimension = _restDimension;
    }

    public BaseTypeNode getTypeNode() {
        return typeNode;
    }

    public List<BaseExpressionNode> getFixedDimension() {
        return fixedDimension;
    }

    public int getRestDimension() {
        return restDimension;
    }

}
