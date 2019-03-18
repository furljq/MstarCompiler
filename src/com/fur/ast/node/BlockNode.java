package com.fur.ast.node;

import org.antlr.v4.runtime.Token;

import java.util.List;

public class BlockNode extends BaseNode {

    private List<BaseNode> statementNodes;

    public BlockNode(List<BaseNode> _statementNodes, Token token) {
        super(token);
        statementNodes = _statementNodes;
    }

    public List<BaseNode> getStatementNodes() {
        return statementNodes;
    }

}
