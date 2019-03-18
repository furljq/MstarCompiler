package com.fur.ast.node;

import org.antlr.v4.runtime.Token;

import java.util.List;

public class ClassDeclarationNode extends DeclarationNode {

    private List<VariableDeclarationNode> variableDeclarationNodes;
    private List<FunctionDeclarationNode> functionDeclarationNodes;

    public ClassDeclarationNode(String _name, List<VariableDeclarationNode> _variableDeclarationNodes, List<FunctionDeclarationNode> _functionDeclarationNodes, Token token) {
        super(_name, token);
        variableDeclarationNodes = _variableDeclarationNodes;
        functionDeclarationNodes = _functionDeclarationNodes;
    }

    public List<VariableDeclarationNode> getVariableDeclarationNodes() {
        return variableDeclarationNodes;
    }

    public List<FunctionDeclarationNode> getFunctionDeclarationNodes() {
        return functionDeclarationNodes;
    }

}
