package com.fur.ast.node;

import org.antlr.v4.runtime.Token;

public class FunctionDeclarationNode extends DeclarationNode {

    private TypeNode typeNode;
    private ParametersNode parametersNode;
    private BlockNode blockNodes;

    public FunctionDeclarationNode(TypeNode _typeNode, String _name, ParametersNode _parametersNode, BlockNode _blockNodes, Token token) {
        super(_name, token);
        typeNode = _typeNode;
        parametersNode = _parametersNode;
        blockNodes = _blockNodes;
    }

    public boolean isConstructor() {
        return typeNode == null;
    }

    public TypeNode getTypeNode() {
        return typeNode;
    }

    public ParametersNode getParametersNode() {
        return parametersNode;
    }

    public BlockNode getBlockNodes() {
        return blockNodes;
    }

}
