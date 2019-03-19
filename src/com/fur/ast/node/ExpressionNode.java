package com.fur.ast.node;

import com.fur.ast.enumerate.OperatorList;
import com.fur.ast.enumerate.TypeList;
import org.antlr.v4.runtime.Token;

import java.util.List;

public class ExpressionNode extends PrimaryExpressionNode {

    private List<ExpressionNode> expressionNodes;
    private OperatorList operator;

    public ExpressionNode(TypeList _type, List<ExpressionNode> _expressionNodes, OperatorList _operator, Token token) {
        super(_type, token);
        expressionNodes = _expressionNodes;
        operator = _operator;
    }

    public List<ExpressionNode> getExpressionNodes() {
        return expressionNodes;
    }

    public OperatorList getOperator() {
        return operator;
    }

}
