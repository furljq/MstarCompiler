package com.fur.ast.node;

import org.antlr.v4.runtime.Token;

import java.util.List;

public class CompilationUnitNode extends BaseNode {

    private List<DeclarationNode> declarationNodes;

    public CompilationUnitNode(List<DeclarationNode> _declarationNodes, Token token) {
        super(token);
        declarationNodes = _declarationNodes;
    }

    public List<DeclarationNode> getDeclarationNodes() {
        return declarationNodes;
    }

}
