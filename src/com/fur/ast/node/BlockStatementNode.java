package com.fur.ast.node;

import com.fur.ast.ASTVisitor;
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

    @Override
    public <T> T accept(ASTVisitor<? extends T> visitor) {
        return visitor.visitBlockStatementNode(this);
    }

}
