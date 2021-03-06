package com.fur.abstractSyntaxTree.node;

import com.fur.Position;
import com.fur.abstractSyntaxTree.AbstractSyntaxTreeVisitor;
import org.antlr.v4.runtime.Token;

import java.util.List;

public class CreatorExpressionNode extends BaseExpressionNode {

    private TypeNode typeNode;
    private List<BaseExpressionNode> fixedDimension;
    private int restDimension;

    public CreatorExpressionNode(TypeNode _typeNode, List<BaseExpressionNode> _fixedDimension, int _restDimension, Token token) {
        super(token);
        typeNode = _typeNode;
        fixedDimension = _fixedDimension;
        restDimension = _restDimension;
    }

    public CreatorExpressionNode(TypeNode _typeNode, List<BaseExpressionNode> _fixedDimension, int _restDimension, Position position) {
        super(position);
        typeNode = _typeNode;
        fixedDimension = _fixedDimension;
        restDimension = _restDimension;
    }

    public TypeNode getTypeNode() {
        return typeNode;
    }

    public List<BaseExpressionNode> getFixedDimension() {
        return fixedDimension;
    }

    public int getRestDimension() {
        return restDimension;
    }

    @Override
    public <T> T accept(AbstractSyntaxTreeVisitor<? extends T> visitor) {
        return visitor.visitCreatorExpressionNode(this);
    }

}
