// Generated from D:/Documents/work/CPL/Compiler/src/com/fur\Mstar.g4 by ANTLR 4.7.2
package com.fur.antlr;
import org.antlr.v4.runtime.tree.ParseTreeListener;

/**
 * This interface defines a complete listener for a parse tree produced by
 * {@link MstarParser}.
 */
public interface MstarListener extends ParseTreeListener {
	/**
	 * Enter a parse tree produced by {@link MstarParser#compilationUnit}.
	 * @param ctx the parse tree
	 */
	void enterCompilationUnit(MstarParser.CompilationUnitContext ctx);
	/**
	 * Exit a parse tree produced by {@link MstarParser#compilationUnit}.
	 * @param ctx the parse tree
	 */
	void exitCompilationUnit(MstarParser.CompilationUnitContext ctx);
	/**
	 * Enter a parse tree produced by {@link MstarParser#programDeclaration}.
	 * @param ctx the parse tree
	 */
	void enterProgramDeclaration(MstarParser.ProgramDeclarationContext ctx);
	/**
	 * Exit a parse tree produced by {@link MstarParser#programDeclaration}.
	 * @param ctx the parse tree
	 */
	void exitProgramDeclaration(MstarParser.ProgramDeclarationContext ctx);
	/**
	 * Enter a parse tree produced by {@link MstarParser#classDeclaration}.
	 * @param ctx the parse tree
	 */
	void enterClassDeclaration(MstarParser.ClassDeclarationContext ctx);
	/**
	 * Exit a parse tree produced by {@link MstarParser#classDeclaration}.
	 * @param ctx the parse tree
	 */
	void exitClassDeclaration(MstarParser.ClassDeclarationContext ctx);
	/**
	 * Enter a parse tree produced by {@link MstarParser#classBodyDeclaration}.
	 * @param ctx the parse tree
	 */
	void enterClassBodyDeclaration(MstarParser.ClassBodyDeclarationContext ctx);
	/**
	 * Exit a parse tree produced by {@link MstarParser#classBodyDeclaration}.
	 * @param ctx the parse tree
	 */
	void exitClassBodyDeclaration(MstarParser.ClassBodyDeclarationContext ctx);
	/**
	 * Enter a parse tree produced by {@link MstarParser#functionDeclaration}.
	 * @param ctx the parse tree
	 */
	void enterFunctionDeclaration(MstarParser.FunctionDeclarationContext ctx);
	/**
	 * Exit a parse tree produced by {@link MstarParser#functionDeclaration}.
	 * @param ctx the parse tree
	 */
	void exitFunctionDeclaration(MstarParser.FunctionDeclarationContext ctx);
	/**
	 * Enter a parse tree produced by {@link MstarParser#parameters}.
	 * @param ctx the parse tree
	 */
	void enterParameters(MstarParser.ParametersContext ctx);
	/**
	 * Exit a parse tree produced by {@link MstarParser#parameters}.
	 * @param ctx the parse tree
	 */
	void exitParameters(MstarParser.ParametersContext ctx);
	/**
	 * Enter a parse tree produced by {@link MstarParser#parameter}.
	 * @param ctx the parse tree
	 */
	void enterParameter(MstarParser.ParameterContext ctx);
	/**
	 * Exit a parse tree produced by {@link MstarParser#parameter}.
	 * @param ctx the parse tree
	 */
	void exitParameter(MstarParser.ParameterContext ctx);
	/**
	 * Enter a parse tree produced by {@link MstarParser#variableDeclarationStatement}.
	 * @param ctx the parse tree
	 */
	void enterVariableDeclarationStatement(MstarParser.VariableDeclarationStatementContext ctx);
	/**
	 * Exit a parse tree produced by {@link MstarParser#variableDeclarationStatement}.
	 * @param ctx the parse tree
	 */
	void exitVariableDeclarationStatement(MstarParser.VariableDeclarationStatementContext ctx);
	/**
	 * Enter a parse tree produced by {@link MstarParser#variableDeclarations}.
	 * @param ctx the parse tree
	 */
	void enterVariableDeclarations(MstarParser.VariableDeclarationsContext ctx);
	/**
	 * Exit a parse tree produced by {@link MstarParser#variableDeclarations}.
	 * @param ctx the parse tree
	 */
	void exitVariableDeclarations(MstarParser.VariableDeclarationsContext ctx);
	/**
	 * Enter a parse tree produced by {@link MstarParser#variableDeclaration}.
	 * @param ctx the parse tree
	 */
	void enterVariableDeclaration(MstarParser.VariableDeclarationContext ctx);
	/**
	 * Exit a parse tree produced by {@link MstarParser#variableDeclaration}.
	 * @param ctx the parse tree
	 */
	void exitVariableDeclaration(MstarParser.VariableDeclarationContext ctx);
	/**
	 * Enter a parse tree produced by {@link MstarParser#type}.
	 * @param ctx the parse tree
	 */
	void enterType(MstarParser.TypeContext ctx);
	/**
	 * Exit a parse tree produced by {@link MstarParser#type}.
	 * @param ctx the parse tree
	 */
	void exitType(MstarParser.TypeContext ctx);
	/**
	 * Enter a parse tree produced by {@link MstarParser#nonArrayType}.
	 * @param ctx the parse tree
	 */
	void enterNonArrayType(MstarParser.NonArrayTypeContext ctx);
	/**
	 * Exit a parse tree produced by {@link MstarParser#nonArrayType}.
	 * @param ctx the parse tree
	 */
	void exitNonArrayType(MstarParser.NonArrayTypeContext ctx);
	/**
	 * Enter a parse tree produced by {@link MstarParser#primitiveType}.
	 * @param ctx the parse tree
	 */
	void enterPrimitiveType(MstarParser.PrimitiveTypeContext ctx);
	/**
	 * Exit a parse tree produced by {@link MstarParser#primitiveType}.
	 * @param ctx the parse tree
	 */
	void exitPrimitiveType(MstarParser.PrimitiveTypeContext ctx);
	/**
	 * Enter a parse tree produced by {@link MstarParser#classType}.
	 * @param ctx the parse tree
	 */
	void enterClassType(MstarParser.ClassTypeContext ctx);
	/**
	 * Exit a parse tree produced by {@link MstarParser#classType}.
	 * @param ctx the parse tree
	 */
	void exitClassType(MstarParser.ClassTypeContext ctx);
	/**
	 * Enter a parse tree produced by {@link MstarParser#block}.
	 * @param ctx the parse tree
	 */
	void enterBlock(MstarParser.BlockContext ctx);
	/**
	 * Exit a parse tree produced by {@link MstarParser#block}.
	 * @param ctx the parse tree
	 */
	void exitBlock(MstarParser.BlockContext ctx);
	/**
	 * Enter a parse tree produced by {@link MstarParser#blockStatement}.
	 * @param ctx the parse tree
	 */
	void enterBlockStatement(MstarParser.BlockStatementContext ctx);
	/**
	 * Exit a parse tree produced by {@link MstarParser#blockStatement}.
	 * @param ctx the parse tree
	 */
	void exitBlockStatement(MstarParser.BlockStatementContext ctx);
	/**
	 * Enter a parse tree produced by {@link MstarParser#statement}.
	 * @param ctx the parse tree
	 */
	void enterStatement(MstarParser.StatementContext ctx);
	/**
	 * Exit a parse tree produced by {@link MstarParser#statement}.
	 * @param ctx the parse tree
	 */
	void exitStatement(MstarParser.StatementContext ctx);
	/**
	 * Enter a parse tree produced by {@link MstarParser#creator}.
	 * @param ctx the parse tree
	 */
	void enterCreator(MstarParser.CreatorContext ctx);
	/**
	 * Exit a parse tree produced by {@link MstarParser#creator}.
	 * @param ctx the parse tree
	 */
	void exitCreator(MstarParser.CreatorContext ctx);
	/**
	 * Enter a parse tree produced by {@link MstarParser#arrayCreator}.
	 * @param ctx the parse tree
	 */
	void enterArrayCreator(MstarParser.ArrayCreatorContext ctx);
	/**
	 * Exit a parse tree produced by {@link MstarParser#arrayCreator}.
	 * @param ctx the parse tree
	 */
	void exitArrayCreator(MstarParser.ArrayCreatorContext ctx);
	/**
	 * Enter a parse tree produced by {@link MstarParser#classCreator}.
	 * @param ctx the parse tree
	 */
	void enterClassCreator(MstarParser.ClassCreatorContext ctx);
	/**
	 * Exit a parse tree produced by {@link MstarParser#classCreator}.
	 * @param ctx the parse tree
	 */
	void exitClassCreator(MstarParser.ClassCreatorContext ctx);
	/**
	 * Enter a parse tree produced by {@link MstarParser#expressions}.
	 * @param ctx the parse tree
	 */
	void enterExpressions(MstarParser.ExpressionsContext ctx);
	/**
	 * Exit a parse tree produced by {@link MstarParser#expressions}.
	 * @param ctx the parse tree
	 */
	void exitExpressions(MstarParser.ExpressionsContext ctx);
	/**
	 * Enter a parse tree produced by {@link MstarParser#expression}.
	 * @param ctx the parse tree
	 */
	void enterExpression(MstarParser.ExpressionContext ctx);
	/**
	 * Exit a parse tree produced by {@link MstarParser#expression}.
	 * @param ctx the parse tree
	 */
	void exitExpression(MstarParser.ExpressionContext ctx);
	/**
	 * Enter a parse tree produced by {@link MstarParser#primaryExpression}.
	 * @param ctx the parse tree
	 */
	void enterPrimaryExpression(MstarParser.PrimaryExpressionContext ctx);
	/**
	 * Exit a parse tree produced by {@link MstarParser#primaryExpression}.
	 * @param ctx the parse tree
	 */
	void exitPrimaryExpression(MstarParser.PrimaryExpressionContext ctx);
	/**
	 * Enter a parse tree produced by {@link MstarParser#literalExpression}.
	 * @param ctx the parse tree
	 */
	void enterLiteralExpression(MstarParser.LiteralExpressionContext ctx);
	/**
	 * Exit a parse tree produced by {@link MstarParser#literalExpression}.
	 * @param ctx the parse tree
	 */
	void exitLiteralExpression(MstarParser.LiteralExpressionContext ctx);
	/**
	 * Enter a parse tree produced by {@link MstarParser#empty}.
	 * @param ctx the parse tree
	 */
	void enterEmpty(MstarParser.EmptyContext ctx);
	/**
	 * Exit a parse tree produced by {@link MstarParser#empty}.
	 * @param ctx the parse tree
	 */
	void exitEmpty(MstarParser.EmptyContext ctx);
}