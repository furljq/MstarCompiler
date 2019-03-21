package com.fur.ast.node;

import com.fur.ast.ASTVisitor;
import org.antlr.v4.runtime.Token;

import java.util.List;

public class CompilationUnitNode extends BaseNode {

    private List<ClassDeclarationNode> classDeclarationNodes;
    private List<FunctionDeclarationNode> functionDeclarationNodes;
    private List<VariableDeclarationNode> variableDeclarationNodes;

    public CompilationUnitNode(List<ClassDeclarationNode> _classDeclarationNodes, List<FunctionDeclarationNode> _functionDeclarationNodes, List<VariableDeclarationNode> _variableDeclarationNodes, Token token) {
        super(token);
        classDeclarationNodes = _classDeclarationNodes;
        functionDeclarationNodes = _functionDeclarationNodes;
        variableDeclarationNodes = _variableDeclarationNodes;
    }

    public List<ClassDeclarationNode> getClassDeclarationNodes() {
        return classDeclarationNodes;
    }

    public List<VariableDeclarationNode> getVariableDeclarationNodes() {
        return variableDeclarationNodes;
    }

    public List<FunctionDeclarationNode> getFunctionDeclarationNodes() {
        return functionDeclarationNodes;
    }

    @Override
    public <T> T accept(ASTVisitor<? extends T> visitor) {
        return visitor.visitCompilationUnitNode(this);
    }

}
