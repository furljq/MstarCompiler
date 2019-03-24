package com.fur.abstractSyntaxTree.node;

import com.fur.abstractSyntaxTree.AbstractSyntaxTreeVisitor;
import org.antlr.v4.runtime.Token;

import java.util.List;

public class BlockStatementNode extends BaseStatementNode {

    private List<BaseNode> statementNodes;

    public BlockStatementNode(List<BaseNode> _statementNodes, Token token) {
        super(token);
        statementNodes = _statementNodes;
    }

    public List<BaseNode> getStatementNodes() {
        return statementNodes;
    }

    @Override
    public <T> T accept(AbstractSyntaxTreeVisitor<? extends T> visitor) {
        return visitor.visitBlockStatementNode(this);
    }

}
