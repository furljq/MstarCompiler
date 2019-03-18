// Generated from D:/Documents/work/CPL/Compiler/src/com/fur/antlr\Mstar.g4 by ANTLR 4.7.2
package com.fur.antlr;
import org.antlr.v4.runtime.atn.*;
import org.antlr.v4.runtime.dfa.DFA;
import org.antlr.v4.runtime.*;
import org.antlr.v4.runtime.misc.*;
import org.antlr.v4.runtime.tree.*;
import java.util.List;
import java.util.Iterator;
import java.util.ArrayList;

@SuppressWarnings({"all", "warnings", "unchecked", "unused", "cast"})
public class MstarParser extends Parser {
	static { RuntimeMetaData.checkVersion("4.7.2", RuntimeMetaData.VERSION); }

	protected static final DFA[] _decisionToDFA;
	protected static final PredictionContextCache _sharedContextCache =
		new PredictionContextCache();
	public static final int
		T__0=1, T__1=2, T__2=3, T__3=4, T__4=5, T__5=6, T__6=7, T__7=8, T__8=9, 
		T__9=10, T__10=11, T__11=12, T__12=13, T__13=14, T__14=15, T__15=16, T__16=17, 
		T__17=18, T__18=19, T__19=20, T__20=21, T__21=22, T__22=23, T__23=24, 
		T__24=25, T__25=26, T__26=27, T__27=28, T__28=29, T__29=30, T__30=31, 
		T__31=32, T__32=33, T__33=34, T__34=35, T__35=36, T__36=37, T__37=38, 
		T__38=39, T__39=40, T__40=41, T__41=42, T__42=43, T__43=44, T__44=45, 
		T__45=46, T__46=47, Int=48, String=49, Bool=50, Null=51, Identifier=52, 
		Letter=53, Digit=54, EscapeCharacter=55, NEWLINE=56, WS=57, LINE_COMMENT=58;
	public static final int
		RULE_compilationUnit = 0, RULE_programDeclaration = 1, RULE_classDeclaration = 2, 
		RULE_classBodyDeclaration = 3, RULE_functionDeclaration = 4, RULE_constructorDeclaration = 5, 
		RULE_parameters = 6, RULE_parameter = 7, RULE_variableDeclarationStatement = 8, 
		RULE_variableDeclarations = 9, RULE_variableDeclaration = 10, RULE_type = 11, 
		RULE_nonArrayType = 12, RULE_primitiveType = 13, RULE_classType = 14, 
		RULE_block = 15, RULE_blockStatement = 16, RULE_statement = 17, RULE_expressions = 18, 
		RULE_expression = 19, RULE_creator = 20, RULE_classCreator = 21, RULE_arrayCreator = 22, 
		RULE_primaryExpression = 23, RULE_literalExpression = 24;
	private static String[] makeRuleNames() {
		return new String[] {
			"compilationUnit", "programDeclaration", "classDeclaration", "classBodyDeclaration", 
			"functionDeclaration", "constructorDeclaration", "parameters", "parameter", 
			"variableDeclarationStatement", "variableDeclarations", "variableDeclaration", 
			"type", "nonArrayType", "primitiveType", "classType", "block", "blockStatement", 
			"statement", "expressions", "expression", "creator", "classCreator", 
			"arrayCreator", "primaryExpression", "literalExpression"
		};
	}
	public static final String[] ruleNames = makeRuleNames();

	private static String[] makeLiteralNames() {
		return new String[] {
			null, "'class'", "'{'", "'}'", "'void'", "'('", "')'", "','", "'='", 
			"';'", "'['", "']'", "'bool'", "'int'", "'double'", "'string'", "'if'", 
			"'else'", "'for'", "'while'", "'return'", "'break'", "'continue'", "'.'", 
			"'new'", "'++'", "'--'", "'+'", "'-'", "'~'", "'!'", "'*'", "'/'", "'%'", 
			"'<<'", "'>>'", "'<='", "'>='", "'>'", "'<'", "'=='", "'!='", "'&'", 
			"'^'", "'|'", "'&&'", "'||'", "'this'", null, null, null, "'null'"
		};
	}
	private static final String[] _LITERAL_NAMES = makeLiteralNames();
	private static String[] makeSymbolicNames() {
		return new String[] {
			null, null, null, null, null, null, null, null, null, null, null, null, 
			null, null, null, null, null, null, null, null, null, null, null, null, 
			null, null, null, null, null, null, null, null, null, null, null, null, 
			null, null, null, null, null, null, null, null, null, null, null, null, 
			"Int", "String", "Bool", "Null", "Identifier", "Letter", "Digit", "EscapeCharacter", 
			"NEWLINE", "WS", "LINE_COMMENT"
		};
	}
	private static final String[] _SYMBOLIC_NAMES = makeSymbolicNames();
	public static final Vocabulary VOCABULARY = new VocabularyImpl(_LITERAL_NAMES, _SYMBOLIC_NAMES);

	/**
	 * @deprecated Use {@link #VOCABULARY} instead.
	 */
	@Deprecated
	public static final String[] tokenNames;
	static {
		tokenNames = new String[_SYMBOLIC_NAMES.length];
		for (int i = 0; i < tokenNames.length; i++) {
			tokenNames[i] = VOCABULARY.getLiteralName(i);
			if (tokenNames[i] == null) {
				tokenNames[i] = VOCABULARY.getSymbolicName(i);
			}

			if (tokenNames[i] == null) {
				tokenNames[i] = "<INVALID>";
			}
		}
	}

	@Override
	@Deprecated
	public String[] getTokenNames() {
		return tokenNames;
	}

	@Override

	public Vocabulary getVocabulary() {
		return VOCABULARY;
	}

	@Override
	public String getGrammarFileName() { return "Mstar.g4"; }

	@Override
	public String[] getRuleNames() { return ruleNames; }

	@Override
	public String getSerializedATN() { return _serializedATN; }

	@Override
	public ATN getATN() { return _ATN; }

	public MstarParser(TokenStream input) {
		super(input);
		_interp = new ParserATNSimulator(this,_ATN,_decisionToDFA,_sharedContextCache);
	}

	public static class CompilationUnitContext extends ParserRuleContext {
		public TerminalNode EOF() { return getToken(MstarParser.EOF, 0); }
		public List<ProgramDeclarationContext> programDeclaration() {
			return getRuleContexts(ProgramDeclarationContext.class);
		}
		public ProgramDeclarationContext programDeclaration(int i) {
			return getRuleContext(ProgramDeclarationContext.class,i);
		}
		public CompilationUnitContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_compilationUnit; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof MstarListener ) ((MstarListener)listener).enterCompilationUnit(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof MstarListener ) ((MstarListener)listener).exitCompilationUnit(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof MstarVisitor ) return ((MstarVisitor<? extends T>)visitor).visitCompilationUnit(this);
			else return visitor.visitChildren(this);
		}
	}

	public final CompilationUnitContext compilationUnit() throws RecognitionException {
		CompilationUnitContext _localctx = new CompilationUnitContext(_ctx, getState());
		enterRule(_localctx, 0, RULE_compilationUnit);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(53);
			_errHandler.sync(this);
			_la = _input.LA(1);
			while ((((_la) & ~0x3f) == 0 && ((1L << _la) & ((1L << T__0) | (1L << T__3) | (1L << T__11) | (1L << T__12) | (1L << T__13) | (1L << T__14) | (1L << Identifier))) != 0)) {
				{
				{
				setState(50);
				programDeclaration();
				}
				}
				setState(55);
				_errHandler.sync(this);
				_la = _input.LA(1);
			}
			setState(56);
			match(EOF);
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class ProgramDeclarationContext extends ParserRuleContext {
		public ClassDeclarationContext classDeclaration() {
			return getRuleContext(ClassDeclarationContext.class,0);
		}
		public FunctionDeclarationContext functionDeclaration() {
			return getRuleContext(FunctionDeclarationContext.class,0);
		}
		public VariableDeclarationStatementContext variableDeclarationStatement() {
			return getRuleContext(VariableDeclarationStatementContext.class,0);
		}
		public ProgramDeclarationContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_programDeclaration; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof MstarListener ) ((MstarListener)listener).enterProgramDeclaration(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof MstarListener ) ((MstarListener)listener).exitProgramDeclaration(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof MstarVisitor ) return ((MstarVisitor<? extends T>)visitor).visitProgramDeclaration(this);
			else return visitor.visitChildren(this);
		}
	}

	public final ProgramDeclarationContext programDeclaration() throws RecognitionException {
		ProgramDeclarationContext _localctx = new ProgramDeclarationContext(_ctx, getState());
		enterRule(_localctx, 2, RULE_programDeclaration);
		try {
			setState(61);
			_errHandler.sync(this);
			switch ( getInterpreter().adaptivePredict(_input,1,_ctx) ) {
			case 1:
				enterOuterAlt(_localctx, 1);
				{
				setState(58);
				classDeclaration();
				}
				break;
			case 2:
				enterOuterAlt(_localctx, 2);
				{
				setState(59);
				functionDeclaration();
				}
				break;
			case 3:
				enterOuterAlt(_localctx, 3);
				{
				setState(60);
				variableDeclarationStatement();
				}
				break;
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class ClassDeclarationContext extends ParserRuleContext {
		public TerminalNode Identifier() { return getToken(MstarParser.Identifier, 0); }
		public List<ClassBodyDeclarationContext> classBodyDeclaration() {
			return getRuleContexts(ClassBodyDeclarationContext.class);
		}
		public ClassBodyDeclarationContext classBodyDeclaration(int i) {
			return getRuleContext(ClassBodyDeclarationContext.class,i);
		}
		public ClassDeclarationContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_classDeclaration; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof MstarListener ) ((MstarListener)listener).enterClassDeclaration(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof MstarListener ) ((MstarListener)listener).exitClassDeclaration(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof MstarVisitor ) return ((MstarVisitor<? extends T>)visitor).visitClassDeclaration(this);
			else return visitor.visitChildren(this);
		}
	}

	public final ClassDeclarationContext classDeclaration() throws RecognitionException {
		ClassDeclarationContext _localctx = new ClassDeclarationContext(_ctx, getState());
		enterRule(_localctx, 4, RULE_classDeclaration);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(63);
			match(T__0);
			setState(64);
			match(Identifier);
			setState(65);
			match(T__1);
			setState(69);
			_errHandler.sync(this);
			_la = _input.LA(1);
			while ((((_la) & ~0x3f) == 0 && ((1L << _la) & ((1L << T__3) | (1L << T__11) | (1L << T__12) | (1L << T__13) | (1L << T__14) | (1L << Identifier))) != 0)) {
				{
				{
				setState(66);
				classBodyDeclaration();
				}
				}
				setState(71);
				_errHandler.sync(this);
				_la = _input.LA(1);
			}
			setState(72);
			match(T__2);
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class ClassBodyDeclarationContext extends ParserRuleContext {
		public FunctionDeclarationContext functionDeclaration() {
			return getRuleContext(FunctionDeclarationContext.class,0);
		}
		public VariableDeclarationStatementContext variableDeclarationStatement() {
			return getRuleContext(VariableDeclarationStatementContext.class,0);
		}
		public ConstructorDeclarationContext constructorDeclaration() {
			return getRuleContext(ConstructorDeclarationContext.class,0);
		}
		public ClassBodyDeclarationContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_classBodyDeclaration; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof MstarListener ) ((MstarListener)listener).enterClassBodyDeclaration(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof MstarListener ) ((MstarListener)listener).exitClassBodyDeclaration(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof MstarVisitor ) return ((MstarVisitor<? extends T>)visitor).visitClassBodyDeclaration(this);
			else return visitor.visitChildren(this);
		}
	}

	public final ClassBodyDeclarationContext classBodyDeclaration() throws RecognitionException {
		ClassBodyDeclarationContext _localctx = new ClassBodyDeclarationContext(_ctx, getState());
		enterRule(_localctx, 6, RULE_classBodyDeclaration);
		try {
			setState(77);
			_errHandler.sync(this);
			switch ( getInterpreter().adaptivePredict(_input,3,_ctx) ) {
			case 1:
				enterOuterAlt(_localctx, 1);
				{
				setState(74);
				functionDeclaration();
				}
				break;
			case 2:
				enterOuterAlt(_localctx, 2);
				{
				setState(75);
				variableDeclarationStatement();
				}
				break;
			case 3:
				enterOuterAlt(_localctx, 3);
				{
				setState(76);
				constructorDeclaration();
				}
				break;
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class FunctionDeclarationContext extends ParserRuleContext {
		public TerminalNode Identifier() { return getToken(MstarParser.Identifier, 0); }
		public BlockContext block() {
			return getRuleContext(BlockContext.class,0);
		}
		public TypeContext type() {
			return getRuleContext(TypeContext.class,0);
		}
		public ParametersContext parameters() {
			return getRuleContext(ParametersContext.class,0);
		}
		public FunctionDeclarationContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_functionDeclaration; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof MstarListener ) ((MstarListener)listener).enterFunctionDeclaration(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof MstarListener ) ((MstarListener)listener).exitFunctionDeclaration(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof MstarVisitor ) return ((MstarVisitor<? extends T>)visitor).visitFunctionDeclaration(this);
			else return visitor.visitChildren(this);
		}
	}

	public final FunctionDeclarationContext functionDeclaration() throws RecognitionException {
		FunctionDeclarationContext _localctx = new FunctionDeclarationContext(_ctx, getState());
		enterRule(_localctx, 8, RULE_functionDeclaration);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(81);
			_errHandler.sync(this);
			switch (_input.LA(1)) {
			case T__11:
			case T__12:
			case T__13:
			case T__14:
			case Identifier:
				{
				setState(79);
				type();
				}
				break;
			case T__3:
				{
				setState(80);
				match(T__3);
				}
				break;
			default:
				throw new NoViableAltException(this);
			}
			setState(83);
			match(Identifier);
			setState(84);
			match(T__4);
			setState(86);
			_errHandler.sync(this);
			_la = _input.LA(1);
			if ((((_la) & ~0x3f) == 0 && ((1L << _la) & ((1L << T__11) | (1L << T__12) | (1L << T__13) | (1L << T__14) | (1L << Identifier))) != 0)) {
				{
				setState(85);
				parameters();
				}
			}

			setState(88);
			match(T__5);
			setState(89);
			block();
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class ConstructorDeclarationContext extends ParserRuleContext {
		public TerminalNode Identifier() { return getToken(MstarParser.Identifier, 0); }
		public BlockContext block() {
			return getRuleContext(BlockContext.class,0);
		}
		public ParametersContext parameters() {
			return getRuleContext(ParametersContext.class,0);
		}
		public ConstructorDeclarationContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_constructorDeclaration; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof MstarListener ) ((MstarListener)listener).enterConstructorDeclaration(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof MstarListener ) ((MstarListener)listener).exitConstructorDeclaration(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof MstarVisitor ) return ((MstarVisitor<? extends T>)visitor).visitConstructorDeclaration(this);
			else return visitor.visitChildren(this);
		}
	}

	public final ConstructorDeclarationContext constructorDeclaration() throws RecognitionException {
		ConstructorDeclarationContext _localctx = new ConstructorDeclarationContext(_ctx, getState());
		enterRule(_localctx, 10, RULE_constructorDeclaration);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(91);
			match(Identifier);
			setState(92);
			match(T__4);
			setState(94);
			_errHandler.sync(this);
			_la = _input.LA(1);
			if ((((_la) & ~0x3f) == 0 && ((1L << _la) & ((1L << T__11) | (1L << T__12) | (1L << T__13) | (1L << T__14) | (1L << Identifier))) != 0)) {
				{
				setState(93);
				parameters();
				}
			}

			setState(96);
			match(T__5);
			setState(97);
			block();
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class ParametersContext extends ParserRuleContext {
		public List<ParameterContext> parameter() {
			return getRuleContexts(ParameterContext.class);
		}
		public ParameterContext parameter(int i) {
			return getRuleContext(ParameterContext.class,i);
		}
		public ParametersContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_parameters; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof MstarListener ) ((MstarListener)listener).enterParameters(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof MstarListener ) ((MstarListener)listener).exitParameters(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof MstarVisitor ) return ((MstarVisitor<? extends T>)visitor).visitParameters(this);
			else return visitor.visitChildren(this);
		}
	}

	public final ParametersContext parameters() throws RecognitionException {
		ParametersContext _localctx = new ParametersContext(_ctx, getState());
		enterRule(_localctx, 12, RULE_parameters);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(99);
			parameter();
			setState(104);
			_errHandler.sync(this);
			_la = _input.LA(1);
			while (_la==T__6) {
				{
				{
				setState(100);
				match(T__6);
				setState(101);
				parameter();
				}
				}
				setState(106);
				_errHandler.sync(this);
				_la = _input.LA(1);
			}
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class ParameterContext extends ParserRuleContext {
		public TypeContext type() {
			return getRuleContext(TypeContext.class,0);
		}
		public TerminalNode Identifier() { return getToken(MstarParser.Identifier, 0); }
		public ExpressionContext expression() {
			return getRuleContext(ExpressionContext.class,0);
		}
		public ParameterContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_parameter; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof MstarListener ) ((MstarListener)listener).enterParameter(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof MstarListener ) ((MstarListener)listener).exitParameter(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof MstarVisitor ) return ((MstarVisitor<? extends T>)visitor).visitParameter(this);
			else return visitor.visitChildren(this);
		}
	}

	public final ParameterContext parameter() throws RecognitionException {
		ParameterContext _localctx = new ParameterContext(_ctx, getState());
		enterRule(_localctx, 14, RULE_parameter);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(107);
			type();
			setState(108);
			match(Identifier);
			setState(111);
			_errHandler.sync(this);
			_la = _input.LA(1);
			if (_la==T__7) {
				{
				setState(109);
				match(T__7);
				setState(110);
				expression(0);
				}
			}

			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class VariableDeclarationStatementContext extends ParserRuleContext {
		public TypeContext type() {
			return getRuleContext(TypeContext.class,0);
		}
		public VariableDeclarationsContext variableDeclarations() {
			return getRuleContext(VariableDeclarationsContext.class,0);
		}
		public VariableDeclarationStatementContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_variableDeclarationStatement; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof MstarListener ) ((MstarListener)listener).enterVariableDeclarationStatement(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof MstarListener ) ((MstarListener)listener).exitVariableDeclarationStatement(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof MstarVisitor ) return ((MstarVisitor<? extends T>)visitor).visitVariableDeclarationStatement(this);
			else return visitor.visitChildren(this);
		}
	}

	public final VariableDeclarationStatementContext variableDeclarationStatement() throws RecognitionException {
		VariableDeclarationStatementContext _localctx = new VariableDeclarationStatementContext(_ctx, getState());
		enterRule(_localctx, 16, RULE_variableDeclarationStatement);
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(113);
			type();
			setState(114);
			variableDeclarations();
			setState(115);
			match(T__8);
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class VariableDeclarationsContext extends ParserRuleContext {
		public List<VariableDeclarationContext> variableDeclaration() {
			return getRuleContexts(VariableDeclarationContext.class);
		}
		public VariableDeclarationContext variableDeclaration(int i) {
			return getRuleContext(VariableDeclarationContext.class,i);
		}
		public VariableDeclarationsContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_variableDeclarations; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof MstarListener ) ((MstarListener)listener).enterVariableDeclarations(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof MstarListener ) ((MstarListener)listener).exitVariableDeclarations(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof MstarVisitor ) return ((MstarVisitor<? extends T>)visitor).visitVariableDeclarations(this);
			else return visitor.visitChildren(this);
		}
	}

	public final VariableDeclarationsContext variableDeclarations() throws RecognitionException {
		VariableDeclarationsContext _localctx = new VariableDeclarationsContext(_ctx, getState());
		enterRule(_localctx, 18, RULE_variableDeclarations);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(117);
			variableDeclaration();
			setState(122);
			_errHandler.sync(this);
			_la = _input.LA(1);
			while (_la==T__6) {
				{
				{
				setState(118);
				match(T__6);
				setState(119);
				variableDeclaration();
				}
				}
				setState(124);
				_errHandler.sync(this);
				_la = _input.LA(1);
			}
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class VariableDeclarationContext extends ParserRuleContext {
		public TerminalNode Identifier() { return getToken(MstarParser.Identifier, 0); }
		public ExpressionContext expression() {
			return getRuleContext(ExpressionContext.class,0);
		}
		public VariableDeclarationContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_variableDeclaration; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof MstarListener ) ((MstarListener)listener).enterVariableDeclaration(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof MstarListener ) ((MstarListener)listener).exitVariableDeclaration(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof MstarVisitor ) return ((MstarVisitor<? extends T>)visitor).visitVariableDeclaration(this);
			else return visitor.visitChildren(this);
		}
	}

	public final VariableDeclarationContext variableDeclaration() throws RecognitionException {
		VariableDeclarationContext _localctx = new VariableDeclarationContext(_ctx, getState());
		enterRule(_localctx, 20, RULE_variableDeclaration);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(125);
			match(Identifier);
			setState(128);
			_errHandler.sync(this);
			_la = _input.LA(1);
			if (_la==T__7) {
				{
				setState(126);
				match(T__7);
				setState(127);
				expression(0);
				}
			}

			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class TypeContext extends ParserRuleContext {
		public NonArrayTypeContext nonArrayType() {
			return getRuleContext(NonArrayTypeContext.class,0);
		}
		public TypeContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_type; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof MstarListener ) ((MstarListener)listener).enterType(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof MstarListener ) ((MstarListener)listener).exitType(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof MstarVisitor ) return ((MstarVisitor<? extends T>)visitor).visitType(this);
			else return visitor.visitChildren(this);
		}
	}

	public final TypeContext type() throws RecognitionException {
		TypeContext _localctx = new TypeContext(_ctx, getState());
		enterRule(_localctx, 22, RULE_type);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(130);
			nonArrayType();
			setState(135);
			_errHandler.sync(this);
			_la = _input.LA(1);
			while (_la==T__9) {
				{
				{
				setState(131);
				match(T__9);
				setState(132);
				match(T__10);
				}
				}
				setState(137);
				_errHandler.sync(this);
				_la = _input.LA(1);
			}
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class NonArrayTypeContext extends ParserRuleContext {
		public PrimitiveTypeContext primitiveType() {
			return getRuleContext(PrimitiveTypeContext.class,0);
		}
		public ClassTypeContext classType() {
			return getRuleContext(ClassTypeContext.class,0);
		}
		public NonArrayTypeContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_nonArrayType; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof MstarListener ) ((MstarListener)listener).enterNonArrayType(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof MstarListener ) ((MstarListener)listener).exitNonArrayType(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof MstarVisitor ) return ((MstarVisitor<? extends T>)visitor).visitNonArrayType(this);
			else return visitor.visitChildren(this);
		}
	}

	public final NonArrayTypeContext nonArrayType() throws RecognitionException {
		NonArrayTypeContext _localctx = new NonArrayTypeContext(_ctx, getState());
		enterRule(_localctx, 24, RULE_nonArrayType);
		try {
			setState(140);
			_errHandler.sync(this);
			switch (_input.LA(1)) {
			case T__11:
			case T__12:
			case T__13:
			case T__14:
				enterOuterAlt(_localctx, 1);
				{
				setState(138);
				primitiveType();
				}
				break;
			case Identifier:
				enterOuterAlt(_localctx, 2);
				{
				setState(139);
				classType();
				}
				break;
			default:
				throw new NoViableAltException(this);
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class PrimitiveTypeContext extends ParserRuleContext {
		public PrimitiveTypeContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_primitiveType; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof MstarListener ) ((MstarListener)listener).enterPrimitiveType(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof MstarListener ) ((MstarListener)listener).exitPrimitiveType(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof MstarVisitor ) return ((MstarVisitor<? extends T>)visitor).visitPrimitiveType(this);
			else return visitor.visitChildren(this);
		}
	}

	public final PrimitiveTypeContext primitiveType() throws RecognitionException {
		PrimitiveTypeContext _localctx = new PrimitiveTypeContext(_ctx, getState());
		enterRule(_localctx, 26, RULE_primitiveType);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(142);
			_la = _input.LA(1);
			if ( !((((_la) & ~0x3f) == 0 && ((1L << _la) & ((1L << T__11) | (1L << T__12) | (1L << T__13) | (1L << T__14))) != 0)) ) {
			_errHandler.recoverInline(this);
			}
			else {
				if ( _input.LA(1)==Token.EOF ) matchedEOF = true;
				_errHandler.reportMatch(this);
				consume();
			}
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class ClassTypeContext extends ParserRuleContext {
		public TerminalNode Identifier() { return getToken(MstarParser.Identifier, 0); }
		public ClassTypeContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_classType; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof MstarListener ) ((MstarListener)listener).enterClassType(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof MstarListener ) ((MstarListener)listener).exitClassType(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof MstarVisitor ) return ((MstarVisitor<? extends T>)visitor).visitClassType(this);
			else return visitor.visitChildren(this);
		}
	}

	public final ClassTypeContext classType() throws RecognitionException {
		ClassTypeContext _localctx = new ClassTypeContext(_ctx, getState());
		enterRule(_localctx, 28, RULE_classType);
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(144);
			match(Identifier);
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class BlockContext extends ParserRuleContext {
		public List<BlockStatementContext> blockStatement() {
			return getRuleContexts(BlockStatementContext.class);
		}
		public BlockStatementContext blockStatement(int i) {
			return getRuleContext(BlockStatementContext.class,i);
		}
		public BlockContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_block; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof MstarListener ) ((MstarListener)listener).enterBlock(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof MstarListener ) ((MstarListener)listener).exitBlock(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof MstarVisitor ) return ((MstarVisitor<? extends T>)visitor).visitBlock(this);
			else return visitor.visitChildren(this);
		}
	}

	public final BlockContext block() throws RecognitionException {
		BlockContext _localctx = new BlockContext(_ctx, getState());
		enterRule(_localctx, 30, RULE_block);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(146);
			match(T__1);
			setState(150);
			_errHandler.sync(this);
			_la = _input.LA(1);
			while ((((_la) & ~0x3f) == 0 && ((1L << _la) & ((1L << T__1) | (1L << T__4) | (1L << T__11) | (1L << T__12) | (1L << T__13) | (1L << T__14) | (1L << T__15) | (1L << T__17) | (1L << T__18) | (1L << T__19) | (1L << T__20) | (1L << T__21) | (1L << T__23) | (1L << T__24) | (1L << T__25) | (1L << T__26) | (1L << T__27) | (1L << T__28) | (1L << T__29) | (1L << T__46) | (1L << Int) | (1L << String) | (1L << Bool) | (1L << Null) | (1L << Identifier))) != 0)) {
				{
				{
				setState(147);
				blockStatement();
				}
				}
				setState(152);
				_errHandler.sync(this);
				_la = _input.LA(1);
			}
			setState(153);
			match(T__2);
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class BlockStatementContext extends ParserRuleContext {
		public StatementContext statement() {
			return getRuleContext(StatementContext.class,0);
		}
		public VariableDeclarationStatementContext variableDeclarationStatement() {
			return getRuleContext(VariableDeclarationStatementContext.class,0);
		}
		public BlockStatementContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_blockStatement; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof MstarListener ) ((MstarListener)listener).enterBlockStatement(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof MstarListener ) ((MstarListener)listener).exitBlockStatement(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof MstarVisitor ) return ((MstarVisitor<? extends T>)visitor).visitBlockStatement(this);
			else return visitor.visitChildren(this);
		}
	}

	public final BlockStatementContext blockStatement() throws RecognitionException {
		BlockStatementContext _localctx = new BlockStatementContext(_ctx, getState());
		enterRule(_localctx, 32, RULE_blockStatement);
		try {
			setState(157);
			_errHandler.sync(this);
			switch ( getInterpreter().adaptivePredict(_input,14,_ctx) ) {
			case 1:
				enterOuterAlt(_localctx, 1);
				{
				setState(155);
				statement();
				}
				break;
			case 2:
				enterOuterAlt(_localctx, 2);
				{
				setState(156);
				variableDeclarationStatement();
				}
				break;
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class StatementContext extends ParserRuleContext {
		public BlockContext block() {
			return getRuleContext(BlockContext.class,0);
		}
		public ExpressionContext expression() {
			return getRuleContext(ExpressionContext.class,0);
		}
		public List<StatementContext> statement() {
			return getRuleContexts(StatementContext.class);
		}
		public StatementContext statement(int i) {
			return getRuleContext(StatementContext.class,i);
		}
		public List<ExpressionsContext> expressions() {
			return getRuleContexts(ExpressionsContext.class);
		}
		public ExpressionsContext expressions(int i) {
			return getRuleContext(ExpressionsContext.class,i);
		}
		public StatementContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_statement; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof MstarListener ) ((MstarListener)listener).enterStatement(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof MstarListener ) ((MstarListener)listener).exitStatement(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof MstarVisitor ) return ((MstarVisitor<? extends T>)visitor).visitStatement(this);
			else return visitor.visitChildren(this);
		}
	}

	public final StatementContext statement() throws RecognitionException {
		StatementContext _localctx = new StatementContext(_ctx, getState());
		enterRule(_localctx, 34, RULE_statement);
		int _la;
		try {
			setState(202);
			_errHandler.sync(this);
			switch (_input.LA(1)) {
			case T__1:
				enterOuterAlt(_localctx, 1);
				{
				setState(159);
				block();
				}
				break;
			case T__15:
				enterOuterAlt(_localctx, 2);
				{
				setState(160);
				match(T__15);
				setState(161);
				match(T__4);
				setState(162);
				expression(0);
				setState(163);
				match(T__5);
				setState(164);
				statement();
				setState(167);
				_errHandler.sync(this);
				switch ( getInterpreter().adaptivePredict(_input,15,_ctx) ) {
				case 1:
					{
					setState(165);
					match(T__16);
					setState(166);
					statement();
					}
					break;
				}
				}
				break;
			case T__17:
				enterOuterAlt(_localctx, 3);
				{
				setState(169);
				match(T__17);
				setState(170);
				match(T__4);
				setState(172);
				_errHandler.sync(this);
				_la = _input.LA(1);
				if ((((_la) & ~0x3f) == 0 && ((1L << _la) & ((1L << T__4) | (1L << T__23) | (1L << T__24) | (1L << T__25) | (1L << T__26) | (1L << T__27) | (1L << T__28) | (1L << T__29) | (1L << T__46) | (1L << Int) | (1L << String) | (1L << Bool) | (1L << Null) | (1L << Identifier))) != 0)) {
					{
					setState(171);
					expressions();
					}
				}

				setState(174);
				match(T__8);
				setState(176);
				_errHandler.sync(this);
				_la = _input.LA(1);
				if ((((_la) & ~0x3f) == 0 && ((1L << _la) & ((1L << T__4) | (1L << T__23) | (1L << T__24) | (1L << T__25) | (1L << T__26) | (1L << T__27) | (1L << T__28) | (1L << T__29) | (1L << T__46) | (1L << Int) | (1L << String) | (1L << Bool) | (1L << Null) | (1L << Identifier))) != 0)) {
					{
					setState(175);
					expression(0);
					}
				}

				setState(178);
				match(T__8);
				setState(180);
				_errHandler.sync(this);
				_la = _input.LA(1);
				if ((((_la) & ~0x3f) == 0 && ((1L << _la) & ((1L << T__4) | (1L << T__23) | (1L << T__24) | (1L << T__25) | (1L << T__26) | (1L << T__27) | (1L << T__28) | (1L << T__29) | (1L << T__46) | (1L << Int) | (1L << String) | (1L << Bool) | (1L << Null) | (1L << Identifier))) != 0)) {
					{
					setState(179);
					expressions();
					}
				}

				setState(182);
				match(T__5);
				setState(183);
				statement();
				}
				break;
			case T__18:
				enterOuterAlt(_localctx, 4);
				{
				setState(184);
				match(T__18);
				setState(185);
				match(T__4);
				setState(186);
				expression(0);
				setState(187);
				match(T__5);
				setState(188);
				statement();
				}
				break;
			case T__19:
				enterOuterAlt(_localctx, 5);
				{
				setState(190);
				match(T__19);
				setState(192);
				_errHandler.sync(this);
				_la = _input.LA(1);
				if ((((_la) & ~0x3f) == 0 && ((1L << _la) & ((1L << T__4) | (1L << T__23) | (1L << T__24) | (1L << T__25) | (1L << T__26) | (1L << T__27) | (1L << T__28) | (1L << T__29) | (1L << T__46) | (1L << Int) | (1L << String) | (1L << Bool) | (1L << Null) | (1L << Identifier))) != 0)) {
					{
					setState(191);
					expression(0);
					}
				}

				setState(194);
				match(T__8);
				}
				break;
			case T__20:
				enterOuterAlt(_localctx, 6);
				{
				setState(195);
				match(T__20);
				setState(196);
				match(T__8);
				}
				break;
			case T__21:
				enterOuterAlt(_localctx, 7);
				{
				setState(197);
				match(T__21);
				setState(198);
				match(T__8);
				}
				break;
			case T__4:
			case T__23:
			case T__24:
			case T__25:
			case T__26:
			case T__27:
			case T__28:
			case T__29:
			case T__46:
			case Int:
			case String:
			case Bool:
			case Null:
			case Identifier:
				enterOuterAlt(_localctx, 8);
				{
				setState(199);
				expression(0);
				setState(200);
				match(T__8);
				}
				break;
			default:
				throw new NoViableAltException(this);
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class ExpressionsContext extends ParserRuleContext {
		public List<ExpressionContext> expression() {
			return getRuleContexts(ExpressionContext.class);
		}
		public ExpressionContext expression(int i) {
			return getRuleContext(ExpressionContext.class,i);
		}
		public ExpressionsContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_expressions; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof MstarListener ) ((MstarListener)listener).enterExpressions(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof MstarListener ) ((MstarListener)listener).exitExpressions(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof MstarVisitor ) return ((MstarVisitor<? extends T>)visitor).visitExpressions(this);
			else return visitor.visitChildren(this);
		}
	}

	public final ExpressionsContext expressions() throws RecognitionException {
		ExpressionsContext _localctx = new ExpressionsContext(_ctx, getState());
		enterRule(_localctx, 36, RULE_expressions);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(204);
			expression(0);
			setState(209);
			_errHandler.sync(this);
			_la = _input.LA(1);
			while (_la==T__6) {
				{
				{
				setState(205);
				match(T__6);
				setState(206);
				expression(0);
				}
				}
				setState(211);
				_errHandler.sync(this);
				_la = _input.LA(1);
			}
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class ExpressionContext extends ParserRuleContext {
		public PrimaryExpressionContext primaryExpression() {
			return getRuleContext(PrimaryExpressionContext.class,0);
		}
		public CreatorContext creator() {
			return getRuleContext(CreatorContext.class,0);
		}
		public List<ExpressionContext> expression() {
			return getRuleContexts(ExpressionContext.class);
		}
		public ExpressionContext expression(int i) {
			return getRuleContext(ExpressionContext.class,i);
		}
		public TerminalNode Identifier() { return getToken(MstarParser.Identifier, 0); }
		public ExpressionsContext expressions() {
			return getRuleContext(ExpressionsContext.class,0);
		}
		public ExpressionContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_expression; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof MstarListener ) ((MstarListener)listener).enterExpression(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof MstarListener ) ((MstarListener)listener).exitExpression(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof MstarVisitor ) return ((MstarVisitor<? extends T>)visitor).visitExpression(this);
			else return visitor.visitChildren(this);
		}
	}

	public final ExpressionContext expression() throws RecognitionException {
		return expression(0);
	}

	private ExpressionContext expression(int _p) throws RecognitionException {
		ParserRuleContext _parentctx = _ctx;
		int _parentState = getState();
		ExpressionContext _localctx = new ExpressionContext(_ctx, _parentState);
		ExpressionContext _prevctx = _localctx;
		int _startState = 38;
		enterRecursionRule(_localctx, 38, RULE_expression, _p);
		int _la;
		try {
			int _alt;
			enterOuterAlt(_localctx, 1);
			{
			setState(220);
			_errHandler.sync(this);
			switch (_input.LA(1)) {
			case T__4:
			case T__46:
			case Int:
			case String:
			case Bool:
			case Null:
			case Identifier:
				{
				setState(213);
				primaryExpression();
				}
				break;
			case T__23:
				{
				setState(214);
				match(T__23);
				setState(215);
				creator();
				}
				break;
			case T__24:
			case T__25:
			case T__26:
			case T__27:
				{
				setState(216);
				_la = _input.LA(1);
				if ( !((((_la) & ~0x3f) == 0 && ((1L << _la) & ((1L << T__24) | (1L << T__25) | (1L << T__26) | (1L << T__27))) != 0)) ) {
				_errHandler.recoverInline(this);
				}
				else {
					if ( _input.LA(1)==Token.EOF ) matchedEOF = true;
					_errHandler.reportMatch(this);
					consume();
				}
				setState(217);
				expression(13);
				}
				break;
			case T__28:
			case T__29:
				{
				setState(218);
				_la = _input.LA(1);
				if ( !(_la==T__28 || _la==T__29) ) {
				_errHandler.recoverInline(this);
				}
				else {
					if ( _input.LA(1)==Token.EOF ) matchedEOF = true;
					_errHandler.reportMatch(this);
					consume();
				}
				setState(219);
				expression(12);
				}
				break;
			default:
				throw new NoViableAltException(this);
			}
			_ctx.stop = _input.LT(-1);
			setState(273);
			_errHandler.sync(this);
			_alt = getInterpreter().adaptivePredict(_input,25,_ctx);
			while ( _alt!=2 && _alt!=org.antlr.v4.runtime.atn.ATN.INVALID_ALT_NUMBER ) {
				if ( _alt==1 ) {
					if ( _parseListeners!=null ) triggerExitRuleEvent();
					_prevctx = _localctx;
					{
					setState(271);
					_errHandler.sync(this);
					switch ( getInterpreter().adaptivePredict(_input,24,_ctx) ) {
					case 1:
						{
						_localctx = new ExpressionContext(_parentctx, _parentState);
						pushNewRecursionContext(_localctx, _startState, RULE_expression);
						setState(222);
						if (!(precpred(_ctx, 11))) throw new FailedPredicateException(this, "precpred(_ctx, 11)");
						setState(223);
						_la = _input.LA(1);
						if ( !((((_la) & ~0x3f) == 0 && ((1L << _la) & ((1L << T__30) | (1L << T__31) | (1L << T__32))) != 0)) ) {
						_errHandler.recoverInline(this);
						}
						else {
							if ( _input.LA(1)==Token.EOF ) matchedEOF = true;
							_errHandler.reportMatch(this);
							consume();
						}
						setState(224);
						expression(12);
						}
						break;
					case 2:
						{
						_localctx = new ExpressionContext(_parentctx, _parentState);
						pushNewRecursionContext(_localctx, _startState, RULE_expression);
						setState(225);
						if (!(precpred(_ctx, 10))) throw new FailedPredicateException(this, "precpred(_ctx, 10)");
						setState(226);
						_la = _input.LA(1);
						if ( !(_la==T__26 || _la==T__27) ) {
						_errHandler.recoverInline(this);
						}
						else {
							if ( _input.LA(1)==Token.EOF ) matchedEOF = true;
							_errHandler.reportMatch(this);
							consume();
						}
						setState(227);
						expression(11);
						}
						break;
					case 3:
						{
						_localctx = new ExpressionContext(_parentctx, _parentState);
						pushNewRecursionContext(_localctx, _startState, RULE_expression);
						setState(228);
						if (!(precpred(_ctx, 9))) throw new FailedPredicateException(this, "precpred(_ctx, 9)");
						setState(229);
						_la = _input.LA(1);
						if ( !(_la==T__33 || _la==T__34) ) {
						_errHandler.recoverInline(this);
						}
						else {
							if ( _input.LA(1)==Token.EOF ) matchedEOF = true;
							_errHandler.reportMatch(this);
							consume();
						}
						setState(230);
						expression(10);
						}
						break;
					case 4:
						{
						_localctx = new ExpressionContext(_parentctx, _parentState);
						pushNewRecursionContext(_localctx, _startState, RULE_expression);
						setState(231);
						if (!(precpred(_ctx, 8))) throw new FailedPredicateException(this, "precpred(_ctx, 8)");
						setState(232);
						_la = _input.LA(1);
						if ( !((((_la) & ~0x3f) == 0 && ((1L << _la) & ((1L << T__35) | (1L << T__36) | (1L << T__37) | (1L << T__38))) != 0)) ) {
						_errHandler.recoverInline(this);
						}
						else {
							if ( _input.LA(1)==Token.EOF ) matchedEOF = true;
							_errHandler.reportMatch(this);
							consume();
						}
						setState(233);
						expression(9);
						}
						break;
					case 5:
						{
						_localctx = new ExpressionContext(_parentctx, _parentState);
						pushNewRecursionContext(_localctx, _startState, RULE_expression);
						setState(234);
						if (!(precpred(_ctx, 7))) throw new FailedPredicateException(this, "precpred(_ctx, 7)");
						setState(235);
						_la = _input.LA(1);
						if ( !(_la==T__39 || _la==T__40) ) {
						_errHandler.recoverInline(this);
						}
						else {
							if ( _input.LA(1)==Token.EOF ) matchedEOF = true;
							_errHandler.reportMatch(this);
							consume();
						}
						setState(236);
						expression(8);
						}
						break;
					case 6:
						{
						_localctx = new ExpressionContext(_parentctx, _parentState);
						pushNewRecursionContext(_localctx, _startState, RULE_expression);
						setState(237);
						if (!(precpred(_ctx, 6))) throw new FailedPredicateException(this, "precpred(_ctx, 6)");
						setState(238);
						match(T__41);
						setState(239);
						expression(7);
						}
						break;
					case 7:
						{
						_localctx = new ExpressionContext(_parentctx, _parentState);
						pushNewRecursionContext(_localctx, _startState, RULE_expression);
						setState(240);
						if (!(precpred(_ctx, 5))) throw new FailedPredicateException(this, "precpred(_ctx, 5)");
						setState(241);
						match(T__42);
						setState(242);
						expression(6);
						}
						break;
					case 8:
						{
						_localctx = new ExpressionContext(_parentctx, _parentState);
						pushNewRecursionContext(_localctx, _startState, RULE_expression);
						setState(243);
						if (!(precpred(_ctx, 4))) throw new FailedPredicateException(this, "precpred(_ctx, 4)");
						setState(244);
						match(T__43);
						setState(245);
						expression(5);
						}
						break;
					case 9:
						{
						_localctx = new ExpressionContext(_parentctx, _parentState);
						pushNewRecursionContext(_localctx, _startState, RULE_expression);
						setState(246);
						if (!(precpred(_ctx, 3))) throw new FailedPredicateException(this, "precpred(_ctx, 3)");
						setState(247);
						match(T__44);
						setState(248);
						expression(4);
						}
						break;
					case 10:
						{
						_localctx = new ExpressionContext(_parentctx, _parentState);
						pushNewRecursionContext(_localctx, _startState, RULE_expression);
						setState(249);
						if (!(precpred(_ctx, 2))) throw new FailedPredicateException(this, "precpred(_ctx, 2)");
						setState(250);
						match(T__45);
						setState(251);
						expression(3);
						}
						break;
					case 11:
						{
						_localctx = new ExpressionContext(_parentctx, _parentState);
						pushNewRecursionContext(_localctx, _startState, RULE_expression);
						setState(252);
						if (!(precpred(_ctx, 1))) throw new FailedPredicateException(this, "precpred(_ctx, 1)");
						setState(253);
						match(T__7);
						setState(254);
						expression(1);
						}
						break;
					case 12:
						{
						_localctx = new ExpressionContext(_parentctx, _parentState);
						pushNewRecursionContext(_localctx, _startState, RULE_expression);
						setState(255);
						if (!(precpred(_ctx, 18))) throw new FailedPredicateException(this, "precpred(_ctx, 18)");
						setState(256);
						match(T__22);
						setState(257);
						match(Identifier);
						}
						break;
					case 13:
						{
						_localctx = new ExpressionContext(_parentctx, _parentState);
						pushNewRecursionContext(_localctx, _startState, RULE_expression);
						setState(258);
						if (!(precpred(_ctx, 17))) throw new FailedPredicateException(this, "precpred(_ctx, 17)");
						setState(259);
						match(T__9);
						setState(260);
						expression(0);
						setState(261);
						match(T__10);
						}
						break;
					case 14:
						{
						_localctx = new ExpressionContext(_parentctx, _parentState);
						pushNewRecursionContext(_localctx, _startState, RULE_expression);
						setState(263);
						if (!(precpred(_ctx, 16))) throw new FailedPredicateException(this, "precpred(_ctx, 16)");
						setState(264);
						match(T__4);
						setState(266);
						_errHandler.sync(this);
						_la = _input.LA(1);
						if ((((_la) & ~0x3f) == 0 && ((1L << _la) & ((1L << T__4) | (1L << T__23) | (1L << T__24) | (1L << T__25) | (1L << T__26) | (1L << T__27) | (1L << T__28) | (1L << T__29) | (1L << T__46) | (1L << Int) | (1L << String) | (1L << Bool) | (1L << Null) | (1L << Identifier))) != 0)) {
							{
							setState(265);
							expressions();
							}
						}

						setState(268);
						match(T__5);
						}
						break;
					case 15:
						{
						_localctx = new ExpressionContext(_parentctx, _parentState);
						pushNewRecursionContext(_localctx, _startState, RULE_expression);
						setState(269);
						if (!(precpred(_ctx, 14))) throw new FailedPredicateException(this, "precpred(_ctx, 14)");
						setState(270);
						_la = _input.LA(1);
						if ( !(_la==T__24 || _la==T__25) ) {
						_errHandler.recoverInline(this);
						}
						else {
							if ( _input.LA(1)==Token.EOF ) matchedEOF = true;
							_errHandler.reportMatch(this);
							consume();
						}
						}
						break;
					}
					} 
				}
				setState(275);
				_errHandler.sync(this);
				_alt = getInterpreter().adaptivePredict(_input,25,_ctx);
			}
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			unrollRecursionContexts(_parentctx);
		}
		return _localctx;
	}

	public static class CreatorContext extends ParserRuleContext {
		public NonArrayTypeContext nonArrayType() {
			return getRuleContext(NonArrayTypeContext.class,0);
		}
		public ClassCreatorContext classCreator() {
			return getRuleContext(ClassCreatorContext.class,0);
		}
		public ArrayCreatorContext arrayCreator() {
			return getRuleContext(ArrayCreatorContext.class,0);
		}
		public CreatorContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_creator; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof MstarListener ) ((MstarListener)listener).enterCreator(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof MstarListener ) ((MstarListener)listener).exitCreator(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof MstarVisitor ) return ((MstarVisitor<? extends T>)visitor).visitCreator(this);
			else return visitor.visitChildren(this);
		}
	}

	public final CreatorContext creator() throws RecognitionException {
		CreatorContext _localctx = new CreatorContext(_ctx, getState());
		enterRule(_localctx, 40, RULE_creator);
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(276);
			nonArrayType();
			setState(279);
			_errHandler.sync(this);
			switch ( getInterpreter().adaptivePredict(_input,26,_ctx) ) {
			case 1:
				{
				setState(277);
				classCreator();
				}
				break;
			case 2:
				{
				setState(278);
				arrayCreator();
				}
				break;
			}
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class ClassCreatorContext extends ParserRuleContext {
		public ExpressionsContext expressions() {
			return getRuleContext(ExpressionsContext.class,0);
		}
		public ClassCreatorContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_classCreator; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof MstarListener ) ((MstarListener)listener).enterClassCreator(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof MstarListener ) ((MstarListener)listener).exitClassCreator(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof MstarVisitor ) return ((MstarVisitor<? extends T>)visitor).visitClassCreator(this);
			else return visitor.visitChildren(this);
		}
	}

	public final ClassCreatorContext classCreator() throws RecognitionException {
		ClassCreatorContext _localctx = new ClassCreatorContext(_ctx, getState());
		enterRule(_localctx, 42, RULE_classCreator);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(281);
			match(T__4);
			setState(283);
			_errHandler.sync(this);
			_la = _input.LA(1);
			if ((((_la) & ~0x3f) == 0 && ((1L << _la) & ((1L << T__4) | (1L << T__23) | (1L << T__24) | (1L << T__25) | (1L << T__26) | (1L << T__27) | (1L << T__28) | (1L << T__29) | (1L << T__46) | (1L << Int) | (1L << String) | (1L << Bool) | (1L << Null) | (1L << Identifier))) != 0)) {
				{
				setState(282);
				expressions();
				}
			}

			setState(285);
			match(T__5);
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class ArrayCreatorContext extends ParserRuleContext {
		public List<ExpressionContext> expression() {
			return getRuleContexts(ExpressionContext.class);
		}
		public ExpressionContext expression(int i) {
			return getRuleContext(ExpressionContext.class,i);
		}
		public ArrayCreatorContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_arrayCreator; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof MstarListener ) ((MstarListener)listener).enterArrayCreator(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof MstarListener ) ((MstarListener)listener).exitArrayCreator(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof MstarVisitor ) return ((MstarVisitor<? extends T>)visitor).visitArrayCreator(this);
			else return visitor.visitChildren(this);
		}
	}

	public final ArrayCreatorContext arrayCreator() throws RecognitionException {
		ArrayCreatorContext _localctx = new ArrayCreatorContext(_ctx, getState());
		enterRule(_localctx, 44, RULE_arrayCreator);
		int _la;
		try {
			int _alt;
			enterOuterAlt(_localctx, 1);
			{
			setState(294);
			_errHandler.sync(this);
			_alt = getInterpreter().adaptivePredict(_input,29,_ctx);
			while ( _alt!=2 && _alt!=org.antlr.v4.runtime.atn.ATN.INVALID_ALT_NUMBER ) {
				if ( _alt==1 ) {
					{
					{
					setState(287);
					match(T__9);
					setState(289);
					_errHandler.sync(this);
					_la = _input.LA(1);
					if ((((_la) & ~0x3f) == 0 && ((1L << _la) & ((1L << T__4) | (1L << T__23) | (1L << T__24) | (1L << T__25) | (1L << T__26) | (1L << T__27) | (1L << T__28) | (1L << T__29) | (1L << T__46) | (1L << Int) | (1L << String) | (1L << Bool) | (1L << Null) | (1L << Identifier))) != 0)) {
						{
						setState(288);
						expression(0);
						}
					}

					setState(291);
					match(T__10);
					}
					} 
				}
				setState(296);
				_errHandler.sync(this);
				_alt = getInterpreter().adaptivePredict(_input,29,_ctx);
			}
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class PrimaryExpressionContext extends ParserRuleContext {
		public ExpressionContext expression() {
			return getRuleContext(ExpressionContext.class,0);
		}
		public LiteralExpressionContext literalExpression() {
			return getRuleContext(LiteralExpressionContext.class,0);
		}
		public TerminalNode Identifier() { return getToken(MstarParser.Identifier, 0); }
		public PrimaryExpressionContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_primaryExpression; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof MstarListener ) ((MstarListener)listener).enterPrimaryExpression(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof MstarListener ) ((MstarListener)listener).exitPrimaryExpression(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof MstarVisitor ) return ((MstarVisitor<? extends T>)visitor).visitPrimaryExpression(this);
			else return visitor.visitChildren(this);
		}
	}

	public final PrimaryExpressionContext primaryExpression() throws RecognitionException {
		PrimaryExpressionContext _localctx = new PrimaryExpressionContext(_ctx, getState());
		enterRule(_localctx, 46, RULE_primaryExpression);
		try {
			setState(304);
			_errHandler.sync(this);
			switch (_input.LA(1)) {
			case T__4:
				enterOuterAlt(_localctx, 1);
				{
				setState(297);
				match(T__4);
				setState(298);
				expression(0);
				setState(299);
				match(T__5);
				}
				break;
			case T__46:
				enterOuterAlt(_localctx, 2);
				{
				setState(301);
				match(T__46);
				}
				break;
			case Int:
			case String:
			case Bool:
			case Null:
				enterOuterAlt(_localctx, 3);
				{
				setState(302);
				literalExpression();
				}
				break;
			case Identifier:
				enterOuterAlt(_localctx, 4);
				{
				setState(303);
				match(Identifier);
				}
				break;
			default:
				throw new NoViableAltException(this);
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class LiteralExpressionContext extends ParserRuleContext {
		public TerminalNode Int() { return getToken(MstarParser.Int, 0); }
		public TerminalNode String() { return getToken(MstarParser.String, 0); }
		public TerminalNode Bool() { return getToken(MstarParser.Bool, 0); }
		public TerminalNode Null() { return getToken(MstarParser.Null, 0); }
		public LiteralExpressionContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_literalExpression; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof MstarListener ) ((MstarListener)listener).enterLiteralExpression(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof MstarListener ) ((MstarListener)listener).exitLiteralExpression(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof MstarVisitor ) return ((MstarVisitor<? extends T>)visitor).visitLiteralExpression(this);
			else return visitor.visitChildren(this);
		}
	}

	public final LiteralExpressionContext literalExpression() throws RecognitionException {
		LiteralExpressionContext _localctx = new LiteralExpressionContext(_ctx, getState());
		enterRule(_localctx, 48, RULE_literalExpression);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(306);
			_la = _input.LA(1);
			if ( !((((_la) & ~0x3f) == 0 && ((1L << _la) & ((1L << Int) | (1L << String) | (1L << Bool) | (1L << Null))) != 0)) ) {
			_errHandler.recoverInline(this);
			}
			else {
				if ( _input.LA(1)==Token.EOF ) matchedEOF = true;
				_errHandler.reportMatch(this);
				consume();
			}
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public boolean sempred(RuleContext _localctx, int ruleIndex, int predIndex) {
		switch (ruleIndex) {
		case 19:
			return expression_sempred((ExpressionContext)_localctx, predIndex);
		}
		return true;
	}
	private boolean expression_sempred(ExpressionContext _localctx, int predIndex) {
		switch (predIndex) {
		case 0:
			return precpred(_ctx, 11);
		case 1:
			return precpred(_ctx, 10);
		case 2:
			return precpred(_ctx, 9);
		case 3:
			return precpred(_ctx, 8);
		case 4:
			return precpred(_ctx, 7);
		case 5:
			return precpred(_ctx, 6);
		case 6:
			return precpred(_ctx, 5);
		case 7:
			return precpred(_ctx, 4);
		case 8:
			return precpred(_ctx, 3);
		case 9:
			return precpred(_ctx, 2);
		case 10:
			return precpred(_ctx, 1);
		case 11:
			return precpred(_ctx, 18);
		case 12:
			return precpred(_ctx, 17);
		case 13:
			return precpred(_ctx, 16);
		case 14:
			return precpred(_ctx, 14);
		}
		return true;
	}

	public static final String _serializedATN =
		"\3\u608b\ua72a\u8133\ub9ed\u417c\u3be7\u7786\u5964\3<\u0137\4\2\t\2\4"+
		"\3\t\3\4\4\t\4\4\5\t\5\4\6\t\6\4\7\t\7\4\b\t\b\4\t\t\t\4\n\t\n\4\13\t"+
		"\13\4\f\t\f\4\r\t\r\4\16\t\16\4\17\t\17\4\20\t\20\4\21\t\21\4\22\t\22"+
		"\4\23\t\23\4\24\t\24\4\25\t\25\4\26\t\26\4\27\t\27\4\30\t\30\4\31\t\31"+
		"\4\32\t\32\3\2\7\2\66\n\2\f\2\16\29\13\2\3\2\3\2\3\3\3\3\3\3\5\3@\n\3"+
		"\3\4\3\4\3\4\3\4\7\4F\n\4\f\4\16\4I\13\4\3\4\3\4\3\5\3\5\3\5\5\5P\n\5"+
		"\3\6\3\6\5\6T\n\6\3\6\3\6\3\6\5\6Y\n\6\3\6\3\6\3\6\3\7\3\7\3\7\5\7a\n"+
		"\7\3\7\3\7\3\7\3\b\3\b\3\b\7\bi\n\b\f\b\16\bl\13\b\3\t\3\t\3\t\3\t\5\t"+
		"r\n\t\3\n\3\n\3\n\3\n\3\13\3\13\3\13\7\13{\n\13\f\13\16\13~\13\13\3\f"+
		"\3\f\3\f\5\f\u0083\n\f\3\r\3\r\3\r\7\r\u0088\n\r\f\r\16\r\u008b\13\r\3"+
		"\16\3\16\5\16\u008f\n\16\3\17\3\17\3\20\3\20\3\21\3\21\7\21\u0097\n\21"+
		"\f\21\16\21\u009a\13\21\3\21\3\21\3\22\3\22\5\22\u00a0\n\22\3\23\3\23"+
		"\3\23\3\23\3\23\3\23\3\23\3\23\5\23\u00aa\n\23\3\23\3\23\3\23\5\23\u00af"+
		"\n\23\3\23\3\23\5\23\u00b3\n\23\3\23\3\23\5\23\u00b7\n\23\3\23\3\23\3"+
		"\23\3\23\3\23\3\23\3\23\3\23\3\23\3\23\5\23\u00c3\n\23\3\23\3\23\3\23"+
		"\3\23\3\23\3\23\3\23\3\23\5\23\u00cd\n\23\3\24\3\24\3\24\7\24\u00d2\n"+
		"\24\f\24\16\24\u00d5\13\24\3\25\3\25\3\25\3\25\3\25\3\25\3\25\3\25\5\25"+
		"\u00df\n\25\3\25\3\25\3\25\3\25\3\25\3\25\3\25\3\25\3\25\3\25\3\25\3\25"+
		"\3\25\3\25\3\25\3\25\3\25\3\25\3\25\3\25\3\25\3\25\3\25\3\25\3\25\3\25"+
		"\3\25\3\25\3\25\3\25\3\25\3\25\3\25\3\25\3\25\3\25\3\25\3\25\3\25\3\25"+
		"\3\25\3\25\3\25\3\25\5\25\u010d\n\25\3\25\3\25\3\25\7\25\u0112\n\25\f"+
		"\25\16\25\u0115\13\25\3\26\3\26\3\26\5\26\u011a\n\26\3\27\3\27\5\27\u011e"+
		"\n\27\3\27\3\27\3\30\3\30\5\30\u0124\n\30\3\30\7\30\u0127\n\30\f\30\16"+
		"\30\u012a\13\30\3\31\3\31\3\31\3\31\3\31\3\31\3\31\5\31\u0133\n\31\3\32"+
		"\3\32\3\32\2\3(\33\2\4\6\b\n\f\16\20\22\24\26\30\32\34\36 \"$&(*,.\60"+
		"\62\2\f\3\2\16\21\3\2\33\36\3\2\37 \3\2!#\3\2\35\36\3\2$%\3\2&)\3\2*+"+
		"\3\2\33\34\3\2\62\65\2\u0155\2\67\3\2\2\2\4?\3\2\2\2\6A\3\2\2\2\bO\3\2"+
		"\2\2\nS\3\2\2\2\f]\3\2\2\2\16e\3\2\2\2\20m\3\2\2\2\22s\3\2\2\2\24w\3\2"+
		"\2\2\26\177\3\2\2\2\30\u0084\3\2\2\2\32\u008e\3\2\2\2\34\u0090\3\2\2\2"+
		"\36\u0092\3\2\2\2 \u0094\3\2\2\2\"\u009f\3\2\2\2$\u00cc\3\2\2\2&\u00ce"+
		"\3\2\2\2(\u00de\3\2\2\2*\u0116\3\2\2\2,\u011b\3\2\2\2.\u0128\3\2\2\2\60"+
		"\u0132\3\2\2\2\62\u0134\3\2\2\2\64\66\5\4\3\2\65\64\3\2\2\2\669\3\2\2"+
		"\2\67\65\3\2\2\2\678\3\2\2\28:\3\2\2\29\67\3\2\2\2:;\7\2\2\3;\3\3\2\2"+
		"\2<@\5\6\4\2=@\5\n\6\2>@\5\22\n\2?<\3\2\2\2?=\3\2\2\2?>\3\2\2\2@\5\3\2"+
		"\2\2AB\7\3\2\2BC\7\66\2\2CG\7\4\2\2DF\5\b\5\2ED\3\2\2\2FI\3\2\2\2GE\3"+
		"\2\2\2GH\3\2\2\2HJ\3\2\2\2IG\3\2\2\2JK\7\5\2\2K\7\3\2\2\2LP\5\n\6\2MP"+
		"\5\22\n\2NP\5\f\7\2OL\3\2\2\2OM\3\2\2\2ON\3\2\2\2P\t\3\2\2\2QT\5\30\r"+
		"\2RT\7\6\2\2SQ\3\2\2\2SR\3\2\2\2TU\3\2\2\2UV\7\66\2\2VX\7\7\2\2WY\5\16"+
		"\b\2XW\3\2\2\2XY\3\2\2\2YZ\3\2\2\2Z[\7\b\2\2[\\\5 \21\2\\\13\3\2\2\2]"+
		"^\7\66\2\2^`\7\7\2\2_a\5\16\b\2`_\3\2\2\2`a\3\2\2\2ab\3\2\2\2bc\7\b\2"+
		"\2cd\5 \21\2d\r\3\2\2\2ej\5\20\t\2fg\7\t\2\2gi\5\20\t\2hf\3\2\2\2il\3"+
		"\2\2\2jh\3\2\2\2jk\3\2\2\2k\17\3\2\2\2lj\3\2\2\2mn\5\30\r\2nq\7\66\2\2"+
		"op\7\n\2\2pr\5(\25\2qo\3\2\2\2qr\3\2\2\2r\21\3\2\2\2st\5\30\r\2tu\5\24"+
		"\13\2uv\7\13\2\2v\23\3\2\2\2w|\5\26\f\2xy\7\t\2\2y{\5\26\f\2zx\3\2\2\2"+
		"{~\3\2\2\2|z\3\2\2\2|}\3\2\2\2}\25\3\2\2\2~|\3\2\2\2\177\u0082\7\66\2"+
		"\2\u0080\u0081\7\n\2\2\u0081\u0083\5(\25\2\u0082\u0080\3\2\2\2\u0082\u0083"+
		"\3\2\2\2\u0083\27\3\2\2\2\u0084\u0089\5\32\16\2\u0085\u0086\7\f\2\2\u0086"+
		"\u0088\7\r\2\2\u0087\u0085\3\2\2\2\u0088\u008b\3\2\2\2\u0089\u0087\3\2"+
		"\2\2\u0089\u008a\3\2\2\2\u008a\31\3\2\2\2\u008b\u0089\3\2\2\2\u008c\u008f"+
		"\5\34\17\2\u008d\u008f\5\36\20\2\u008e\u008c\3\2\2\2\u008e\u008d\3\2\2"+
		"\2\u008f\33\3\2\2\2\u0090\u0091\t\2\2\2\u0091\35\3\2\2\2\u0092\u0093\7"+
		"\66\2\2\u0093\37\3\2\2\2\u0094\u0098\7\4\2\2\u0095\u0097\5\"\22\2\u0096"+
		"\u0095\3\2\2\2\u0097\u009a\3\2\2\2\u0098\u0096\3\2\2\2\u0098\u0099\3\2"+
		"\2\2\u0099\u009b\3\2\2\2\u009a\u0098\3\2\2\2\u009b\u009c\7\5\2\2\u009c"+
		"!\3\2\2\2\u009d\u00a0\5$\23\2\u009e\u00a0\5\22\n\2\u009f\u009d\3\2\2\2"+
		"\u009f\u009e\3\2\2\2\u00a0#\3\2\2\2\u00a1\u00cd\5 \21\2\u00a2\u00a3\7"+
		"\22\2\2\u00a3\u00a4\7\7\2\2\u00a4\u00a5\5(\25\2\u00a5\u00a6\7\b\2\2\u00a6"+
		"\u00a9\5$\23\2\u00a7\u00a8\7\23\2\2\u00a8\u00aa\5$\23\2\u00a9\u00a7\3"+
		"\2\2\2\u00a9\u00aa\3\2\2\2\u00aa\u00cd\3\2\2\2\u00ab\u00ac\7\24\2\2\u00ac"+
		"\u00ae\7\7\2\2\u00ad\u00af\5&\24\2\u00ae\u00ad\3\2\2\2\u00ae\u00af\3\2"+
		"\2\2\u00af\u00b0\3\2\2\2\u00b0\u00b2\7\13\2\2\u00b1\u00b3\5(\25\2\u00b2"+
		"\u00b1\3\2\2\2\u00b2\u00b3\3\2\2\2\u00b3\u00b4\3\2\2\2\u00b4\u00b6\7\13"+
		"\2\2\u00b5\u00b7\5&\24\2\u00b6\u00b5\3\2\2\2\u00b6\u00b7\3\2\2\2\u00b7"+
		"\u00b8\3\2\2\2\u00b8\u00b9\7\b\2\2\u00b9\u00cd\5$\23\2\u00ba\u00bb\7\25"+
		"\2\2\u00bb\u00bc\7\7\2\2\u00bc\u00bd\5(\25\2\u00bd\u00be\7\b\2\2\u00be"+
		"\u00bf\5$\23\2\u00bf\u00cd\3\2\2\2\u00c0\u00c2\7\26\2\2\u00c1\u00c3\5"+
		"(\25\2\u00c2\u00c1\3\2\2\2\u00c2\u00c3\3\2\2\2\u00c3\u00c4\3\2\2\2\u00c4"+
		"\u00cd\7\13\2\2\u00c5\u00c6\7\27\2\2\u00c6\u00cd\7\13\2\2\u00c7\u00c8"+
		"\7\30\2\2\u00c8\u00cd\7\13\2\2\u00c9\u00ca\5(\25\2\u00ca\u00cb\7\13\2"+
		"\2\u00cb\u00cd\3\2\2\2\u00cc\u00a1\3\2\2\2\u00cc\u00a2\3\2\2\2\u00cc\u00ab"+
		"\3\2\2\2\u00cc\u00ba\3\2\2\2\u00cc\u00c0\3\2\2\2\u00cc\u00c5\3\2\2\2\u00cc"+
		"\u00c7\3\2\2\2\u00cc\u00c9\3\2\2\2\u00cd%\3\2\2\2\u00ce\u00d3\5(\25\2"+
		"\u00cf\u00d0\7\t\2\2\u00d0\u00d2\5(\25\2\u00d1\u00cf\3\2\2\2\u00d2\u00d5"+
		"\3\2\2\2\u00d3\u00d1\3\2\2\2\u00d3\u00d4\3\2\2\2\u00d4\'\3\2\2\2\u00d5"+
		"\u00d3\3\2\2\2\u00d6\u00d7\b\25\1\2\u00d7\u00df\5\60\31\2\u00d8\u00d9"+
		"\7\32\2\2\u00d9\u00df\5*\26\2\u00da\u00db\t\3\2\2\u00db\u00df\5(\25\17"+
		"\u00dc\u00dd\t\4\2\2\u00dd\u00df\5(\25\16\u00de\u00d6\3\2\2\2\u00de\u00d8"+
		"\3\2\2\2\u00de\u00da\3\2\2\2\u00de\u00dc\3\2\2\2\u00df\u0113\3\2\2\2\u00e0"+
		"\u00e1\f\r\2\2\u00e1\u00e2\t\5\2\2\u00e2\u0112\5(\25\16\u00e3\u00e4\f"+
		"\f\2\2\u00e4\u00e5\t\6\2\2\u00e5\u0112\5(\25\r\u00e6\u00e7\f\13\2\2\u00e7"+
		"\u00e8\t\7\2\2\u00e8\u0112\5(\25\f\u00e9\u00ea\f\n\2\2\u00ea\u00eb\t\b"+
		"\2\2\u00eb\u0112\5(\25\13\u00ec\u00ed\f\t\2\2\u00ed\u00ee\t\t\2\2\u00ee"+
		"\u0112\5(\25\n\u00ef\u00f0\f\b\2\2\u00f0\u00f1\7,\2\2\u00f1\u0112\5(\25"+
		"\t\u00f2\u00f3\f\7\2\2\u00f3\u00f4\7-\2\2\u00f4\u0112\5(\25\b\u00f5\u00f6"+
		"\f\6\2\2\u00f6\u00f7\7.\2\2\u00f7\u0112\5(\25\7\u00f8\u00f9\f\5\2\2\u00f9"+
		"\u00fa\7/\2\2\u00fa\u0112\5(\25\6\u00fb\u00fc\f\4\2\2\u00fc\u00fd\7\60"+
		"\2\2\u00fd\u0112\5(\25\5\u00fe\u00ff\f\3\2\2\u00ff\u0100\7\n\2\2\u0100"+
		"\u0112\5(\25\3\u0101\u0102\f\24\2\2\u0102\u0103\7\31\2\2\u0103\u0112\7"+
		"\66\2\2\u0104\u0105\f\23\2\2\u0105\u0106\7\f\2\2\u0106\u0107\5(\25\2\u0107"+
		"\u0108\7\r\2\2\u0108\u0112\3\2\2\2\u0109\u010a\f\22\2\2\u010a\u010c\7"+
		"\7\2\2\u010b\u010d\5&\24\2\u010c\u010b\3\2\2\2\u010c\u010d\3\2\2\2\u010d"+
		"\u010e\3\2\2\2\u010e\u0112\7\b\2\2\u010f\u0110\f\20\2\2\u0110\u0112\t"+
		"\n\2\2\u0111\u00e0\3\2\2\2\u0111\u00e3\3\2\2\2\u0111\u00e6\3\2\2\2\u0111"+
		"\u00e9\3\2\2\2\u0111\u00ec\3\2\2\2\u0111\u00ef\3\2\2\2\u0111\u00f2\3\2"+
		"\2\2\u0111\u00f5\3\2\2\2\u0111\u00f8\3\2\2\2\u0111\u00fb\3\2\2\2\u0111"+
		"\u00fe\3\2\2\2\u0111\u0101\3\2\2\2\u0111\u0104\3\2\2\2\u0111\u0109\3\2"+
		"\2\2\u0111\u010f\3\2\2\2\u0112\u0115\3\2\2\2\u0113\u0111\3\2\2\2\u0113"+
		"\u0114\3\2\2\2\u0114)\3\2\2\2\u0115\u0113\3\2\2\2\u0116\u0119\5\32\16"+
		"\2\u0117\u011a\5,\27\2\u0118\u011a\5.\30\2\u0119\u0117\3\2\2\2\u0119\u0118"+
		"\3\2\2\2\u011a+\3\2\2\2\u011b\u011d\7\7\2\2\u011c\u011e\5&\24\2\u011d"+
		"\u011c\3\2\2\2\u011d\u011e\3\2\2\2\u011e\u011f\3\2\2\2\u011f\u0120\7\b"+
		"\2\2\u0120-\3\2\2\2\u0121\u0123\7\f\2\2\u0122\u0124\5(\25\2\u0123\u0122"+
		"\3\2\2\2\u0123\u0124\3\2\2\2\u0124\u0125\3\2\2\2\u0125\u0127\7\r\2\2\u0126"+
		"\u0121\3\2\2\2\u0127\u012a\3\2\2\2\u0128\u0126\3\2\2\2\u0128\u0129\3\2"+
		"\2\2\u0129/\3\2\2\2\u012a\u0128\3\2\2\2\u012b\u012c\7\7\2\2\u012c\u012d"+
		"\5(\25\2\u012d\u012e\7\b\2\2\u012e\u0133\3\2\2\2\u012f\u0133\7\61\2\2"+
		"\u0130\u0133\5\62\32\2\u0131\u0133\7\66\2\2\u0132\u012b\3\2\2\2\u0132"+
		"\u012f\3\2\2\2\u0132\u0130\3\2\2\2\u0132\u0131\3\2\2\2\u0133\61\3\2\2"+
		"\2\u0134\u0135\t\13\2\2\u0135\63\3\2\2\2!\67?GOSX`jq|\u0082\u0089\u008e"+
		"\u0098\u009f\u00a9\u00ae\u00b2\u00b6\u00c2\u00cc\u00d3\u00de\u010c\u0111"+
		"\u0113\u0119\u011d\u0123\u0128\u0132";
	public static final ATN _ATN =
		new ATNDeserializer().deserialize(_serializedATN.toCharArray());
	static {
		_decisionToDFA = new DFA[_ATN.getNumberOfDecisions()];
		for (int i = 0; i < _ATN.getNumberOfDecisions(); i++) {
			_decisionToDFA[i] = new DFA(_ATN.getDecisionState(i), i);
		}
	}
}