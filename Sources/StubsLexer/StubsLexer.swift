// Generated from StubsLexer.g4 by ANTLR 4.7.1
import Antlr4

open class StubsLexer: Lexer {

	internal static var _decisionToDFA: [DFA] = {
          var decisionToDFA = [DFA]()
          let length = StubsLexer._ATN.getNumberOfDecisions()
          for i in 0..<length {
          	    decisionToDFA.append(DFA(StubsLexer._ATN.getDecisionState(i)!, i))
          }
           return decisionToDFA
     }()

	internal static let _sharedContextCache = PredictionContextCache()

	public
	static let Ws=1, Newline=2, MultilineComment=3, SingleLineComment=4, IntegerLiteral=5, 
            DoubleLiteral=6, StringLiteral=7, BooleanLiteral=8, Array=9, 
            Var=10, NativeType=11, If=12, Else=13, While=14, Def=15, Return=16, 
            Object=17, Plus=18, Minus=19, Mult=20, Divide=21, Modulo=22, 
            Equal=23, Less=24, Greater=25, LessOrEqual=26, GreaterOrEqual=27, 
            NotEqual=28, And=29, Or=30, Not=31, Assign=32, ParenOpen=33, 
            ParenClose=34, BracketOpen=35, BracketClose=36, CurlyBracketOpen=37, 
            CurlyBracketClose=38, Seperator=39, Colon=40, Semicolon=41, 
            Identifier=42

	public
	static let channelNames: [String] = [
		"DEFAULT_TOKEN_CHANNEL", "HIDDEN"
	]

	public
	static let modeNames: [String] = [
		"DEFAULT_MODE"
	]

	public
	static let ruleNames: [String] = [
		"Digit", "NonzeroDigit", "Letter", "Ws", "Newline", "MultilineComment", 
		"SingleLineComment", "IntegerLiteral", "DoubleLiteral", "StringLiteral", 
		"BooleanLiteral", "Array", "Var", "NativeType", "If", "Else", "While", 
		"Def", "Return", "Object", "Plus", "Minus", "Mult", "Divide", "Modulo", 
		"Equal", "Less", "Greater", "LessOrEqual", "GreaterOrEqual", "NotEqual", 
		"And", "Or", "Not", "Assign", "ParenOpen", "ParenClose", "BracketOpen", 
		"BracketClose", "CurlyBracketOpen", "CurlyBracketClose", "Seperator", 
		"Colon", "Semicolon", "Identifier"
	]

	private static let _LITERAL_NAMES: [String?] = [
		nil, nil, nil, nil, nil, nil, nil, nil, nil, "'Array'", "'var'", nil, 
		"'if'", "'else'", "'while'", "'def'", "'return'", "'object'", "'+'", "'-'", 
		"'*'", "'/'", "'%'", "'=='", "'<'", "'>'", "'<='", "'>='", "'!='", "'&&'", 
		"'||'", "'!'", "'='", "'('", "')'", "'['", "']'", "'{'", "'}'", "','", 
		"':'", "';'"
	]
	private static let _SYMBOLIC_NAMES: [String?] = [
		nil, "Ws", "Newline", "MultilineComment", "SingleLineComment", "IntegerLiteral", 
		"DoubleLiteral", "StringLiteral", "BooleanLiteral", "Array", "Var", "NativeType", 
		"If", "Else", "While", "Def", "Return", "Object", "Plus", "Minus", "Mult", 
		"Divide", "Modulo", "Equal", "Less", "Greater", "LessOrEqual", "GreaterOrEqual", 
		"NotEqual", "And", "Or", "Not", "Assign", "ParenOpen", "ParenClose", "BracketOpen", 
		"BracketClose", "CurlyBracketOpen", "CurlyBracketClose", "Seperator", 
		"Colon", "Semicolon", "Identifier"
	]
	public
	static let VOCABULARY = Vocabulary(_LITERAL_NAMES, _SYMBOLIC_NAMES)


	override open
	func getVocabulary() -> Vocabulary {
		return StubsLexer.VOCABULARY
	}

	public
	required init(_ input: CharStream) {
	    RuntimeMetaData.checkVersion("4.7.1", RuntimeMetaData.VERSION)
		super.init(input)
		_interp = LexerATNSimulator(self, StubsLexer._ATN, StubsLexer._decisionToDFA, StubsLexer._sharedContextCache)
	}

	override open
	func getGrammarFileName() -> String { return "StubsLexer.g4" }

	override open
	func getRuleNames() -> [String] { return StubsLexer.ruleNames }

	override open
	func getSerializedATN() -> String { return StubsLexer._serializedATN }

	override open
	func getChannelNames() -> [String] { return StubsLexer.channelNames }

	override open
	func getModeNames() -> [String] { return StubsLexer.modeNames }

	override open
	func getATN() -> ATN { return StubsLexer._ATN }


	public
	static let _serializedATN: String = StubsLexerATN().jsonString

	public
	static let _ATN: ATN = ATNDeserializer().deserializeFromJson(_serializedATN)
}