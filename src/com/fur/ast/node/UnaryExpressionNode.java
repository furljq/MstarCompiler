package com.fur.ast.node;

import com.fur.ast.ASTVisitor;
import com.fur.ast.enumerate.OperatorList;
import org.antlr.v4.runtime.Token;

public class UnaryExpressionNode extends BaseExpressionNode {

    OperatorList operator;
    BaseExpressionNode expressionNode;

    public UnaryExpressionNode(OperatorList _operator, BaseExpressionNode _expressionNode, Token token) {
        super(token);
        operator = _operator;
        expressionNode = _expressionNode;
    }

    public OperatorList getOperator() {
        return operator;
    }

    public BaseExpressionNode getExpressionNode() {
        return expressionNode;
    }

    @Override
    public <T> T accept(ASTVisitor<? extends T> visitor) {
        return visitor.visitUnaryExpressionNode(this);
    }

}
