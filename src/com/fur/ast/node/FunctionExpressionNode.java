package com.fur.ast.node;

import com.fur.ast.ASTVisitor;
import org.antlr.v4.runtime.Token;

import java.util.List;

public class FunctionExpressionNode extends BaseExpressionNode {

    private BaseExpressionNode functionNode;
    private List<BaseExpressionNode> arguments;

    public FunctionExpressionNode(BaseExpressionNode _functionNode, List<BaseExpressionNode> _arguments, Token token) {
        super(token);
        functionNode = _functionNode;
        arguments = _arguments;
    }

    public BaseExpressionNode getfunctionNode() {
        return functionNode;
    }

    public List<BaseExpressionNode> getArguments() {
        return arguments;
    }

    @Override
    public <T> T accept(ASTVisitor<? extends T> visitor) {
        return visitor.visitFunctionExpressionNode(this);
    }

}
