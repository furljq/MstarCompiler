package com.fur.abstractSyntaxTree.node;

import com.fur.abstractSyntaxTree.AbstractSyntaxTreeVisitor;
import org.antlr.v4.runtime.Token;

import java.util.List;

public class CreatorExpressionNode extends BaseExpressionNode {

    private TypeNode typeNode;
    private List<BaseExpressionNode> fixedDimension;
    private int restDimension;
    private List<BaseExpressionNode> arguments;

    public CreatorExpressionNode(TypeNode _typeNode, List<BaseExpressionNode> _fixedDimension, int _restDimension, List<BaseExpressionNode> _arguments, Token token) {
        super(token);
        typeNode = _typeNode;
        fixedDimension = _fixedDimension;
        restDimension = _restDimension;
        arguments = _arguments;
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

    public List<BaseExpressionNode> getArguments() {
        return arguments;
    }

    @Override
    public <T> T accept(AbstractSyntaxTreeVisitor<? extends T> visitor) {
        return visitor.visitCreatorExpressionNode(this);
    }

}
