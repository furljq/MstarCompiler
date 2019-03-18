package com.fur.ast;

import com.fur.antlr.MstarBaseVisitor;
import com.fur.antlr.MstarParser;
import com.fur.ast.node.*;

import java.util.ArrayList;
import java.util.List;

public class ASTBuilderVisitor extends MstarBaseVisitor<BaseNode> {

    @Override
    public CompilationUnitNode visitCompilationUnit(MstarParser.CompilationUnitContext context) {
        List<DeclarationNode> declarationNodes = new ArrayList<>();
        for (MstarParser.ProgramDeclarationContext programDeclarationContext : context.programDeclaration()) {
            DeclarationNode declarationNode = (DeclarationNode) visit(programDeclarationContext);
            declarationNodes.add(declarationNode);
        }
        return new CompilationUnitNode(declarationNodes, context.getStart());
    }

    @Override
    public DeclarationNode visitProgramDeclaration(MstarParser.ProgramDeclarationContext context) {
        if (context.classDeclaration() != null) return (DeclarationNode) visit(context.classDeclaration());
        if (context.functionDeclaration() != null) return (FunctionDeclarationNode) visit(context.functionDeclaration());
        if (context.variableDeclarationStatement() != null) return (VariableDeclarationNode) visit(context.variableDeclarationStatement());
        return null;
    }

    @Override
    public BaseNode visitClassDeclaration(MstarParser.ClassDeclarationContext context) {
        String className = context.Identifier().getText();
        List<VariableDeclarationNode> variableDeclarationNodes = new ArrayList<>();
        List<FunctionDeclarationNode> functionDeclarationNodes = new ArrayList<>();
        for (MstarParser.ClassBodyDeclarationContext classBodyDeclarationContext : context.classBodyDeclaration()) {
            DeclarationNode declarationNode = (DeclarationNode) visit(classBodyDeclarationContext);
            if (declarationNode instanceof VariableDeclarationNode) variableDeclarationNodes.add((VariableDeclarationNode) declarationNode);
            if (declarationNode instanceof FunctionDeclarationNode) functionDeclarationNodes.add((FunctionDeclarationNode) declarationNode);
        }
        return new ClassDeclarationNode(className, variableDeclarationNodes, functionDeclarationNodes, context.start);
    }

    @Override
    public FunctionDeclarationNode visitFunctionDeclaration(MstarParser.FunctionDeclarationContext context) {
        TypeNode typeNode = (TypeNode) visit(context.type());
        String name = context.Identifier().getText();
        ParametersNode parametersNode = (ParametersNode) visit(context.parameters());
        BlockNode blockNode = (BlockNode) visit(context.block());
        return new FunctionDeclarationNode(typeNode, name, parametersNode, blockNode, context.getStart());
    }

}
