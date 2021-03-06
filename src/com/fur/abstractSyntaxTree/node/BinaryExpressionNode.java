package com.fur.abstractSyntaxTree.node;

import com.fur.Position;
import com.fur.abstractSyntaxTree.AbstractSyntaxTreeVisitor;
import com.fur.enumerate.OperatorList;
import org.antlr.v4.runtime.Token;

public class BinaryExpressionNode extends BaseExpressionNode {

    private OperatorList operator;
    private BaseExpressionNode leftExpressionNode, rightExressionNode;

    public BinaryExpressionNode(OperatorList _operator, BaseExpressionNode _leftExpressionNode, BaseExpressionNode _rightExressionNode, Token token) {
        super(token);
        operator = _operator;
        leftExpressionNode = _leftExpressionNode;
        rightExressionNode = _rightExressionNode;
    }

    public BinaryExpressionNode(OperatorList _operator, BaseExpressionNode _leftExpressionNode, BaseExpressionNode _rightExpressionNode, Position _position) {
        super(_position);
        operator = _operator;
        leftExpressionNode = _leftExpressionNode;
        rightExressionNode = _rightExpressionNode;
    }

    public OperatorList getOperator() {
        return operator;
    }

    public BaseExpressionNode getLeftExpressionNode() {
        return leftExpressionNode;
    }

    public BaseExpressionNode getRightExressionNode() {
        return rightExressionNode;
    }

    @Override
    public <T> T accept(AbstractSyntaxTreeVisitor<? extends T> visitor) {
        return visitor.visitBinaryExpressionNode(this);
    }

}
