package com.fur;

import com.fur.SymbolTable.Entity.ClassEntity;
import com.fur.SymbolTable.SymbolTableBuilder;
import com.fur.antlrParseTree.MstarLexer;
import com.fur.antlrParseTree.MstarParser;
import com.fur.abstractSyntaxTree.AbstractSyntaxTreeBuilder;
import com.fur.abstractSyntaxTree.node.CompilationUnitNode;
import org.antlr.v4.runtime.CharStream;
import org.antlr.v4.runtime.CharStreams;
import org.antlr.v4.runtime.CommonTokenStream;

import java.io.IOException;

class Compiler {

    private CharStream mstarFileCharStream;

    Compiler(String _mstarFile) throws IOException {
        mstarFileCharStream = CharStreams.fromFileName(_mstarFile);
    }

    private CompilationUnitNode buildAbstractSyntaxTree(CharStream mstarFileCharStream) {
        MstarLexer lexer = new MstarLexer(mstarFileCharStream);
        CommonTokenStream commonTokenStream = new CommonTokenStream(lexer);
        MstarParser parser = new MstarParser(commonTokenStream);
        MstarParser.CompilationUnitContext parseTree = parser.compilationUnit();
        AbstractSyntaxTreeBuilder astBuilderVisitor = new AbstractSyntaxTreeBuilder();
        return  (CompilationUnitNode) astBuilderVisitor.visit(parseTree);
    }

    private ClassEntity buildSymbolTable(CompilationUnitNode abstractSyntaxTree) {
        SymbolTableBuilder symbolTableBuilder = new SymbolTableBuilder();
        return (ClassEntity) symbolTableBuilder.visit(abstractSyntaxTree);
    }

    private void syntaxChecker(CompilationUnitNode abstractSyntaxTree, ClassEntity globalEntity) {
    }

    void compile() {
        CompilationUnitNode abstractSyntaxTree = buildAbstractSyntaxTree(mstarFileCharStream);
        ClassEntity globalEntity = buildSymbolTable(abstractSyntaxTree);
        syntaxChecker(abstractSyntaxTree, globalEntity);
    }

}
