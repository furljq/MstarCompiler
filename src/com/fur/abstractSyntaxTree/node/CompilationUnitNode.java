package com.fur.abstractSyntaxTree.node;

import com.fur.abstractSyntaxTree.AbstractSyntaxTreeVisitor;
import org.antlr.v4.runtime.Token;

import java.util.List;

public class CompilationUnitNode extends BaseNode {

    private List<BaseNode> baseNodes;

    public CompilationUnitNode(List<BaseNode> _baseNodes, Token token) {
        super(token);
        baseNodes = _baseNodes;
    }

    public List<BaseNode> getBaseNodes() {
        return baseNodes;
    }

    @Override
    public <T> T accept(AbstractSyntaxTreeVisitor<? extends T> visitor) {
        return visitor.visitCompilationUnitNode(this);
    }

}
