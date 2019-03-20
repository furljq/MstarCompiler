package com.fur.ast.node;

import org.antlr.v4.runtime.Token;

import java.util.List;

public class FunctionDeclarationNode extends DeclarationNode {

    private BaseTypeNode typeNode;
    private List<VariableDeclarationNode> parameterNodes;
    private BlockNode blockNodes;

    public FunctionDeclarationNode(BaseTypeNode _typeNode, String _name, List<VariableDeclarationNode> _parameterNodes, BlockNode _blockNodes, Token token) {
        super(_name, token);
        typeNode = _typeNode;
        parameterNodes = _parameterNodes;
        blockNodes = _blockNodes;
    }

    public boolean isConstructor() {
        return typeNode == null;
    }

    public BaseTypeNode getTypeNode() {
        return typeNode;
    }

    public List<VariableDeclarationNode> getParameterNodes() {
        return parameterNodes;
    }

    public BlockNode getBlockNodes() {
        return blockNodes;
    }

}
