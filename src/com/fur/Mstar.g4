grammar Mstar;

compilationUnit : programDeclaration* EOF ;

programDeclaration :
    classDeclaration
  | functionDeclaration
  | variableDeclarationStatement
;

classDeclaration : 'class' Identifier '{' classBodyDeclaration* '}' ;

classBodyDeclaration :
    functionDeclaration
  | variableDeclarationStatement
;

functionDeclaration :
    ( type | 'void' )? Identifier LeftParanthesis parameters? RightParanthesis block
;

parameters : parameter ( ',' parameter )* ;
parameter : type Identifier ( '=' expression )? ;

variableDeclarationStatement : type variableDeclarations ';' ;
variableDeclarations : variableDeclaration ( ',' variableDeclaration )* ;
variableDeclaration : Identifier ( '=' expression )? ;

type : nonArrayType ( LeftBracket RightBracket )* ;
nonArrayType : primitiveType | classType ;

primitiveType:
    Bool
  | Int
  | Str
;

classType : Identifier ;

block: '{' blockStatement* '}' ;

blockStatement :
    statement
  | variableDeclarationStatement
;

statement :
    block
  | 'if' LeftParanthesis expression RightParanthesis statement ('else' statement)?
  | 'for' LeftParanthesis expressions? ';' expression? ';' expressions? RightParanthesis statement
  | 'while' LeftParanthesis expression RightParanthesis statement
  | 'return' expression? ';'
  | 'break' ';'
  | 'continue' ';'
  | expression ';'
;

creator : nonArrayType ( arrayCreator+ | classCreator )? ;
arrayCreator : LeftBracket expression? RightBracket ;
classCreator : LeftParanthesis expressions? RightParanthesis ;

expressions : expression ( ',' expression )* ;
expression:
    primaryExpression
  | expression '.' Identifier
  | expression LeftBracket expression RightBracket
  | expression LeftParanthesis expressions? RightParanthesis
  | expression ('++' | '--')
  | 'new' creator
  | ('+'|'-'|'++'|'--') expression
  | ('~'|'!') expression
  | expression ('*'|'/'|'%') expression
  | expression ('+'|'-') expression
  | expression ('<<' | '>>') expression
  | expression ('<=' | '>=' | '>' | '<') expression
  | expression ('==' | '!=') expression
  | expression '&' expression
  | expression '^' expression
  | expression '|' expression
  | expression '&&' expression
  | expression '||' expression
  | <assoc=right> expression '=' expression
;

primaryExpression :
    LeftParanthesis expression RightParanthesis
  | 'this'
  | literalExpression
  | Identifier
;

literalExpression :
    Integer
  | String
  | Boolean
  | Null
;

Integer : Digit+ ;
String : '"' ( EscapeCharacter | ~( '"' | '\\' ) )* '"' ;
Boolean : 'true' | 'false' ;
Null : 'null' ;

LeftBracket : '[' ;
RightBracket : ']' ;
LeftParanthesis : '(' ;
RightParanthesis : ')' ;

Bool : 'bool' ;
Int : 'int' ;
Str : 'string' ;

Identifier : Letter ( Letter | Digit )* ;

Letter : [a-zA-Z_] ;
Digit : [0-9] ;
EscapeCharacter : '\\' ( 'n' | '"' | '\\' ) ;

NEWLINE : ( '\r' ? '\n' )+ -> skip ;
WS : [ \t\r\n]+ -> skip ;
LINE_COMMENT : '//' ~[\r\n]* -> skip ;