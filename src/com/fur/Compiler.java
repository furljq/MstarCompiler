package com.fur;

import com.fur.intermediateRepresentation.IntermediateRepresentationBuilder;
import com.fur.intermediateRepresentation.node.BaseIRNode;
import com.fur.intermediateRepresentation.node.FunctionIRNode;
import com.fur.nasm.NASMBuilder;
import com.fur.nasm.register.NASMRegisters;
import com.fur.optimize.Optimizer;
import com.fur.symbolTable.Entity.ClassEntity;
import com.fur.symbolTable.SymbolTableBuilder;
import com.fur.antlrParseTree.MstarLexer;
import com.fur.antlrParseTree.MstarParser;
import com.fur.abstractSyntaxTree.AbstractSyntaxTreeBuilder;
import com.fur.abstractSyntaxTree.node.CompilationUnitNode;
import com.fur.syntax.ParseTreeErrorListener;
import com.fur.syntax.SyntaxChecker;
import org.antlr.v4.runtime.CharStream;
import org.antlr.v4.runtime.CharStreams;
import org.antlr.v4.runtime.CommonTokenStream;

import java.io.*;
import java.util.List;

class Compiler {

    private CharStream mstarFileCharStream;
    private PrintStream nasmOutputStream;
    private NASMRegisters registers = new NASMRegisters();

    Compiler(String _mstarFile, String nasmFile) throws IOException {
        mstarFileCharStream = CharStreams.fromFileName(_mstarFile);
        nasmOutputStream = new PrintStream(nasmFile);
    }

    Compiler() throws IOException {
        mstarFileCharStream = CharStreams.fromStream(System.in);
        nasmOutputStream = System.out;
    }

    private CompilationUnitNode buildAbstractSyntaxTree(CharStream mstarFileCharStream) {
        MstarLexer lexer = new MstarLexer(mstarFileCharStream);
        CommonTokenStream commonTokenStream = new CommonTokenStream(lexer);
        MstarParser parser = new MstarParser(commonTokenStream);
        parser.removeErrorListeners();
        parser.addErrorListener(new ParseTreeErrorListener());
        MstarParser.CompilationUnitContext parseTree = parser.compilationUnit();
        AbstractSyntaxTreeBuilder astBuilderVisitor = new AbstractSyntaxTreeBuilder();
        return  (CompilationUnitNode) astBuilderVisitor.visit(parseTree);
    }

    private ClassEntity buildSymbolTable(CompilationUnitNode abstractSyntaxTree) {
        SymbolTableBuilder symbolTableBuilder = new SymbolTableBuilder();
        return (ClassEntity) symbolTableBuilder.visit(abstractSyntaxTree);
    }

    private void syntaxCheck(CompilationUnitNode abstractSyntaxTree, ClassEntity globalEntity) {
        SyntaxChecker syntaxChecker = new SyntaxChecker(globalEntity);
        syntaxChecker.visit(abstractSyntaxTree);
    }

    private FunctionIRNode buildIR(CompilationUnitNode abstractSyntaxTree, ClassEntity globalEntity) {
        IntermediateRepresentationBuilder intermediateRepresentationBuilder = new IntermediateRepresentationBuilder(globalEntity);
        return intermediateRepresentationBuilder.visit(abstractSyntaxTree);
    }

    private List<BaseIRNode> optimize(List<BaseIRNode> instructions) {
        Optimizer optimizer = new Optimizer(registers);
        return optimizer.optimize(instructions);
    }

    private List<String> buildNASM(List<BaseIRNode> instructions, NASMRegisters registers) throws IOException {
        NASMBuilder nasmBuilder = new NASMBuilder(instructions, registers);
        return nasmBuilder.build();
    }

    private void print(List<String> code) {
        for (String line : code) {
            if (line.length() == 0) continue;
            if (line.charAt(line.length() - 1) != ':') nasmOutputStream.print('\t');
            nasmOutputStream.println(line);
        }
        nasmOutputStream.flush();
        nasmOutputStream.close();
    }

    void compile() throws IOException {
        CompilationUnitNode abstractSyntaxTree = buildAbstractSyntaxTree(mstarFileCharStream);
        ClassEntity globalEntity = buildSymbolTable(abstractSyntaxTree);
        syntaxCheck(abstractSyntaxTree, globalEntity);
        List<BaseIRNode> irNodes = buildIR(abstractSyntaxTree, globalEntity).getBodyNode();
        irNodes = optimize(irNodes);
        List<String> code = buildNASM(irNodes, registers);
        print(code);
    }

}
