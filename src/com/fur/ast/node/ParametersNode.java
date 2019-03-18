package com.fur.ast.node;

import com.fur.antlr.MstarParser;
import org.antlr.v4.runtime.Token;

import java.util.List;

public class ParametersNode extends BaseNode {

    private List<VariableDeclarationNode> parameterNodes;

    public ParametersNode(List<VariableDeclarationNode> _parameterNodes, Token token) {
        super(token);
        parameterNodes = _parameterNodes;
    }

    public List<VariableDeclarationNode> getParameterNodes() {
        return parameterNodes;
    }

}
