package com.fur;

import com.fur.antlr.MstarLexer;
import com.fur.antlr.MstarParser;
import com.fur.ast.ASTBuilder;
import com.fur.ast.node.CompilationUnitNode;
import org.antlr.v4.runtime.CharStream;
import org.antlr.v4.runtime.CharStreams;
import org.antlr.v4.runtime.CommonTokenStream;

import java.io.IOException;

class Compiler {

    private String mstarFile;

    private void buildAST() throws IOException {
        CharStream mstarFileCharStream = CharStreams.fromFileName(mstarFile);
        MstarLexer lexer = new MstarLexer(mstarFileCharStream);
        CommonTokenStream commonTokenStream = new CommonTokenStream(lexer);
        MstarParser parser = new MstarParser(commonTokenStream);
        MstarParser.CompilationUnitContext parseTree = parser.compilationUnit();
        ASTBuilder astBuilderVisitor = new ASTBuilder();
        CompilationUnitNode AST = (CompilationUnitNode) astBuilderVisitor.visit(parseTree);
    }

    Compiler(String _mstarFile) {
        mstarFile = _mstarFile;
    }

    void compile() throws IOException {
        buildAST();
    }

}
