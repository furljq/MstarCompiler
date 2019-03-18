grammar Mstar;

complicationUnit : programDeclaration* EOF ;

programDeclaration :
    classDeclaration
  | functionDeclaration
  | variableDeclarationStatement
;

classDeclaration : 'class' Identifier '{' classBodyDeclaration* '}' ;

classBodyDeclaration :
    functionDeclaration
  | variableDeclarationStatement
  | constructorDeclaration
;

functionDeclaration :
    ( type | 'void' ) Identifier '(' parameters? ')' block
;

constructorDeclaration : Identifier '(' parameters? ')' block ;
parameters : parameter ( ',' parameter )* ;
parameter : type Identifier ( '=' expression )? ;

variableDeclarationStatement : type variableDeclarations ';' ;
variableDeclarations : variableDeclaration ( ',' variableDeclaration )* ;
variableDeclaration : Identifier ( '=' expression )? ;

type : ( primitiveType | classType ) ( '[' ']' )* ;

primitiveType:
    'bool'
  | 'int'
  | 'double'
  | 'string'
;

classType : Identifier ;

block: '{' blockStatement* '}' ;

blockStatement :
    statement
  | variableDeclarationStatement
;

statement :
    block
  | 'if' '(' expression ')' statement ('else' statement)?
  | 'for' '(' expressions? ';' expression? ';' expressions? ')' statement
  | 'while' '(' expression ')' statement
  | 'return' expression? ';'
  | 'break' ';'
  | 'continue' ';'
  | expression ';'
;

expressions : expression ( ',' expression )* ;
expression:
    primaryExpression
  | expression '.' Identifier
  | expression '[' expression ']'
  | expression '(' expressions? ')'
  | expression ('++' | '--')
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
    '(' expression ')'
  | 'this'
  | literalExpression
  | Identifier
;

literalExpression :
    Int
  | String
  | Bool
  | Null
;

Int : Digit+ ;
String : '"' ( EscapeCharacter | ~( '"' | '\\' ) )* '"' ;
Bool : 'true' | 'false' ;
Null : 'null' ;

Identifier : Letter ( Letter | Digit )* ;

Letter : [a-zA-Z_] ;
Digit : [0-9] ;
EscapeCharacter : '\\' ( 'n' | '"' | '\\' ) ;

NEWLINE : ( '\r' ? '\n' )+ -> skip ;
WS : [ \t\r\n]+ -> skip ;
LINE_COMMENT : '//' ~[\r\n]* -> skip ;