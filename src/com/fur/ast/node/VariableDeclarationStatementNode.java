package com.fur.ast.node;

import org.antlr.v4.runtime.Token;

import java.util.List;

public class VariableDeclarationStatementNode extends BaseStatementNode {

    private List<VariableDeclarationNode> variableDeclarationNodes;

    public VariableDeclarationStatementNode(List<VariableDeclarationNode> _variableDeclarationNodes, Token token) {
        super(token);
        variableDeclarationNodes = _variableDeclarationNodes;
    }

    public List<VariableDeclarationNode> getVariableDeclarationNodes() {
        return variableDeclarationNodes;
    }

}
