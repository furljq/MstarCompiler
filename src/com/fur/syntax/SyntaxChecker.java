package com.fur.syntax;

import com.fur.abstractSyntaxTree.node.*;
import com.fur.enumerate.OperatorList;
import com.fur.symbolTable.Entity.BaseEntity;
import com.fur.symbolTable.Entity.ClassEntity;
import com.fur.abstractSyntaxTree.AbstractSyntaxTreeBaseVisitor;

public class SyntaxChecker extends AbstractSyntaxTreeBaseVisitor<Boolean> {

    private ClassEntity globalEntity;
    private BaseEntity currentEntity = globalEntity;

    public SyntaxChecker(ClassEntity _globalEntity) {
        globalEntity = _globalEntity;
    }

    @Override
    public Boolean visitCompilationUnitNode(CompilationUnitNode node) {
        for (BaseNode baseNode : node.getBaseNodes())
            if (!visit(baseNode)) return false;//TODO
        return true;
    }

    @Override
    public Boolean visitClassDeclarationNode(ClassDeclarationNode node) {
        currentEntity = globalEntity.getClassEntity(node.getName());
        for (BaseNode variableNode : node.getVariableNodes())
            if (variableNode instanceof ExpressionStatementNode)
                if (!visit(variableNode)) return false;//TODO
        for (FunctionDeclarationNode functionDeclarationNode : node.getFunctionDeclarationNodes())
            if (!visit(functionDeclarationNode)) return false;//TODO
        currentEntity = globalEntity;
        return true;
    }

}
