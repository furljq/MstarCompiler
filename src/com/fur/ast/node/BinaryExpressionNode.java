package com.fur.ast.node;

import com.fur.ast.ASTVisitor;
import com.fur.ast.enumerate.OperatorList;
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
    public <T> T accept(ASTVisitor<? extends T> visitor) {
        return visitor.visitBinaryExpressionNode(this);
    }

}
