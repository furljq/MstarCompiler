package com.fur.ast.node;

import org.antlr.v4.runtime.Token;

import java.util.List;

public class FunctionDeclarationNode extends DeclarationNode {

    private TypeNode typeNode;
    private List<VariableDeclarationNode> parameterNodes;
    private BlockNode blockNodes;

    public FunctionDeclarationNode(TypeNode _typeNode, String _name, List<VariableDeclarationNode> _parameterNodes, BlockNode _blockNodes, Token token) {
        super(_name, token);
        typeNode = _typeNode;
        parameterNodes = _parameterNodes;
        blockNodes = _blockNodes;
    }

    public boolean isConstructor() {
        return typeNode == null;
    }

    public TypeNode getTypeNode() {
        return typeNode;
    }

    public List<VariableDeclarationNode> getParameterNodes() {
        return parameterNodes;
    }

    public BlockNode getBlockNodes() {
        return blockNodes;
    }

}
