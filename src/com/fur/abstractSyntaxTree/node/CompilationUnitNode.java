package com.fur.abstractSyntaxTree.node;

import com.fur.abstractSyntaxTree.AbstractSyntaxTreeVisitor;
import org.antlr.v4.runtime.Token;

import java.util.List;

public class CompilationUnitNode extends BaseNode {

    private List<BaseDeclarationNode> declarationNodes;

    public CompilationUnitNode(List<BaseDeclarationNode> _declarationNodes, Token token) {
        super(token);
        declarationNodes = _declarationNodes;
    }

    public List<BaseDeclarationNode> getDeclarationNodes() {
        return declarationNodes;
    }

    @Override
    public <T> T accept(AbstractSyntaxTreeVisitor<? extends T> visitor) {
        return visitor.visitCompilationUnitNode(this);
    }

}
