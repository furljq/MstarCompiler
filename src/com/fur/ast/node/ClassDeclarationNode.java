package com.fur.ast.node;

import org.antlr.v4.runtime.Token;

import java.util.List;

public class ClassDeclarationNode extends BaseDeclarationNode {

    private List<VariableDeclarationStatementNode> variableDeclarationStatementNodes;
    private List<FunctionDeclarationNode> functionDeclarationNodes;

    public ClassDeclarationNode(String _name, List<VariableDeclarationStatementNode> _variableDeclarationStatementNodes, List<FunctionDeclarationNode> _functionDeclarationNodes, Token token) {
        super(_name, token);
        variableDeclarationStatementNodes = _variableDeclarationStatementNodes;
        functionDeclarationNodes = _functionDeclarationNodes;
    }

    public List<VariableDeclarationStatementNode> getVariableDeclarationStatementNodes() {
        return variableDeclarationStatementNodes;
    }

    public List<FunctionDeclarationNode> getFunctionDeclarationNodes() {
        return functionDeclarationNodes;
    }

}
