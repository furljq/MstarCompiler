package com.fur;

import com.fur.antlr.MstarLexer;
import com.fur.antlr.MstarParser;
import com.fur.ast.ASTBuilderVisitor;
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
        ASTBuilderVisitor astBuilderVisitor = new ASTBuilderVisitor();
        MstarParser.CompilationUnitContext parseTree = parser.compilationUnit();
        CompilationUnitNode ASTNode = astBuilderVisitor.visitCompilationUnit(parseTree);
    }

    Compiler(String _mstarFile) {
        mstarFile = _mstarFile;
    }

    void compile() throws IOException {
        buildAST();
    }

}
