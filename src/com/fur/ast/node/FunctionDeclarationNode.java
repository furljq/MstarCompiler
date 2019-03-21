package com.fur.ast.node;

import com.fur.ast.ASTVisitor;
import org.antlr.v4.runtime.Token;

import java.util.List;

public class FunctionDeclarationNode extends BaseDeclarationNode {

    private BaseTypeNode typeNode;
    private List<VariableDeclarationNode> parameterNodes;
    private BlockStatementNode blockStatementNodes;

    public FunctionDeclarationNode(BaseTypeNode _typeNode, String _name, List<VariableDeclarationNode> _parameterNodes, BlockStatementNode _blockStatementNodes, Token token) {
        super(_name, token);
        typeNode = _typeNode;
        parameterNodes = _parameterNodes;
        blockStatementNodes = _blockStatementNodes;
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

    public BlockStatementNode getBlockStatementNodes() {
        return blockStatementNodes;
    }

    @Override
    public <T> T accept(ASTVisitor<? extends T> visitor) {
        return visitor.visitFunctionDeclarationNode(this);
    }

}
