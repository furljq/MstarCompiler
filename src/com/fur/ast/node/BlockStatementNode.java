package com.fur.ast.node;

import org.antlr.v4.runtime.Token;

import java.util.List;

public class BlockStatementNode extends BaseStatementNode {

    private List<BaseStatementNode> statementNodes;

    public BlockStatementNode(List<BaseStatementNode> _statementNodes, Token token) {
        super(token);
        statementNodes = _statementNodes;
    }

    public List<BaseStatementNode> getStatementNodes() {
        return statementNodes;
    }

}
