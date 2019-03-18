// Generated from D:/Documents/work/CPL/Compiler/src/com/fur/antlr\Mstar.g4 by ANTLR 4.7.2
package com.fur.antlr;
import org.antlr.v4.runtime.tree.ParseTreeVisitor;

/**
 * This interface defines a complete generic visitor for a parse tree produced
 * by {@link MstarParser}.
 *
 * @param <T> The return type of the visit operation. Use {@link Void} for
 * operations with no return type.
 */
public interface MstarVisitor<T> extends ParseTreeVisitor<T> {
	/**
	 * Visit a parse tree produced by {@link MstarParser#complicationUnit}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitComplicationUnit(MstarParser.ComplicationUnitContext ctx);
	/**
	 * Visit a parse tree produced by {@link MstarParser#programDeclaration}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitProgramDeclaration(MstarParser.ProgramDeclarationContext ctx);
	/**
	 * Visit a parse tree produced by {@link MstarParser#classDeclaration}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitClassDeclaration(MstarParser.ClassDeclarationContext ctx);
	/**
	 * Visit a parse tree produced by {@link MstarParser#classBodyDeclaration}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitClassBodyDeclaration(MstarParser.ClassBodyDeclarationContext ctx);
	/**
	 * Visit a parse tree produced by {@link MstarParser#functionDeclaration}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitFunctionDeclaration(MstarParser.FunctionDeclarationContext ctx);
	/**
	 * Visit a parse tree produced by {@link MstarParser#parameters}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitParameters(MstarParser.ParametersContext ctx);
	/**
	 * Visit a parse tree produced by {@link MstarParser#parameter}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitParameter(MstarParser.ParameterContext ctx);
	/**
	 * Visit a parse tree produced by {@link MstarParser#variableDeclarationStatement}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitVariableDeclarationStatement(MstarParser.VariableDeclarationStatementContext ctx);
	/**
	 * Visit a parse tree produced by {@link MstarParser#variableDeclarations}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitVariableDeclarations(MstarParser.VariableDeclarationsContext ctx);
	/**
	 * Visit a parse tree produced by {@link MstarParser#variableDeclaration}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitVariableDeclaration(MstarParser.VariableDeclarationContext ctx);
	/**
	 * Visit a parse tree produced by {@link MstarParser#type}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitType(MstarParser.TypeContext ctx);
	/**
	 * Visit a parse tree produced by {@link MstarParser#primitiveType}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitPrimitiveType(MstarParser.PrimitiveTypeContext ctx);
	/**
	 * Visit a parse tree produced by {@link MstarParser#classType}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitClassType(MstarParser.ClassTypeContext ctx);
	/**
	 * Visit a parse tree produced by {@link MstarParser#block}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitBlock(MstarParser.BlockContext ctx);
	/**
	 * Visit a parse tree produced by {@link MstarParser#blockStatement}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitBlockStatement(MstarParser.BlockStatementContext ctx);
	/**
	 * Visit a parse tree produced by {@link MstarParser#statement}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitStatement(MstarParser.StatementContext ctx);
	/**
	 * Visit a parse tree produced by {@link MstarParser#expressions}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitExpressions(MstarParser.ExpressionsContext ctx);
	/**
	 * Visit a parse tree produced by {@link MstarParser#expression}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitExpression(MstarParser.ExpressionContext ctx);
	/**
	 * Visit a parse tree produced by {@link MstarParser#primaryExpression}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitPrimaryExpression(MstarParser.PrimaryExpressionContext ctx);
	/**
	 * Visit a parse tree produced by {@link MstarParser#literalExpression}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitLiteralExpression(MstarParser.LiteralExpressionContext ctx);
}