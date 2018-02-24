//
//  StubsParser.g4
//  StubsGrammar
//
//  Created by Patrick Remy on 11.12.17.
//

parser grammar StubsParser;

options {
  tokenVocab = StubsLexer;
  language = Swift;
}

program: objectDeclaration? EOF;

// Objects
objectDeclaration: Object objectIdentifier objectBody;
objectBody: CurlyBracketOpen variableDeclaration* functionDeclaration* CurlyBracketClose;
objectIdentifier: Identifier;

// Variables
datatype: NativeType | Array BracketOpen NativeType BracketClose;
variableDeclaration: Var variableIdentifier Colon datatype Assign expression Semicolon;
variableAssignment: variableIdentifier (ParenOpen additiveExpression ParenClose)? Assign expression Semicolon;
variableIdentifier: Identifier;
// arrayExpression: variableIdentifier ParenOpen additiveExpression ParenClose;
// array expressions are realised via function calls

// Functions
functionDeclaration: Def functionIdentifier ParenOpen functionDeclarationArgumentList? ParenClose (Colon datatype)? Assign functionBody;
functionDeclarationArgumentList: variableIdentifier Colon datatype (Seperator variableIdentifier Colon datatype)*;
functionBody: CurlyBracketOpen variableDeclaration* statement* CurlyBracketClose;
functionCall: functionIdentifier ParenOpen (expression (Seperator expression)*)? ParenClose;
functionIdentifier: Identifier;

// Statements
statement: blockStatement | variableAssignment | ifStatement | whileStatement | returnStatement | expression Semicolon;
blockStatement: CurlyBracketOpen statement* CurlyBracketClose;
ifStatement: If ParenOpen expression ParenClose statement (Else statement)?;
whileStatement: While ParenOpen expression ParenClose statement;
returnStatement: Return expression? Semicolon;

// Expressions
expression: orExpression;
orExpression: orExpression Or andExpression | andExpression;
andExpression: andExpression And equalExpression | equalExpression;
equalExpression: equalExpression (NotEqual | Equal) relationalExpression | relationalExpression;
relationalExpression: relationalExpression (Less | Greater | LessOrEqual | GreaterOrEqual) additiveExpression | additiveExpression;
additiveExpression: additiveExpression (Plus | Minus) multiplicativeExpression | multiplicativeExpression;
multiplicativeExpression: multiplicativeExpression (Mult | Divide | Modulo) unaryExpression | unaryExpression;
unaryExpression: (Not | Plus | Minus)? primaryExpression;
primaryExpression: literal | variableIdentifier /*| arrayExpression*/ | functionCall | ParenOpen expression ParenClose;

// Literals and types
literal: primitive | array;
primitive: IntegerLiteral | DoubleLiteral | StringLiteral | BooleanLiteral;
array: Array ParenOpen (expression Seperator)* expression ParenClose;
