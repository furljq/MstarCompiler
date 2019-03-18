package com.fur;

import com.fur.ast.ASTBuilderVisitor;
import com.fur.antlr.MstarLexer;
import com.fur.antlr.MstarParser;
import org.antlr.v4.runtime.CharStream;
import org.antlr.v4.runtime.CharStreams;
import org.antlr.v4.runtime.CommonTokenStream;
import org.antlr.v4.runtime.tree.ParseTree;

import java.io.IOException;

public class Compiler {

    private String mstarFile;

    private void buildAST() throws IOException {
        CharStream mstarFileCharStream = CharStreams.fromFileName(mstarFile);
        MstarLexer lexer = new MstarLexer(mstarFileCharStream);
        CommonTokenStream commonTokenStream = new CommonTokenStream(lexer);
        MstarParser parser = new MstarParser(commonTokenStream);
        ASTBuilderVisitor astBuilderVisitor = new ASTBuilderVisitor();
        ParseTree parseTree = parser.complicationUnit();
        System.out.println(parseTree.toStringTree(parser));
    }

    public Compiler(String _mstarFile) {
        mstarFile = _mstarFile;
    }

    public void compile() throws IOException {
        buildAST();
    }

}
