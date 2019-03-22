package com.fur.SymbolTable;

import com.fur.SymbolTable.Entity.BaseEntity;
import com.fur.SymbolTable.Entity.ClassEntity;
import com.fur.abstractSyntaxTree.AbstractSyntaxTreeBaseVisitor;
import com.fur.abstractSyntaxTree.node.BaseDeclarationNode;
import com.fur.abstractSyntaxTree.node.ClassDeclarationNode;
import com.fur.abstractSyntaxTree.node.CompilationUnitNode;
import com.fur.abstractSyntaxTree.node.FunctionDeclarationNode;

import java.util.HashMap;
import java.util.Map;

public class SymbolTableBuilder extends AbstractSyntaxTreeBaseVisitor<BaseEntity> {

    @Override
    public BaseEntity visitCompilationUnitNode(CompilationUnitNode node) {
        Map<String, BaseEntity> scope = new HashMap<>();
        for (BaseDeclarationNode declarationNode : node.getDeclarationNodes())
            if (declarationNode instanceof ClassDeclarationNode) {
                String name = declarationNode.getName();
                ClassEntity entity = new ClassEntity();
                scope.put(name, entity);
            }
        for (BaseDeclarationNode declarationNode : node.getDeclarationNodes())
            if (declarationNode instanceof FunctionDeclarationNode) {
                String name = declarationNode.getName();
            }
        return (ClassEntity)null;
    }
}
