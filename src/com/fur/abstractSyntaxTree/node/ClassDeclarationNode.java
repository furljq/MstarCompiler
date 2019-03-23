package com.fur.abstractSyntaxTree.node;

import com.fur.abstractSyntaxTree.AbstractSyntaxTreeVisitor;
import org.antlr.v4.runtime.Token;

import java.util.List;

public class ClassDeclarationNode extends BaseDeclarationNode {

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

    @Override
    public <T> T accept(AbstractSyntaxTreeVisitor<? extends T> visitor) {
        return visitor.visitClassDeclarationNode(this);
    }

}
