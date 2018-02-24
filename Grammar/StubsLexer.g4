//
//  StubsLexer.g4
//  StubsGrammar
//
//  Created by Patrick Remy on 11.12.17.
//

lexer grammar StubsLexer;

options {
  language = Swift;
}

fragment Digit: [0-9];
fragment NonzeroDigit: [1-9];
fragment Letter: [a-zA-Z];

Ws: (' '|'\t'|'\r'|'\n')+ -> channel(HIDDEN);
Newline: '\r'?'\n' -> skip;
MultilineComment: '/*' .*? '*/' -> skip;
SingleLineComment: '//' ~[\r\n]* -> skip;

// Literals
IntegerLiteral: (NonzeroDigit Digit* | '0');
DoubleLiteral: Digit+ '.' Digit+;
StringLiteral: '"' .*? '"';
BooleanLiteral: 'true' | 'false';

// Keywords
Array: 'Array';
Var: 'var';
NativeType: 'Int' | 'Double' | 'String' | 'Boolean';
If: 'if';
Else: 'else';
While: 'while';
Def: 'def';
Return: 'return';
Object: 'object';

// Operators
Plus: '+';
Minus: '-';
Mult: '*';
Divide: '/';
Modulo: '%';
Equal: '==';
Less: '<';
Greater: '>';
LessOrEqual: '<=';
GreaterOrEqual: '>=';
NotEqual: '!=';
And: '&&';
Or: '||';
Not: '!';
Assign: '=';

// Symbols
ParenOpen: '(';
ParenClose: ')';
BracketOpen: '[';
BracketClose: ']';
CurlyBracketOpen: '{';
CurlyBracketClose: '}';
Seperator: ',';
Colon: ':';
Semicolon: ';';

Identifier: Letter (Letter|Digit|'_')*;
