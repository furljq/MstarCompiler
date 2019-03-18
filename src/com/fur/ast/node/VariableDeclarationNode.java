package com.fur.ast.node;

import org.antlr.v4.runtime.Token;

public class VariableDeclarationNode extends DeclarationNode {

    private TypeNode typeNode;
    private ExpressionNode expressionNode;

    public VariableDeclarationNode(TypeNode _typeNode, String _name, ExpressionNode _expressionNode, Token token) {
        super(_name, token);
        typeNode = _typeNode;
        expressionNode = _expressionNode;
    }

    public TypeNode getTypeNode() {
        return typeNode;
    }

    public ExpressionNode getExpressionNode() {
        return expressionNode;
    }

}
