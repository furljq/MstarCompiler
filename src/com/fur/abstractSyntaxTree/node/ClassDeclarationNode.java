package com.fur.abstractSyntaxTree.node;

import com.fur.abstractSyntaxTree.AbstractSyntaxTreeVisitor;
import org.antlr.v4.runtime.Token;

import java.util.List;

public class ClassDeclarationNode extends BaseDeclarationNode {

    private List<BaseNode> variableNodes;
    private List<FunctionDeclarationNode> functionDeclarationNodes;

    public ClassDeclarationNode(String _name, List<BaseNode> _baseNodes, List<FunctionDeclarationNode> _functionDeclarationNodes, Token token) {
        super(_name, token);
        variableNodes = _baseNodes;
        functionDeclarationNodes = _functionDeclarationNodes;
    }

    public List<BaseNode> getVariableNodes() {
        return variableNodes;
    }

    public List<FunctionDeclarationNode> getFunctionDeclarationNodes() {
        return functionDeclarationNodes;
    }

    @Override
    public <T> T accept(AbstractSyntaxTreeVisitor<? extends T> visitor) {
        return visitor.visitClassDeclarationNode(this);
    }

}
