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
    type? Identifier '(' parameters? ')' blockStatement
;

parameters : parameter ( ',' parameter )* ;
parameter : type Identifier ( '=' expression )? ;

variableDeclarationStatement : type variableDeclarations ';' ;
variableDeclarations : variableDeclaration ( ',' variableDeclaration )* ;
variableDeclaration : Identifier ( '=' expression )? ;

type :
    type Op = '[' ']'
  | nonArrayType
;

nonArrayType : primitiveType | classType ;

primitiveType:
    'bool'
  | 'int'
  | 'string'
  | 'void'
;

classType : Identifier ;

blockStatement: '{' statement* '}' ;

statement :
    blockStatement
  | Op = 'if' '(' expression ')' statement ('else' statement)?
  | Op = 'for' '(' expressions? ';' expression? ';' expressions? ')' statement
  | Op = 'while' '(' expression ')' statement
  | Op = 'return' expression? ';'
  | Op = 'break' ';'
  | Op = 'continue' ';'
  | expression Op = ';'
  | variableDeclarationStatement
;

creator : nonArrayType ( arrayCreator | classCreator )? ;
arrayCreator : ( '[' expression ']' )+ ( '[]' empty )* ;
classCreator : Op = '(' expressions? ')' ;

expressions : expression ( ',' expression )* ;
expression:
    primaryExpression
  | expression Op = '.' Identifier
  | expression Op = '[' expression ']'
  | expression Op = '(' expressions? ')'
  | expression Op = ('++' | '--')
  | Op = 'new' creator
  | Op = ('+'|'-'|'++'|'--') expression
  | Op = ('~'|'!') expression
  | expression Op = ('*'|'/'|'%') expression
  | expression Op = ('+'|'-') expression
  | expression Op = ('<<' | '>>') expression
  | expression Op = ('<=' | '>=' | '>' | '<') expression
  | expression Op = ('==' | '!=') expression
  | expression Op = '&' expression
  | expression Op = '^' expression
  | expression Op = '|' expression
  | expression Op = '&&' expression
  | expression Op = '||' expression
  | <assoc=right> expression Op = '=' expression
;

primaryExpression :
    '(' expression ')'
  | This
  | literalExpression
  | Identifier
;

literalExpression :
    Integer
  | String
  | Boolean
  | Null
;

empty :;

Integer : Digit+ ;
String : '"' ( EscapeCharacter | ~( '"' | '\\' ) )* '"' ;
Boolean : 'true' | 'false' ;
This : 'this' ;
Null : 'null' ;

Identifier : Letter ( Letter | Digit )* ;

Letter : [a-zA-Z_] ;
Digit : [0-9] ;
EscapeCharacter : '\\' ( 'n' | '"' | '\\' ) ;

NEWLINE : ( '\r' ? '\n' )+ -> skip ;
WS : [ \t\r\n]+ -> skip ;
LINE_COMMENT : '//' ~[\r\n]* -> skip ;