// Generated from StubsParser.g4 by ANTLR 4.7.1
import Antlr4

open class StubsParser: Parser {

	internal static var _decisionToDFA: [DFA] = {
          var decisionToDFA = [DFA]()
          let length = StubsParser._ATN.getNumberOfDecisions()
          for i in 0..<length {
            decisionToDFA.append(DFA(StubsParser._ATN.getDecisionState(i)!, i))
           }
           return decisionToDFA
     }()

	internal static let _sharedContextCache = PredictionContextCache()

	public
	enum Tokens: Int {
		case EOF = -1, Ws = 1, Newline = 2, MultilineComment = 3, SingleLineComment = 4, 
                 IntegerLiteral = 5, DoubleLiteral = 6, StringLiteral = 7, 
                 BooleanLiteral = 8, Array = 9, Var = 10, NativeType = 11, 
                 If = 12, Else = 13, While = 14, Def = 15, Return = 16, 
                 Object = 17, Plus = 18, Minus = 19, Mult = 20, Divide = 21, 
                 Modulo = 22, Equal = 23, Less = 24, Greater = 25, LessOrEqual = 26, 
                 GreaterOrEqual = 27, NotEqual = 28, And = 29, Or = 30, 
                 Not = 31, Assign = 32, ParenOpen = 33, ParenClose = 34, 
                 BracketOpen = 35, BracketClose = 36, CurlyBracketOpen = 37, 
                 CurlyBracketClose = 38, Seperator = 39, Colon = 40, Semicolon = 41, 
                 Identifier = 42
	}

	public
	static let RULE_program = 0, RULE_objectDeclaration = 1, RULE_objectBody = 2, 
            RULE_objectIdentifier = 3, RULE_datatype = 4, RULE_variableDeclaration = 5, 
            RULE_variableAssignment = 6, RULE_variableIdentifier = 7, RULE_functionDeclaration = 8, 
            RULE_functionDeclarationArgumentList = 9, RULE_functionBody = 10, 
            RULE_functionCall = 11, RULE_functionIdentifier = 12, RULE_statement = 13, 
            RULE_blockStatement = 14, RULE_ifStatement = 15, RULE_whileStatement = 16, 
            RULE_returnStatement = 17, RULE_expression = 18, RULE_orExpression = 19, 
            RULE_andExpression = 20, RULE_equalExpression = 21, RULE_relationalExpression = 22, 
            RULE_additiveExpression = 23, RULE_multiplicativeExpression = 24, 
            RULE_unaryExpression = 25, RULE_primaryExpression = 26, RULE_literal = 27, 
            RULE_primitive = 28, RULE_array = 29

	public
	static let ruleNames: [String] = [
		"program", "objectDeclaration", "objectBody", "objectIdentifier", "datatype", 
		"variableDeclaration", "variableAssignment", "variableIdentifier", "functionDeclaration", 
		"functionDeclarationArgumentList", "functionBody", "functionCall", "functionIdentifier", 
		"statement", "blockStatement", "ifStatement", "whileStatement", "returnStatement", 
		"expression", "orExpression", "andExpression", "equalExpression", "relationalExpression", 
		"additiveExpression", "multiplicativeExpression", "unaryExpression", "primaryExpression", 
		"literal", "primitive", "array"
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
	func getGrammarFileName() -> String { return "StubsParser.g4" }

	override open
	func getRuleNames() -> [String] { return StubsParser.ruleNames }

	override open
	func getSerializedATN() -> String { return StubsParser._serializedATN }

	override open
	func getATN() -> ATN { return StubsParser._ATN }

	override open
	func getVocabulary() -> Vocabulary {
	    return StubsParser.VOCABULARY
	}

	override public
	init(_ input:TokenStream) throws {
	    RuntimeMetaData.checkVersion("4.7.1", RuntimeMetaData.VERSION)
		try super.init(input)
		_interp = ParserATNSimulator(self,StubsParser._ATN,StubsParser._decisionToDFA, StubsParser._sharedContextCache)
	}

	public class ProgramContext: ParserRuleContext {
			open
			func EOF() -> TerminalNode? {
				return getToken(StubsParser.Tokens.EOF.rawValue, 0)
			}
			open
			func objectDeclaration() -> ObjectDeclarationContext? {
				return getRuleContext(ObjectDeclarationContext.self, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return StubsParser.RULE_program
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? StubsParserListener {
				listener.enterProgram(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? StubsParserListener {
				listener.exitProgram(self)
			}
		}
		override open
		func accept<T>(_ visitor: ParseTreeVisitor<T>) -> T? {
			if let visitor = visitor as? StubsParserVisitor {
			    return visitor.visitProgram(self)
			}
			else if let visitor = visitor as? StubsParserBaseVisitor {
			    return visitor.visitProgram(self)
			}
			else {
			     return visitor.visitChildren(self)
			}
		}
	}
	@discardableResult
	 open func program() throws -> ProgramContext {
		var _localctx: ProgramContext = ProgramContext(_ctx, getState())
		try enterRule(_localctx, 0, StubsParser.RULE_program)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(61)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (//closure
		 	 { () -> Bool in
		 	      let testSet: Bool = _la == StubsParser.Tokens.Object.rawValue
		 	      return testSet
		 	 }()) {
		 		setState(60)
		 		try objectDeclaration()

		 	}

		 	setState(63)
		 	try match(StubsParser.Tokens.EOF.rawValue)

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class ObjectDeclarationContext: ParserRuleContext {
			open
			func Object() -> TerminalNode? {
				return getToken(StubsParser.Tokens.Object.rawValue, 0)
			}
			open
			func objectIdentifier() -> ObjectIdentifierContext? {
				return getRuleContext(ObjectIdentifierContext.self, 0)
			}
			open
			func objectBody() -> ObjectBodyContext? {
				return getRuleContext(ObjectBodyContext.self, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return StubsParser.RULE_objectDeclaration
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? StubsParserListener {
				listener.enterObjectDeclaration(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? StubsParserListener {
				listener.exitObjectDeclaration(self)
			}
		}
		override open
		func accept<T>(_ visitor: ParseTreeVisitor<T>) -> T? {
			if let visitor = visitor as? StubsParserVisitor {
			    return visitor.visitObjectDeclaration(self)
			}
			else if let visitor = visitor as? StubsParserBaseVisitor {
			    return visitor.visitObjectDeclaration(self)
			}
			else {
			     return visitor.visitChildren(self)
			}
		}
	}
	@discardableResult
	 open func objectDeclaration() throws -> ObjectDeclarationContext {
		var _localctx: ObjectDeclarationContext = ObjectDeclarationContext(_ctx, getState())
		try enterRule(_localctx, 2, StubsParser.RULE_objectDeclaration)
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(65)
		 	try match(StubsParser.Tokens.Object.rawValue)
		 	setState(66)
		 	try objectIdentifier()
		 	setState(67)
		 	try objectBody()

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class ObjectBodyContext: ParserRuleContext {
			open
			func CurlyBracketOpen() -> TerminalNode? {
				return getToken(StubsParser.Tokens.CurlyBracketOpen.rawValue, 0)
			}
			open
			func CurlyBracketClose() -> TerminalNode? {
				return getToken(StubsParser.Tokens.CurlyBracketClose.rawValue, 0)
			}
			open
			func variableDeclaration() -> [VariableDeclarationContext] {
				return getRuleContexts(VariableDeclarationContext.self)
			}
			open
			func variableDeclaration(_ i: Int) -> VariableDeclarationContext? {
				return getRuleContext(VariableDeclarationContext.self, i)
			}
			open
			func functionDeclaration() -> [FunctionDeclarationContext] {
				return getRuleContexts(FunctionDeclarationContext.self)
			}
			open
			func functionDeclaration(_ i: Int) -> FunctionDeclarationContext? {
				return getRuleContext(FunctionDeclarationContext.self, i)
			}
		override open
		func getRuleIndex() -> Int {
			return StubsParser.RULE_objectBody
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? StubsParserListener {
				listener.enterObjectBody(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? StubsParserListener {
				listener.exitObjectBody(self)
			}
		}
		override open
		func accept<T>(_ visitor: ParseTreeVisitor<T>) -> T? {
			if let visitor = visitor as? StubsParserVisitor {
			    return visitor.visitObjectBody(self)
			}
			else if let visitor = visitor as? StubsParserBaseVisitor {
			    return visitor.visitObjectBody(self)
			}
			else {
			     return visitor.visitChildren(self)
			}
		}
	}
	@discardableResult
	 open func objectBody() throws -> ObjectBodyContext {
		var _localctx: ObjectBodyContext = ObjectBodyContext(_ctx, getState())
		try enterRule(_localctx, 4, StubsParser.RULE_objectBody)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(69)
		 	try match(StubsParser.Tokens.CurlyBracketOpen.rawValue)
		 	setState(73)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	while (//closure
		 	 { () -> Bool in
		 	      let testSet: Bool = _la == StubsParser.Tokens.Var.rawValue
		 	      return testSet
		 	 }()) {
		 		setState(70)
		 		try variableDeclaration()


		 		setState(75)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 	}
		 	setState(79)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	while (//closure
		 	 { () -> Bool in
		 	      let testSet: Bool = _la == StubsParser.Tokens.Def.rawValue
		 	      return testSet
		 	 }()) {
		 		setState(76)
		 		try functionDeclaration()


		 		setState(81)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 	}
		 	setState(82)
		 	try match(StubsParser.Tokens.CurlyBracketClose.rawValue)

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class ObjectIdentifierContext: ParserRuleContext {
			open
			func Identifier() -> TerminalNode? {
				return getToken(StubsParser.Tokens.Identifier.rawValue, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return StubsParser.RULE_objectIdentifier
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? StubsParserListener {
				listener.enterObjectIdentifier(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? StubsParserListener {
				listener.exitObjectIdentifier(self)
			}
		}
		override open
		func accept<T>(_ visitor: ParseTreeVisitor<T>) -> T? {
			if let visitor = visitor as? StubsParserVisitor {
			    return visitor.visitObjectIdentifier(self)
			}
			else if let visitor = visitor as? StubsParserBaseVisitor {
			    return visitor.visitObjectIdentifier(self)
			}
			else {
			     return visitor.visitChildren(self)
			}
		}
	}
	@discardableResult
	 open func objectIdentifier() throws -> ObjectIdentifierContext {
		var _localctx: ObjectIdentifierContext = ObjectIdentifierContext(_ctx, getState())
		try enterRule(_localctx, 6, StubsParser.RULE_objectIdentifier)
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(84)
		 	try match(StubsParser.Tokens.Identifier.rawValue)

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class DatatypeContext: ParserRuleContext {
			open
			func NativeType() -> TerminalNode? {
				return getToken(StubsParser.Tokens.NativeType.rawValue, 0)
			}
			open
			func Array() -> TerminalNode? {
				return getToken(StubsParser.Tokens.Array.rawValue, 0)
			}
			open
			func BracketOpen() -> TerminalNode? {
				return getToken(StubsParser.Tokens.BracketOpen.rawValue, 0)
			}
			open
			func BracketClose() -> TerminalNode? {
				return getToken(StubsParser.Tokens.BracketClose.rawValue, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return StubsParser.RULE_datatype
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? StubsParserListener {
				listener.enterDatatype(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? StubsParserListener {
				listener.exitDatatype(self)
			}
		}
		override open
		func accept<T>(_ visitor: ParseTreeVisitor<T>) -> T? {
			if let visitor = visitor as? StubsParserVisitor {
			    return visitor.visitDatatype(self)
			}
			else if let visitor = visitor as? StubsParserBaseVisitor {
			    return visitor.visitDatatype(self)
			}
			else {
			     return visitor.visitChildren(self)
			}
		}
	}
	@discardableResult
	 open func datatype() throws -> DatatypeContext {
		var _localctx: DatatypeContext = DatatypeContext(_ctx, getState())
		try enterRule(_localctx, 8, StubsParser.RULE_datatype)
		defer {
	    		try! exitRule()
	    }
		do {
		 	setState(91)
		 	try _errHandler.sync(self)
		 	switch (StubsParser.Tokens(rawValue: try _input.LA(1))!) {
		 	case .NativeType:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(86)
		 		try match(StubsParser.Tokens.NativeType.rawValue)

		 		break

		 	case .Array:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(87)
		 		try match(StubsParser.Tokens.Array.rawValue)
		 		setState(88)
		 		try match(StubsParser.Tokens.BracketOpen.rawValue)
		 		setState(89)
		 		try match(StubsParser.Tokens.NativeType.rawValue)
		 		setState(90)
		 		try match(StubsParser.Tokens.BracketClose.rawValue)

		 		break
		 	default:
		 		throw ANTLRException.recognition(e: NoViableAltException(self))
		 	}
		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class VariableDeclarationContext: ParserRuleContext {
			open
			func Var() -> TerminalNode? {
				return getToken(StubsParser.Tokens.Var.rawValue, 0)
			}
			open
			func variableIdentifier() -> VariableIdentifierContext? {
				return getRuleContext(VariableIdentifierContext.self, 0)
			}
			open
			func Colon() -> TerminalNode? {
				return getToken(StubsParser.Tokens.Colon.rawValue, 0)
			}
			open
			func datatype() -> DatatypeContext? {
				return getRuleContext(DatatypeContext.self, 0)
			}
			open
			func Assign() -> TerminalNode? {
				return getToken(StubsParser.Tokens.Assign.rawValue, 0)
			}
			open
			func expression() -> ExpressionContext? {
				return getRuleContext(ExpressionContext.self, 0)
			}
			open
			func Semicolon() -> TerminalNode? {
				return getToken(StubsParser.Tokens.Semicolon.rawValue, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return StubsParser.RULE_variableDeclaration
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? StubsParserListener {
				listener.enterVariableDeclaration(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? StubsParserListener {
				listener.exitVariableDeclaration(self)
			}
		}
		override open
		func accept<T>(_ visitor: ParseTreeVisitor<T>) -> T? {
			if let visitor = visitor as? StubsParserVisitor {
			    return visitor.visitVariableDeclaration(self)
			}
			else if let visitor = visitor as? StubsParserBaseVisitor {
			    return visitor.visitVariableDeclaration(self)
			}
			else {
			     return visitor.visitChildren(self)
			}
		}
	}
	@discardableResult
	 open func variableDeclaration() throws -> VariableDeclarationContext {
		var _localctx: VariableDeclarationContext = VariableDeclarationContext(_ctx, getState())
		try enterRule(_localctx, 10, StubsParser.RULE_variableDeclaration)
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(93)
		 	try match(StubsParser.Tokens.Var.rawValue)
		 	setState(94)
		 	try variableIdentifier()
		 	setState(95)
		 	try match(StubsParser.Tokens.Colon.rawValue)
		 	setState(96)
		 	try datatype()
		 	setState(97)
		 	try match(StubsParser.Tokens.Assign.rawValue)
		 	setState(98)
		 	try expression()
		 	setState(99)
		 	try match(StubsParser.Tokens.Semicolon.rawValue)

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class VariableAssignmentContext: ParserRuleContext {
			open
			func variableIdentifier() -> VariableIdentifierContext? {
				return getRuleContext(VariableIdentifierContext.self, 0)
			}
			open
			func Assign() -> TerminalNode? {
				return getToken(StubsParser.Tokens.Assign.rawValue, 0)
			}
			open
			func expression() -> ExpressionContext? {
				return getRuleContext(ExpressionContext.self, 0)
			}
			open
			func Semicolon() -> TerminalNode? {
				return getToken(StubsParser.Tokens.Semicolon.rawValue, 0)
			}
			open
			func ParenOpen() -> TerminalNode? {
				return getToken(StubsParser.Tokens.ParenOpen.rawValue, 0)
			}
			open
			func additiveExpression() -> AdditiveExpressionContext? {
				return getRuleContext(AdditiveExpressionContext.self, 0)
			}
			open
			func ParenClose() -> TerminalNode? {
				return getToken(StubsParser.Tokens.ParenClose.rawValue, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return StubsParser.RULE_variableAssignment
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? StubsParserListener {
				listener.enterVariableAssignment(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? StubsParserListener {
				listener.exitVariableAssignment(self)
			}
		}
		override open
		func accept<T>(_ visitor: ParseTreeVisitor<T>) -> T? {
			if let visitor = visitor as? StubsParserVisitor {
			    return visitor.visitVariableAssignment(self)
			}
			else if let visitor = visitor as? StubsParserBaseVisitor {
			    return visitor.visitVariableAssignment(self)
			}
			else {
			     return visitor.visitChildren(self)
			}
		}
	}
	@discardableResult
	 open func variableAssignment() throws -> VariableAssignmentContext {
		var _localctx: VariableAssignmentContext = VariableAssignmentContext(_ctx, getState())
		try enterRule(_localctx, 12, StubsParser.RULE_variableAssignment)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(101)
		 	try variableIdentifier()
		 	setState(106)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (//closure
		 	 { () -> Bool in
		 	      let testSet: Bool = _la == StubsParser.Tokens.ParenOpen.rawValue
		 	      return testSet
		 	 }()) {
		 		setState(102)
		 		try match(StubsParser.Tokens.ParenOpen.rawValue)
		 		setState(103)
		 		try additiveExpression(0)
		 		setState(104)
		 		try match(StubsParser.Tokens.ParenClose.rawValue)

		 	}

		 	setState(108)
		 	try match(StubsParser.Tokens.Assign.rawValue)
		 	setState(109)
		 	try expression()
		 	setState(110)
		 	try match(StubsParser.Tokens.Semicolon.rawValue)

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class VariableIdentifierContext: ParserRuleContext {
			open
			func Identifier() -> TerminalNode? {
				return getToken(StubsParser.Tokens.Identifier.rawValue, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return StubsParser.RULE_variableIdentifier
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? StubsParserListener {
				listener.enterVariableIdentifier(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? StubsParserListener {
				listener.exitVariableIdentifier(self)
			}
		}
		override open
		func accept<T>(_ visitor: ParseTreeVisitor<T>) -> T? {
			if let visitor = visitor as? StubsParserVisitor {
			    return visitor.visitVariableIdentifier(self)
			}
			else if let visitor = visitor as? StubsParserBaseVisitor {
			    return visitor.visitVariableIdentifier(self)
			}
			else {
			     return visitor.visitChildren(self)
			}
		}
	}
	@discardableResult
	 open func variableIdentifier() throws -> VariableIdentifierContext {
		var _localctx: VariableIdentifierContext = VariableIdentifierContext(_ctx, getState())
		try enterRule(_localctx, 14, StubsParser.RULE_variableIdentifier)
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(112)
		 	try match(StubsParser.Tokens.Identifier.rawValue)

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class FunctionDeclarationContext: ParserRuleContext {
			open
			func Def() -> TerminalNode? {
				return getToken(StubsParser.Tokens.Def.rawValue, 0)
			}
			open
			func functionIdentifier() -> FunctionIdentifierContext? {
				return getRuleContext(FunctionIdentifierContext.self, 0)
			}
			open
			func ParenOpen() -> TerminalNode? {
				return getToken(StubsParser.Tokens.ParenOpen.rawValue, 0)
			}
			open
			func ParenClose() -> TerminalNode? {
				return getToken(StubsParser.Tokens.ParenClose.rawValue, 0)
			}
			open
			func Assign() -> TerminalNode? {
				return getToken(StubsParser.Tokens.Assign.rawValue, 0)
			}
			open
			func functionBody() -> FunctionBodyContext? {
				return getRuleContext(FunctionBodyContext.self, 0)
			}
			open
			func functionDeclarationArgumentList() -> FunctionDeclarationArgumentListContext? {
				return getRuleContext(FunctionDeclarationArgumentListContext.self, 0)
			}
			open
			func Colon() -> TerminalNode? {
				return getToken(StubsParser.Tokens.Colon.rawValue, 0)
			}
			open
			func datatype() -> DatatypeContext? {
				return getRuleContext(DatatypeContext.self, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return StubsParser.RULE_functionDeclaration
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? StubsParserListener {
				listener.enterFunctionDeclaration(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? StubsParserListener {
				listener.exitFunctionDeclaration(self)
			}
		}
		override open
		func accept<T>(_ visitor: ParseTreeVisitor<T>) -> T? {
			if let visitor = visitor as? StubsParserVisitor {
			    return visitor.visitFunctionDeclaration(self)
			}
			else if let visitor = visitor as? StubsParserBaseVisitor {
			    return visitor.visitFunctionDeclaration(self)
			}
			else {
			     return visitor.visitChildren(self)
			}
		}
	}
	@discardableResult
	 open func functionDeclaration() throws -> FunctionDeclarationContext {
		var _localctx: FunctionDeclarationContext = FunctionDeclarationContext(_ctx, getState())
		try enterRule(_localctx, 16, StubsParser.RULE_functionDeclaration)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(114)
		 	try match(StubsParser.Tokens.Def.rawValue)
		 	setState(115)
		 	try functionIdentifier()
		 	setState(116)
		 	try match(StubsParser.Tokens.ParenOpen.rawValue)
		 	setState(118)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (//closure
		 	 { () -> Bool in
		 	      let testSet: Bool = _la == StubsParser.Tokens.Identifier.rawValue
		 	      return testSet
		 	 }()) {
		 		setState(117)
		 		try functionDeclarationArgumentList()

		 	}

		 	setState(120)
		 	try match(StubsParser.Tokens.ParenClose.rawValue)
		 	setState(123)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (//closure
		 	 { () -> Bool in
		 	      let testSet: Bool = _la == StubsParser.Tokens.Colon.rawValue
		 	      return testSet
		 	 }()) {
		 		setState(121)
		 		try match(StubsParser.Tokens.Colon.rawValue)
		 		setState(122)
		 		try datatype()

		 	}

		 	setState(125)
		 	try match(StubsParser.Tokens.Assign.rawValue)
		 	setState(126)
		 	try functionBody()

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class FunctionDeclarationArgumentListContext: ParserRuleContext {
			open
			func variableIdentifier() -> [VariableIdentifierContext] {
				return getRuleContexts(VariableIdentifierContext.self)
			}
			open
			func variableIdentifier(_ i: Int) -> VariableIdentifierContext? {
				return getRuleContext(VariableIdentifierContext.self, i)
			}
			open
			func Colon() -> [TerminalNode] {
				return getTokens(StubsParser.Tokens.Colon.rawValue)
			}
			open
			func Colon(_ i:Int) -> TerminalNode? {
				return getToken(StubsParser.Tokens.Colon.rawValue, i)
			}
			open
			func datatype() -> [DatatypeContext] {
				return getRuleContexts(DatatypeContext.self)
			}
			open
			func datatype(_ i: Int) -> DatatypeContext? {
				return getRuleContext(DatatypeContext.self, i)
			}
			open
			func Seperator() -> [TerminalNode] {
				return getTokens(StubsParser.Tokens.Seperator.rawValue)
			}
			open
			func Seperator(_ i:Int) -> TerminalNode? {
				return getToken(StubsParser.Tokens.Seperator.rawValue, i)
			}
		override open
		func getRuleIndex() -> Int {
			return StubsParser.RULE_functionDeclarationArgumentList
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? StubsParserListener {
				listener.enterFunctionDeclarationArgumentList(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? StubsParserListener {
				listener.exitFunctionDeclarationArgumentList(self)
			}
		}
		override open
		func accept<T>(_ visitor: ParseTreeVisitor<T>) -> T? {
			if let visitor = visitor as? StubsParserVisitor {
			    return visitor.visitFunctionDeclarationArgumentList(self)
			}
			else if let visitor = visitor as? StubsParserBaseVisitor {
			    return visitor.visitFunctionDeclarationArgumentList(self)
			}
			else {
			     return visitor.visitChildren(self)
			}
		}
	}
	@discardableResult
	 open func functionDeclarationArgumentList() throws -> FunctionDeclarationArgumentListContext {
		var _localctx: FunctionDeclarationArgumentListContext = FunctionDeclarationArgumentListContext(_ctx, getState())
		try enterRule(_localctx, 18, StubsParser.RULE_functionDeclarationArgumentList)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(128)
		 	try variableIdentifier()
		 	setState(129)
		 	try match(StubsParser.Tokens.Colon.rawValue)
		 	setState(130)
		 	try datatype()
		 	setState(138)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	while (//closure
		 	 { () -> Bool in
		 	      let testSet: Bool = _la == StubsParser.Tokens.Seperator.rawValue
		 	      return testSet
		 	 }()) {
		 		setState(131)
		 		try match(StubsParser.Tokens.Seperator.rawValue)
		 		setState(132)
		 		try variableIdentifier()
		 		setState(133)
		 		try match(StubsParser.Tokens.Colon.rawValue)
		 		setState(134)
		 		try datatype()


		 		setState(140)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 	}

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class FunctionBodyContext: ParserRuleContext {
			open
			func CurlyBracketOpen() -> TerminalNode? {
				return getToken(StubsParser.Tokens.CurlyBracketOpen.rawValue, 0)
			}
			open
			func CurlyBracketClose() -> TerminalNode? {
				return getToken(StubsParser.Tokens.CurlyBracketClose.rawValue, 0)
			}
			open
			func variableDeclaration() -> [VariableDeclarationContext] {
				return getRuleContexts(VariableDeclarationContext.self)
			}
			open
			func variableDeclaration(_ i: Int) -> VariableDeclarationContext? {
				return getRuleContext(VariableDeclarationContext.self, i)
			}
			open
			func statement() -> [StatementContext] {
				return getRuleContexts(StatementContext.self)
			}
			open
			func statement(_ i: Int) -> StatementContext? {
				return getRuleContext(StatementContext.self, i)
			}
		override open
		func getRuleIndex() -> Int {
			return StubsParser.RULE_functionBody
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? StubsParserListener {
				listener.enterFunctionBody(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? StubsParserListener {
				listener.exitFunctionBody(self)
			}
		}
		override open
		func accept<T>(_ visitor: ParseTreeVisitor<T>) -> T? {
			if let visitor = visitor as? StubsParserVisitor {
			    return visitor.visitFunctionBody(self)
			}
			else if let visitor = visitor as? StubsParserBaseVisitor {
			    return visitor.visitFunctionBody(self)
			}
			else {
			     return visitor.visitChildren(self)
			}
		}
	}
	@discardableResult
	 open func functionBody() throws -> FunctionBodyContext {
		var _localctx: FunctionBodyContext = FunctionBodyContext(_ctx, getState())
		try enterRule(_localctx, 20, StubsParser.RULE_functionBody)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(141)
		 	try match(StubsParser.Tokens.CurlyBracketOpen.rawValue)
		 	setState(145)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	while (//closure
		 	 { () -> Bool in
		 	      let testSet: Bool = _la == StubsParser.Tokens.Var.rawValue
		 	      return testSet
		 	 }()) {
		 		setState(142)
		 		try variableDeclaration()


		 		setState(147)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 	}
		 	setState(151)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	while (//closure
		 	 { () -> Bool in
		 	      let testSet: Bool = {  () -> Bool in
		 	   let testArray: [Int] = [_la, StubsParser.Tokens.IntegerLiteral.rawValue,StubsParser.Tokens.DoubleLiteral.rawValue,StubsParser.Tokens.StringLiteral.rawValue,StubsParser.Tokens.BooleanLiteral.rawValue,StubsParser.Tokens.Array.rawValue,StubsParser.Tokens.If.rawValue,StubsParser.Tokens.While.rawValue,StubsParser.Tokens.Return.rawValue,StubsParser.Tokens.Plus.rawValue,StubsParser.Tokens.Minus.rawValue,StubsParser.Tokens.Not.rawValue,StubsParser.Tokens.ParenOpen.rawValue,StubsParser.Tokens.CurlyBracketOpen.rawValue,StubsParser.Tokens.Identifier.rawValue]
		 	    return  Utils.testBitLeftShiftArray(testArray, 0)
		 	}()
		 	      return testSet
		 	 }()) {
		 		setState(148)
		 		try statement()


		 		setState(153)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 	}
		 	setState(154)
		 	try match(StubsParser.Tokens.CurlyBracketClose.rawValue)

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class FunctionCallContext: ParserRuleContext {
			open
			func functionIdentifier() -> FunctionIdentifierContext? {
				return getRuleContext(FunctionIdentifierContext.self, 0)
			}
			open
			func ParenOpen() -> TerminalNode? {
				return getToken(StubsParser.Tokens.ParenOpen.rawValue, 0)
			}
			open
			func ParenClose() -> TerminalNode? {
				return getToken(StubsParser.Tokens.ParenClose.rawValue, 0)
			}
			open
			func expression() -> [ExpressionContext] {
				return getRuleContexts(ExpressionContext.self)
			}
			open
			func expression(_ i: Int) -> ExpressionContext? {
				return getRuleContext(ExpressionContext.self, i)
			}
			open
			func Seperator() -> [TerminalNode] {
				return getTokens(StubsParser.Tokens.Seperator.rawValue)
			}
			open
			func Seperator(_ i:Int) -> TerminalNode? {
				return getToken(StubsParser.Tokens.Seperator.rawValue, i)
			}
		override open
		func getRuleIndex() -> Int {
			return StubsParser.RULE_functionCall
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? StubsParserListener {
				listener.enterFunctionCall(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? StubsParserListener {
				listener.exitFunctionCall(self)
			}
		}
		override open
		func accept<T>(_ visitor: ParseTreeVisitor<T>) -> T? {
			if let visitor = visitor as? StubsParserVisitor {
			    return visitor.visitFunctionCall(self)
			}
			else if let visitor = visitor as? StubsParserBaseVisitor {
			    return visitor.visitFunctionCall(self)
			}
			else {
			     return visitor.visitChildren(self)
			}
		}
	}
	@discardableResult
	 open func functionCall() throws -> FunctionCallContext {
		var _localctx: FunctionCallContext = FunctionCallContext(_ctx, getState())
		try enterRule(_localctx, 22, StubsParser.RULE_functionCall)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(156)
		 	try functionIdentifier()
		 	setState(157)
		 	try match(StubsParser.Tokens.ParenOpen.rawValue)
		 	setState(166)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (//closure
		 	 { () -> Bool in
		 	      let testSet: Bool = {  () -> Bool in
		 	   let testArray: [Int] = [_la, StubsParser.Tokens.IntegerLiteral.rawValue,StubsParser.Tokens.DoubleLiteral.rawValue,StubsParser.Tokens.StringLiteral.rawValue,StubsParser.Tokens.BooleanLiteral.rawValue,StubsParser.Tokens.Array.rawValue,StubsParser.Tokens.Plus.rawValue,StubsParser.Tokens.Minus.rawValue,StubsParser.Tokens.Not.rawValue,StubsParser.Tokens.ParenOpen.rawValue,StubsParser.Tokens.Identifier.rawValue]
		 	    return  Utils.testBitLeftShiftArray(testArray, 0)
		 	}()
		 	      return testSet
		 	 }()) {
		 		setState(158)
		 		try expression()
		 		setState(163)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 		while (//closure
		 		 { () -> Bool in
		 		      let testSet: Bool = _la == StubsParser.Tokens.Seperator.rawValue
		 		      return testSet
		 		 }()) {
		 			setState(159)
		 			try match(StubsParser.Tokens.Seperator.rawValue)
		 			setState(160)
		 			try expression()


		 			setState(165)
		 			try _errHandler.sync(self)
		 			_la = try _input.LA(1)
		 		}

		 	}

		 	setState(168)
		 	try match(StubsParser.Tokens.ParenClose.rawValue)

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class FunctionIdentifierContext: ParserRuleContext {
			open
			func Identifier() -> TerminalNode? {
				return getToken(StubsParser.Tokens.Identifier.rawValue, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return StubsParser.RULE_functionIdentifier
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? StubsParserListener {
				listener.enterFunctionIdentifier(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? StubsParserListener {
				listener.exitFunctionIdentifier(self)
			}
		}
		override open
		func accept<T>(_ visitor: ParseTreeVisitor<T>) -> T? {
			if let visitor = visitor as? StubsParserVisitor {
			    return visitor.visitFunctionIdentifier(self)
			}
			else if let visitor = visitor as? StubsParserBaseVisitor {
			    return visitor.visitFunctionIdentifier(self)
			}
			else {
			     return visitor.visitChildren(self)
			}
		}
	}
	@discardableResult
	 open func functionIdentifier() throws -> FunctionIdentifierContext {
		var _localctx: FunctionIdentifierContext = FunctionIdentifierContext(_ctx, getState())
		try enterRule(_localctx, 24, StubsParser.RULE_functionIdentifier)
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(170)
		 	try match(StubsParser.Tokens.Identifier.rawValue)

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class StatementContext: ParserRuleContext {
			open
			func blockStatement() -> BlockStatementContext? {
				return getRuleContext(BlockStatementContext.self, 0)
			}
			open
			func variableAssignment() -> VariableAssignmentContext? {
				return getRuleContext(VariableAssignmentContext.self, 0)
			}
			open
			func ifStatement() -> IfStatementContext? {
				return getRuleContext(IfStatementContext.self, 0)
			}
			open
			func whileStatement() -> WhileStatementContext? {
				return getRuleContext(WhileStatementContext.self, 0)
			}
			open
			func returnStatement() -> ReturnStatementContext? {
				return getRuleContext(ReturnStatementContext.self, 0)
			}
			open
			func expression() -> ExpressionContext? {
				return getRuleContext(ExpressionContext.self, 0)
			}
			open
			func Semicolon() -> TerminalNode? {
				return getToken(StubsParser.Tokens.Semicolon.rawValue, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return StubsParser.RULE_statement
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? StubsParserListener {
				listener.enterStatement(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? StubsParserListener {
				listener.exitStatement(self)
			}
		}
		override open
		func accept<T>(_ visitor: ParseTreeVisitor<T>) -> T? {
			if let visitor = visitor as? StubsParserVisitor {
			    return visitor.visitStatement(self)
			}
			else if let visitor = visitor as? StubsParserBaseVisitor {
			    return visitor.visitStatement(self)
			}
			else {
			     return visitor.visitChildren(self)
			}
		}
	}
	@discardableResult
	 open func statement() throws -> StatementContext {
		var _localctx: StatementContext = StatementContext(_ctx, getState())
		try enterRule(_localctx, 26, StubsParser.RULE_statement)
		defer {
	    		try! exitRule()
	    }
		do {
		 	setState(180)
		 	try _errHandler.sync(self)
		 	switch(try getInterpreter().adaptivePredict(_input,12, _ctx)) {
		 	case 1:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(172)
		 		try blockStatement()

		 		break
		 	case 2:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(173)
		 		try variableAssignment()

		 		break
		 	case 3:
		 		try enterOuterAlt(_localctx, 3)
		 		setState(174)
		 		try ifStatement()

		 		break
		 	case 4:
		 		try enterOuterAlt(_localctx, 4)
		 		setState(175)
		 		try whileStatement()

		 		break
		 	case 5:
		 		try enterOuterAlt(_localctx, 5)
		 		setState(176)
		 		try returnStatement()

		 		break
		 	case 6:
		 		try enterOuterAlt(_localctx, 6)
		 		setState(177)
		 		try expression()
		 		setState(178)
		 		try match(StubsParser.Tokens.Semicolon.rawValue)

		 		break
		 	default: break
		 	}
		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class BlockStatementContext: ParserRuleContext {
			open
			func CurlyBracketOpen() -> TerminalNode? {
				return getToken(StubsParser.Tokens.CurlyBracketOpen.rawValue, 0)
			}
			open
			func CurlyBracketClose() -> TerminalNode? {
				return getToken(StubsParser.Tokens.CurlyBracketClose.rawValue, 0)
			}
			open
			func statement() -> [StatementContext] {
				return getRuleContexts(StatementContext.self)
			}
			open
			func statement(_ i: Int) -> StatementContext? {
				return getRuleContext(StatementContext.self, i)
			}
		override open
		func getRuleIndex() -> Int {
			return StubsParser.RULE_blockStatement
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? StubsParserListener {
				listener.enterBlockStatement(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? StubsParserListener {
				listener.exitBlockStatement(self)
			}
		}
		override open
		func accept<T>(_ visitor: ParseTreeVisitor<T>) -> T? {
			if let visitor = visitor as? StubsParserVisitor {
			    return visitor.visitBlockStatement(self)
			}
			else if let visitor = visitor as? StubsParserBaseVisitor {
			    return visitor.visitBlockStatement(self)
			}
			else {
			     return visitor.visitChildren(self)
			}
		}
	}
	@discardableResult
	 open func blockStatement() throws -> BlockStatementContext {
		var _localctx: BlockStatementContext = BlockStatementContext(_ctx, getState())
		try enterRule(_localctx, 28, StubsParser.RULE_blockStatement)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(182)
		 	try match(StubsParser.Tokens.CurlyBracketOpen.rawValue)
		 	setState(186)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	while (//closure
		 	 { () -> Bool in
		 	      let testSet: Bool = {  () -> Bool in
		 	   let testArray: [Int] = [_la, StubsParser.Tokens.IntegerLiteral.rawValue,StubsParser.Tokens.DoubleLiteral.rawValue,StubsParser.Tokens.StringLiteral.rawValue,StubsParser.Tokens.BooleanLiteral.rawValue,StubsParser.Tokens.Array.rawValue,StubsParser.Tokens.If.rawValue,StubsParser.Tokens.While.rawValue,StubsParser.Tokens.Return.rawValue,StubsParser.Tokens.Plus.rawValue,StubsParser.Tokens.Minus.rawValue,StubsParser.Tokens.Not.rawValue,StubsParser.Tokens.ParenOpen.rawValue,StubsParser.Tokens.CurlyBracketOpen.rawValue,StubsParser.Tokens.Identifier.rawValue]
		 	    return  Utils.testBitLeftShiftArray(testArray, 0)
		 	}()
		 	      return testSet
		 	 }()) {
		 		setState(183)
		 		try statement()


		 		setState(188)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 	}
		 	setState(189)
		 	try match(StubsParser.Tokens.CurlyBracketClose.rawValue)

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class IfStatementContext: ParserRuleContext {
			open
			func If() -> TerminalNode? {
				return getToken(StubsParser.Tokens.If.rawValue, 0)
			}
			open
			func ParenOpen() -> TerminalNode? {
				return getToken(StubsParser.Tokens.ParenOpen.rawValue, 0)
			}
			open
			func expression() -> ExpressionContext? {
				return getRuleContext(ExpressionContext.self, 0)
			}
			open
			func ParenClose() -> TerminalNode? {
				return getToken(StubsParser.Tokens.ParenClose.rawValue, 0)
			}
			open
			func statement() -> [StatementContext] {
				return getRuleContexts(StatementContext.self)
			}
			open
			func statement(_ i: Int) -> StatementContext? {
				return getRuleContext(StatementContext.self, i)
			}
			open
			func Else() -> TerminalNode? {
				return getToken(StubsParser.Tokens.Else.rawValue, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return StubsParser.RULE_ifStatement
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? StubsParserListener {
				listener.enterIfStatement(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? StubsParserListener {
				listener.exitIfStatement(self)
			}
		}
		override open
		func accept<T>(_ visitor: ParseTreeVisitor<T>) -> T? {
			if let visitor = visitor as? StubsParserVisitor {
			    return visitor.visitIfStatement(self)
			}
			else if let visitor = visitor as? StubsParserBaseVisitor {
			    return visitor.visitIfStatement(self)
			}
			else {
			     return visitor.visitChildren(self)
			}
		}
	}
	@discardableResult
	 open func ifStatement() throws -> IfStatementContext {
		var _localctx: IfStatementContext = IfStatementContext(_ctx, getState())
		try enterRule(_localctx, 30, StubsParser.RULE_ifStatement)
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(191)
		 	try match(StubsParser.Tokens.If.rawValue)
		 	setState(192)
		 	try match(StubsParser.Tokens.ParenOpen.rawValue)
		 	setState(193)
		 	try expression()
		 	setState(194)
		 	try match(StubsParser.Tokens.ParenClose.rawValue)
		 	setState(195)
		 	try statement()
		 	setState(198)
		 	try _errHandler.sync(self)
		 	switch (try getInterpreter().adaptivePredict(_input,14,_ctx)) {
		 	case 1:
		 		setState(196)
		 		try match(StubsParser.Tokens.Else.rawValue)
		 		setState(197)
		 		try statement()

		 		break
		 	default: break
		 	}

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class WhileStatementContext: ParserRuleContext {
			open
			func While() -> TerminalNode? {
				return getToken(StubsParser.Tokens.While.rawValue, 0)
			}
			open
			func ParenOpen() -> TerminalNode? {
				return getToken(StubsParser.Tokens.ParenOpen.rawValue, 0)
			}
			open
			func expression() -> ExpressionContext? {
				return getRuleContext(ExpressionContext.self, 0)
			}
			open
			func ParenClose() -> TerminalNode? {
				return getToken(StubsParser.Tokens.ParenClose.rawValue, 0)
			}
			open
			func statement() -> StatementContext? {
				return getRuleContext(StatementContext.self, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return StubsParser.RULE_whileStatement
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? StubsParserListener {
				listener.enterWhileStatement(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? StubsParserListener {
				listener.exitWhileStatement(self)
			}
		}
		override open
		func accept<T>(_ visitor: ParseTreeVisitor<T>) -> T? {
			if let visitor = visitor as? StubsParserVisitor {
			    return visitor.visitWhileStatement(self)
			}
			else if let visitor = visitor as? StubsParserBaseVisitor {
			    return visitor.visitWhileStatement(self)
			}
			else {
			     return visitor.visitChildren(self)
			}
		}
	}
	@discardableResult
	 open func whileStatement() throws -> WhileStatementContext {
		var _localctx: WhileStatementContext = WhileStatementContext(_ctx, getState())
		try enterRule(_localctx, 32, StubsParser.RULE_whileStatement)
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(200)
		 	try match(StubsParser.Tokens.While.rawValue)
		 	setState(201)
		 	try match(StubsParser.Tokens.ParenOpen.rawValue)
		 	setState(202)
		 	try expression()
		 	setState(203)
		 	try match(StubsParser.Tokens.ParenClose.rawValue)
		 	setState(204)
		 	try statement()

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class ReturnStatementContext: ParserRuleContext {
			open
			func Return() -> TerminalNode? {
				return getToken(StubsParser.Tokens.Return.rawValue, 0)
			}
			open
			func Semicolon() -> TerminalNode? {
				return getToken(StubsParser.Tokens.Semicolon.rawValue, 0)
			}
			open
			func expression() -> ExpressionContext? {
				return getRuleContext(ExpressionContext.self, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return StubsParser.RULE_returnStatement
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? StubsParserListener {
				listener.enterReturnStatement(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? StubsParserListener {
				listener.exitReturnStatement(self)
			}
		}
		override open
		func accept<T>(_ visitor: ParseTreeVisitor<T>) -> T? {
			if let visitor = visitor as? StubsParserVisitor {
			    return visitor.visitReturnStatement(self)
			}
			else if let visitor = visitor as? StubsParserBaseVisitor {
			    return visitor.visitReturnStatement(self)
			}
			else {
			     return visitor.visitChildren(self)
			}
		}
	}
	@discardableResult
	 open func returnStatement() throws -> ReturnStatementContext {
		var _localctx: ReturnStatementContext = ReturnStatementContext(_ctx, getState())
		try enterRule(_localctx, 34, StubsParser.RULE_returnStatement)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(206)
		 	try match(StubsParser.Tokens.Return.rawValue)
		 	setState(208)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (//closure
		 	 { () -> Bool in
		 	      let testSet: Bool = {  () -> Bool in
		 	   let testArray: [Int] = [_la, StubsParser.Tokens.IntegerLiteral.rawValue,StubsParser.Tokens.DoubleLiteral.rawValue,StubsParser.Tokens.StringLiteral.rawValue,StubsParser.Tokens.BooleanLiteral.rawValue,StubsParser.Tokens.Array.rawValue,StubsParser.Tokens.Plus.rawValue,StubsParser.Tokens.Minus.rawValue,StubsParser.Tokens.Not.rawValue,StubsParser.Tokens.ParenOpen.rawValue,StubsParser.Tokens.Identifier.rawValue]
		 	    return  Utils.testBitLeftShiftArray(testArray, 0)
		 	}()
		 	      return testSet
		 	 }()) {
		 		setState(207)
		 		try expression()

		 	}

		 	setState(210)
		 	try match(StubsParser.Tokens.Semicolon.rawValue)

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class ExpressionContext: ParserRuleContext {
			open
			func orExpression() -> OrExpressionContext? {
				return getRuleContext(OrExpressionContext.self, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return StubsParser.RULE_expression
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? StubsParserListener {
				listener.enterExpression(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? StubsParserListener {
				listener.exitExpression(self)
			}
		}
		override open
		func accept<T>(_ visitor: ParseTreeVisitor<T>) -> T? {
			if let visitor = visitor as? StubsParserVisitor {
			    return visitor.visitExpression(self)
			}
			else if let visitor = visitor as? StubsParserBaseVisitor {
			    return visitor.visitExpression(self)
			}
			else {
			     return visitor.visitChildren(self)
			}
		}
	}
	@discardableResult
	 open func expression() throws -> ExpressionContext {
		var _localctx: ExpressionContext = ExpressionContext(_ctx, getState())
		try enterRule(_localctx, 36, StubsParser.RULE_expression)
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(212)
		 	try orExpression(0)

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class OrExpressionContext: ParserRuleContext {
			open
			func andExpression() -> AndExpressionContext? {
				return getRuleContext(AndExpressionContext.self, 0)
			}
			open
			func orExpression() -> OrExpressionContext? {
				return getRuleContext(OrExpressionContext.self, 0)
			}
			open
			func Or() -> TerminalNode? {
				return getToken(StubsParser.Tokens.Or.rawValue, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return StubsParser.RULE_orExpression
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? StubsParserListener {
				listener.enterOrExpression(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? StubsParserListener {
				listener.exitOrExpression(self)
			}
		}
		override open
		func accept<T>(_ visitor: ParseTreeVisitor<T>) -> T? {
			if let visitor = visitor as? StubsParserVisitor {
			    return visitor.visitOrExpression(self)
			}
			else if let visitor = visitor as? StubsParserBaseVisitor {
			    return visitor.visitOrExpression(self)
			}
			else {
			     return visitor.visitChildren(self)
			}
		}
	}

	 public final  func orExpression( ) throws -> OrExpressionContext   {
		return try orExpression(0)
	}
	@discardableResult
	private func orExpression(_ _p: Int) throws -> OrExpressionContext   {
		let _parentctx: ParserRuleContext? = _ctx
		var _parentState: Int = getState()
		var _localctx: OrExpressionContext = OrExpressionContext(_ctx, _parentState)
		var  _prevctx: OrExpressionContext = _localctx
		var _startState: Int = 38
		try enterRecursionRule(_localctx, 38, StubsParser.RULE_orExpression, _p)
		defer {
	    		try! unrollRecursionContexts(_parentctx)
	    }
		do {
			var _alt: Int
			try enterOuterAlt(_localctx, 1)
			setState(215)
			try andExpression(0)

			_ctx!.stop = try _input.LT(-1)
			setState(222)
			try _errHandler.sync(self)
			_alt = try getInterpreter().adaptivePredict(_input,16,_ctx)
			while (_alt != 2 && _alt != ATN.INVALID_ALT_NUMBER) {
				if ( _alt==1 ) {
					if _parseListeners != nil {
					   try triggerExitRuleEvent()
					}
					_prevctx = _localctx
					_localctx = OrExpressionContext(_parentctx, _parentState);
					try pushNewRecursionContext(_localctx, _startState, StubsParser.RULE_orExpression)
					setState(217)
					if (!(precpred(_ctx, 2))) {
					    throw ANTLRException.recognition(e:FailedPredicateException(self, "precpred(_ctx, 2)"))
					}
					setState(218)
					try match(StubsParser.Tokens.Or.rawValue)
					setState(219)
					try andExpression(0)

			 
				}
				setState(224)
				try _errHandler.sync(self)
				_alt = try getInterpreter().adaptivePredict(_input,16,_ctx)
			}

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx;
	}

	public class AndExpressionContext: ParserRuleContext {
			open
			func equalExpression() -> EqualExpressionContext? {
				return getRuleContext(EqualExpressionContext.self, 0)
			}
			open
			func andExpression() -> AndExpressionContext? {
				return getRuleContext(AndExpressionContext.self, 0)
			}
			open
			func And() -> TerminalNode? {
				return getToken(StubsParser.Tokens.And.rawValue, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return StubsParser.RULE_andExpression
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? StubsParserListener {
				listener.enterAndExpression(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? StubsParserListener {
				listener.exitAndExpression(self)
			}
		}
		override open
		func accept<T>(_ visitor: ParseTreeVisitor<T>) -> T? {
			if let visitor = visitor as? StubsParserVisitor {
			    return visitor.visitAndExpression(self)
			}
			else if let visitor = visitor as? StubsParserBaseVisitor {
			    return visitor.visitAndExpression(self)
			}
			else {
			     return visitor.visitChildren(self)
			}
		}
	}

	 public final  func andExpression( ) throws -> AndExpressionContext   {
		return try andExpression(0)
	}
	@discardableResult
	private func andExpression(_ _p: Int) throws -> AndExpressionContext   {
		let _parentctx: ParserRuleContext? = _ctx
		var _parentState: Int = getState()
		var _localctx: AndExpressionContext = AndExpressionContext(_ctx, _parentState)
		var  _prevctx: AndExpressionContext = _localctx
		var _startState: Int = 40
		try enterRecursionRule(_localctx, 40, StubsParser.RULE_andExpression, _p)
		defer {
	    		try! unrollRecursionContexts(_parentctx)
	    }
		do {
			var _alt: Int
			try enterOuterAlt(_localctx, 1)
			setState(226)
			try equalExpression(0)

			_ctx!.stop = try _input.LT(-1)
			setState(233)
			try _errHandler.sync(self)
			_alt = try getInterpreter().adaptivePredict(_input,17,_ctx)
			while (_alt != 2 && _alt != ATN.INVALID_ALT_NUMBER) {
				if ( _alt==1 ) {
					if _parseListeners != nil {
					   try triggerExitRuleEvent()
					}
					_prevctx = _localctx
					_localctx = AndExpressionContext(_parentctx, _parentState);
					try pushNewRecursionContext(_localctx, _startState, StubsParser.RULE_andExpression)
					setState(228)
					if (!(precpred(_ctx, 2))) {
					    throw ANTLRException.recognition(e:FailedPredicateException(self, "precpred(_ctx, 2)"))
					}
					setState(229)
					try match(StubsParser.Tokens.And.rawValue)
					setState(230)
					try equalExpression(0)

			 
				}
				setState(235)
				try _errHandler.sync(self)
				_alt = try getInterpreter().adaptivePredict(_input,17,_ctx)
			}

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx;
	}

	public class EqualExpressionContext: ParserRuleContext {
			open
			func relationalExpression() -> RelationalExpressionContext? {
				return getRuleContext(RelationalExpressionContext.self, 0)
			}
			open
			func equalExpression() -> EqualExpressionContext? {
				return getRuleContext(EqualExpressionContext.self, 0)
			}
			open
			func NotEqual() -> TerminalNode? {
				return getToken(StubsParser.Tokens.NotEqual.rawValue, 0)
			}
			open
			func Equal() -> TerminalNode? {
				return getToken(StubsParser.Tokens.Equal.rawValue, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return StubsParser.RULE_equalExpression
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? StubsParserListener {
				listener.enterEqualExpression(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? StubsParserListener {
				listener.exitEqualExpression(self)
			}
		}
		override open
		func accept<T>(_ visitor: ParseTreeVisitor<T>) -> T? {
			if let visitor = visitor as? StubsParserVisitor {
			    return visitor.visitEqualExpression(self)
			}
			else if let visitor = visitor as? StubsParserBaseVisitor {
			    return visitor.visitEqualExpression(self)
			}
			else {
			     return visitor.visitChildren(self)
			}
		}
	}

	 public final  func equalExpression( ) throws -> EqualExpressionContext   {
		return try equalExpression(0)
	}
	@discardableResult
	private func equalExpression(_ _p: Int) throws -> EqualExpressionContext   {
		let _parentctx: ParserRuleContext? = _ctx
		var _parentState: Int = getState()
		var _localctx: EqualExpressionContext = EqualExpressionContext(_ctx, _parentState)
		var  _prevctx: EqualExpressionContext = _localctx
		var _startState: Int = 42
		try enterRecursionRule(_localctx, 42, StubsParser.RULE_equalExpression, _p)
		var _la: Int = 0
		defer {
	    		try! unrollRecursionContexts(_parentctx)
	    }
		do {
			var _alt: Int
			try enterOuterAlt(_localctx, 1)
			setState(237)
			try relationalExpression(0)

			_ctx!.stop = try _input.LT(-1)
			setState(244)
			try _errHandler.sync(self)
			_alt = try getInterpreter().adaptivePredict(_input,18,_ctx)
			while (_alt != 2 && _alt != ATN.INVALID_ALT_NUMBER) {
				if ( _alt==1 ) {
					if _parseListeners != nil {
					   try triggerExitRuleEvent()
					}
					_prevctx = _localctx
					_localctx = EqualExpressionContext(_parentctx, _parentState);
					try pushNewRecursionContext(_localctx, _startState, StubsParser.RULE_equalExpression)
					setState(239)
					if (!(precpred(_ctx, 2))) {
					    throw ANTLRException.recognition(e:FailedPredicateException(self, "precpred(_ctx, 2)"))
					}
					setState(240)
					_la = try _input.LA(1)
					if (!(//closure
					 { () -> Bool in
					      let testSet: Bool = _la == StubsParser.Tokens.Equal.rawValue || _la == StubsParser.Tokens.NotEqual.rawValue
					      return testSet
					 }())) {
					try _errHandler.recoverInline(self)
					}
					else {
						_errHandler.reportMatch(self)
						try consume()
					}
					setState(241)
					try relationalExpression(0)

			 
				}
				setState(246)
				try _errHandler.sync(self)
				_alt = try getInterpreter().adaptivePredict(_input,18,_ctx)
			}

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx;
	}

	public class RelationalExpressionContext: ParserRuleContext {
			open
			func additiveExpression() -> AdditiveExpressionContext? {
				return getRuleContext(AdditiveExpressionContext.self, 0)
			}
			open
			func relationalExpression() -> RelationalExpressionContext? {
				return getRuleContext(RelationalExpressionContext.self, 0)
			}
			open
			func Less() -> TerminalNode? {
				return getToken(StubsParser.Tokens.Less.rawValue, 0)
			}
			open
			func Greater() -> TerminalNode? {
				return getToken(StubsParser.Tokens.Greater.rawValue, 0)
			}
			open
			func LessOrEqual() -> TerminalNode? {
				return getToken(StubsParser.Tokens.LessOrEqual.rawValue, 0)
			}
			open
			func GreaterOrEqual() -> TerminalNode? {
				return getToken(StubsParser.Tokens.GreaterOrEqual.rawValue, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return StubsParser.RULE_relationalExpression
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? StubsParserListener {
				listener.enterRelationalExpression(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? StubsParserListener {
				listener.exitRelationalExpression(self)
			}
		}
		override open
		func accept<T>(_ visitor: ParseTreeVisitor<T>) -> T? {
			if let visitor = visitor as? StubsParserVisitor {
			    return visitor.visitRelationalExpression(self)
			}
			else if let visitor = visitor as? StubsParserBaseVisitor {
			    return visitor.visitRelationalExpression(self)
			}
			else {
			     return visitor.visitChildren(self)
			}
		}
	}

	 public final  func relationalExpression( ) throws -> RelationalExpressionContext   {
		return try relationalExpression(0)
	}
	@discardableResult
	private func relationalExpression(_ _p: Int) throws -> RelationalExpressionContext   {
		let _parentctx: ParserRuleContext? = _ctx
		var _parentState: Int = getState()
		var _localctx: RelationalExpressionContext = RelationalExpressionContext(_ctx, _parentState)
		var  _prevctx: RelationalExpressionContext = _localctx
		var _startState: Int = 44
		try enterRecursionRule(_localctx, 44, StubsParser.RULE_relationalExpression, _p)
		var _la: Int = 0
		defer {
	    		try! unrollRecursionContexts(_parentctx)
	    }
		do {
			var _alt: Int
			try enterOuterAlt(_localctx, 1)
			setState(248)
			try additiveExpression(0)

			_ctx!.stop = try _input.LT(-1)
			setState(255)
			try _errHandler.sync(self)
			_alt = try getInterpreter().adaptivePredict(_input,19,_ctx)
			while (_alt != 2 && _alt != ATN.INVALID_ALT_NUMBER) {
				if ( _alt==1 ) {
					if _parseListeners != nil {
					   try triggerExitRuleEvent()
					}
					_prevctx = _localctx
					_localctx = RelationalExpressionContext(_parentctx, _parentState);
					try pushNewRecursionContext(_localctx, _startState, StubsParser.RULE_relationalExpression)
					setState(250)
					if (!(precpred(_ctx, 2))) {
					    throw ANTLRException.recognition(e:FailedPredicateException(self, "precpred(_ctx, 2)"))
					}
					setState(251)
					_la = try _input.LA(1)
					if (!(//closure
					 { () -> Bool in
					      let testSet: Bool = {  () -> Bool in
					   let testArray: [Int] = [_la, StubsParser.Tokens.Less.rawValue,StubsParser.Tokens.Greater.rawValue,StubsParser.Tokens.LessOrEqual.rawValue,StubsParser.Tokens.GreaterOrEqual.rawValue]
					    return  Utils.testBitLeftShiftArray(testArray, 0)
					}()
					      return testSet
					 }())) {
					try _errHandler.recoverInline(self)
					}
					else {
						_errHandler.reportMatch(self)
						try consume()
					}
					setState(252)
					try additiveExpression(0)

			 
				}
				setState(257)
				try _errHandler.sync(self)
				_alt = try getInterpreter().adaptivePredict(_input,19,_ctx)
			}

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx;
	}

	public class AdditiveExpressionContext: ParserRuleContext {
			open
			func multiplicativeExpression() -> MultiplicativeExpressionContext? {
				return getRuleContext(MultiplicativeExpressionContext.self, 0)
			}
			open
			func additiveExpression() -> AdditiveExpressionContext? {
				return getRuleContext(AdditiveExpressionContext.self, 0)
			}
			open
			func Plus() -> TerminalNode? {
				return getToken(StubsParser.Tokens.Plus.rawValue, 0)
			}
			open
			func Minus() -> TerminalNode? {
				return getToken(StubsParser.Tokens.Minus.rawValue, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return StubsParser.RULE_additiveExpression
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? StubsParserListener {
				listener.enterAdditiveExpression(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? StubsParserListener {
				listener.exitAdditiveExpression(self)
			}
		}
		override open
		func accept<T>(_ visitor: ParseTreeVisitor<T>) -> T? {
			if let visitor = visitor as? StubsParserVisitor {
			    return visitor.visitAdditiveExpression(self)
			}
			else if let visitor = visitor as? StubsParserBaseVisitor {
			    return visitor.visitAdditiveExpression(self)
			}
			else {
			     return visitor.visitChildren(self)
			}
		}
	}

	 public final  func additiveExpression( ) throws -> AdditiveExpressionContext   {
		return try additiveExpression(0)
	}
	@discardableResult
	private func additiveExpression(_ _p: Int) throws -> AdditiveExpressionContext   {
		let _parentctx: ParserRuleContext? = _ctx
		var _parentState: Int = getState()
		var _localctx: AdditiveExpressionContext = AdditiveExpressionContext(_ctx, _parentState)
		var  _prevctx: AdditiveExpressionContext = _localctx
		var _startState: Int = 46
		try enterRecursionRule(_localctx, 46, StubsParser.RULE_additiveExpression, _p)
		var _la: Int = 0
		defer {
	    		try! unrollRecursionContexts(_parentctx)
	    }
		do {
			var _alt: Int
			try enterOuterAlt(_localctx, 1)
			setState(259)
			try multiplicativeExpression(0)

			_ctx!.stop = try _input.LT(-1)
			setState(266)
			try _errHandler.sync(self)
			_alt = try getInterpreter().adaptivePredict(_input,20,_ctx)
			while (_alt != 2 && _alt != ATN.INVALID_ALT_NUMBER) {
				if ( _alt==1 ) {
					if _parseListeners != nil {
					   try triggerExitRuleEvent()
					}
					_prevctx = _localctx
					_localctx = AdditiveExpressionContext(_parentctx, _parentState);
					try pushNewRecursionContext(_localctx, _startState, StubsParser.RULE_additiveExpression)
					setState(261)
					if (!(precpred(_ctx, 2))) {
					    throw ANTLRException.recognition(e:FailedPredicateException(self, "precpred(_ctx, 2)"))
					}
					setState(262)
					_la = try _input.LA(1)
					if (!(//closure
					 { () -> Bool in
					      let testSet: Bool = _la == StubsParser.Tokens.Plus.rawValue || _la == StubsParser.Tokens.Minus.rawValue
					      return testSet
					 }())) {
					try _errHandler.recoverInline(self)
					}
					else {
						_errHandler.reportMatch(self)
						try consume()
					}
					setState(263)
					try multiplicativeExpression(0)

			 
				}
				setState(268)
				try _errHandler.sync(self)
				_alt = try getInterpreter().adaptivePredict(_input,20,_ctx)
			}

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx;
	}

	public class MultiplicativeExpressionContext: ParserRuleContext {
			open
			func unaryExpression() -> UnaryExpressionContext? {
				return getRuleContext(UnaryExpressionContext.self, 0)
			}
			open
			func multiplicativeExpression() -> MultiplicativeExpressionContext? {
				return getRuleContext(MultiplicativeExpressionContext.self, 0)
			}
			open
			func Mult() -> TerminalNode? {
				return getToken(StubsParser.Tokens.Mult.rawValue, 0)
			}
			open
			func Divide() -> TerminalNode? {
				return getToken(StubsParser.Tokens.Divide.rawValue, 0)
			}
			open
			func Modulo() -> TerminalNode? {
				return getToken(StubsParser.Tokens.Modulo.rawValue, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return StubsParser.RULE_multiplicativeExpression
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? StubsParserListener {
				listener.enterMultiplicativeExpression(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? StubsParserListener {
				listener.exitMultiplicativeExpression(self)
			}
		}
		override open
		func accept<T>(_ visitor: ParseTreeVisitor<T>) -> T? {
			if let visitor = visitor as? StubsParserVisitor {
			    return visitor.visitMultiplicativeExpression(self)
			}
			else if let visitor = visitor as? StubsParserBaseVisitor {
			    return visitor.visitMultiplicativeExpression(self)
			}
			else {
			     return visitor.visitChildren(self)
			}
		}
	}

	 public final  func multiplicativeExpression( ) throws -> MultiplicativeExpressionContext   {
		return try multiplicativeExpression(0)
	}
	@discardableResult
	private func multiplicativeExpression(_ _p: Int) throws -> MultiplicativeExpressionContext   {
		let _parentctx: ParserRuleContext? = _ctx
		var _parentState: Int = getState()
		var _localctx: MultiplicativeExpressionContext = MultiplicativeExpressionContext(_ctx, _parentState)
		var  _prevctx: MultiplicativeExpressionContext = _localctx
		var _startState: Int = 48
		try enterRecursionRule(_localctx, 48, StubsParser.RULE_multiplicativeExpression, _p)
		var _la: Int = 0
		defer {
	    		try! unrollRecursionContexts(_parentctx)
	    }
		do {
			var _alt: Int
			try enterOuterAlt(_localctx, 1)
			setState(270)
			try unaryExpression()

			_ctx!.stop = try _input.LT(-1)
			setState(277)
			try _errHandler.sync(self)
			_alt = try getInterpreter().adaptivePredict(_input,21,_ctx)
			while (_alt != 2 && _alt != ATN.INVALID_ALT_NUMBER) {
				if ( _alt==1 ) {
					if _parseListeners != nil {
					   try triggerExitRuleEvent()
					}
					_prevctx = _localctx
					_localctx = MultiplicativeExpressionContext(_parentctx, _parentState);
					try pushNewRecursionContext(_localctx, _startState, StubsParser.RULE_multiplicativeExpression)
					setState(272)
					if (!(precpred(_ctx, 2))) {
					    throw ANTLRException.recognition(e:FailedPredicateException(self, "precpred(_ctx, 2)"))
					}
					setState(273)
					_la = try _input.LA(1)
					if (!(//closure
					 { () -> Bool in
					      let testSet: Bool = {  () -> Bool in
					   let testArray: [Int] = [_la, StubsParser.Tokens.Mult.rawValue,StubsParser.Tokens.Divide.rawValue,StubsParser.Tokens.Modulo.rawValue]
					    return  Utils.testBitLeftShiftArray(testArray, 0)
					}()
					      return testSet
					 }())) {
					try _errHandler.recoverInline(self)
					}
					else {
						_errHandler.reportMatch(self)
						try consume()
					}
					setState(274)
					try unaryExpression()

			 
				}
				setState(279)
				try _errHandler.sync(self)
				_alt = try getInterpreter().adaptivePredict(_input,21,_ctx)
			}

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx;
	}

	public class UnaryExpressionContext: ParserRuleContext {
			open
			func primaryExpression() -> PrimaryExpressionContext? {
				return getRuleContext(PrimaryExpressionContext.self, 0)
			}
			open
			func Not() -> TerminalNode? {
				return getToken(StubsParser.Tokens.Not.rawValue, 0)
			}
			open
			func Plus() -> TerminalNode? {
				return getToken(StubsParser.Tokens.Plus.rawValue, 0)
			}
			open
			func Minus() -> TerminalNode? {
				return getToken(StubsParser.Tokens.Minus.rawValue, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return StubsParser.RULE_unaryExpression
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? StubsParserListener {
				listener.enterUnaryExpression(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? StubsParserListener {
				listener.exitUnaryExpression(self)
			}
		}
		override open
		func accept<T>(_ visitor: ParseTreeVisitor<T>) -> T? {
			if let visitor = visitor as? StubsParserVisitor {
			    return visitor.visitUnaryExpression(self)
			}
			else if let visitor = visitor as? StubsParserBaseVisitor {
			    return visitor.visitUnaryExpression(self)
			}
			else {
			     return visitor.visitChildren(self)
			}
		}
	}
	@discardableResult
	 open func unaryExpression() throws -> UnaryExpressionContext {
		var _localctx: UnaryExpressionContext = UnaryExpressionContext(_ctx, getState())
		try enterRule(_localctx, 50, StubsParser.RULE_unaryExpression)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(281)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (//closure
		 	 { () -> Bool in
		 	      let testSet: Bool = {  () -> Bool in
		 	   let testArray: [Int] = [_la, StubsParser.Tokens.Plus.rawValue,StubsParser.Tokens.Minus.rawValue,StubsParser.Tokens.Not.rawValue]
		 	    return  Utils.testBitLeftShiftArray(testArray, 0)
		 	}()
		 	      return testSet
		 	 }()) {
		 		setState(280)
		 		_la = try _input.LA(1)
		 		if (!(//closure
		 		 { () -> Bool in
		 		      let testSet: Bool = {  () -> Bool in
		 		   let testArray: [Int] = [_la, StubsParser.Tokens.Plus.rawValue,StubsParser.Tokens.Minus.rawValue,StubsParser.Tokens.Not.rawValue]
		 		    return  Utils.testBitLeftShiftArray(testArray, 0)
		 		}()
		 		      return testSet
		 		 }())) {
		 		try _errHandler.recoverInline(self)
		 		}
		 		else {
		 			_errHandler.reportMatch(self)
		 			try consume()
		 		}

		 	}

		 	setState(283)
		 	try primaryExpression()

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class PrimaryExpressionContext: ParserRuleContext {
			open
			func literal() -> LiteralContext? {
				return getRuleContext(LiteralContext.self, 0)
			}
			open
			func variableIdentifier() -> VariableIdentifierContext? {
				return getRuleContext(VariableIdentifierContext.self, 0)
			}
			open
			func functionCall() -> FunctionCallContext? {
				return getRuleContext(FunctionCallContext.self, 0)
			}
			open
			func ParenOpen() -> TerminalNode? {
				return getToken(StubsParser.Tokens.ParenOpen.rawValue, 0)
			}
			open
			func expression() -> ExpressionContext? {
				return getRuleContext(ExpressionContext.self, 0)
			}
			open
			func ParenClose() -> TerminalNode? {
				return getToken(StubsParser.Tokens.ParenClose.rawValue, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return StubsParser.RULE_primaryExpression
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? StubsParserListener {
				listener.enterPrimaryExpression(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? StubsParserListener {
				listener.exitPrimaryExpression(self)
			}
		}
		override open
		func accept<T>(_ visitor: ParseTreeVisitor<T>) -> T? {
			if let visitor = visitor as? StubsParserVisitor {
			    return visitor.visitPrimaryExpression(self)
			}
			else if let visitor = visitor as? StubsParserBaseVisitor {
			    return visitor.visitPrimaryExpression(self)
			}
			else {
			     return visitor.visitChildren(self)
			}
		}
	}
	@discardableResult
	 open func primaryExpression() throws -> PrimaryExpressionContext {
		var _localctx: PrimaryExpressionContext = PrimaryExpressionContext(_ctx, getState())
		try enterRule(_localctx, 52, StubsParser.RULE_primaryExpression)
		defer {
	    		try! exitRule()
	    }
		do {
		 	setState(292)
		 	try _errHandler.sync(self)
		 	switch(try getInterpreter().adaptivePredict(_input,23, _ctx)) {
		 	case 1:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(285)
		 		try literal()

		 		break
		 	case 2:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(286)
		 		try variableIdentifier()

		 		break
		 	case 3:
		 		try enterOuterAlt(_localctx, 3)
		 		setState(287)
		 		try functionCall()

		 		break
		 	case 4:
		 		try enterOuterAlt(_localctx, 4)
		 		setState(288)
		 		try match(StubsParser.Tokens.ParenOpen.rawValue)
		 		setState(289)
		 		try expression()
		 		setState(290)
		 		try match(StubsParser.Tokens.ParenClose.rawValue)

		 		break
		 	default: break
		 	}
		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class LiteralContext: ParserRuleContext {
			open
			func primitive() -> PrimitiveContext? {
				return getRuleContext(PrimitiveContext.self, 0)
			}
			open
			func array() -> ArrayContext? {
				return getRuleContext(ArrayContext.self, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return StubsParser.RULE_literal
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? StubsParserListener {
				listener.enterLiteral(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? StubsParserListener {
				listener.exitLiteral(self)
			}
		}
		override open
		func accept<T>(_ visitor: ParseTreeVisitor<T>) -> T? {
			if let visitor = visitor as? StubsParserVisitor {
			    return visitor.visitLiteral(self)
			}
			else if let visitor = visitor as? StubsParserBaseVisitor {
			    return visitor.visitLiteral(self)
			}
			else {
			     return visitor.visitChildren(self)
			}
		}
	}
	@discardableResult
	 open func literal() throws -> LiteralContext {
		var _localctx: LiteralContext = LiteralContext(_ctx, getState())
		try enterRule(_localctx, 54, StubsParser.RULE_literal)
		defer {
	    		try! exitRule()
	    }
		do {
		 	setState(296)
		 	try _errHandler.sync(self)
		 	switch (StubsParser.Tokens(rawValue: try _input.LA(1))!) {
		 	case .IntegerLiteral:fallthrough
		 	case .DoubleLiteral:fallthrough
		 	case .StringLiteral:fallthrough
		 	case .BooleanLiteral:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(294)
		 		try primitive()

		 		break

		 	case .Array:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(295)
		 		try array()

		 		break
		 	default:
		 		throw ANTLRException.recognition(e: NoViableAltException(self))
		 	}
		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class PrimitiveContext: ParserRuleContext {
			open
			func IntegerLiteral() -> TerminalNode? {
				return getToken(StubsParser.Tokens.IntegerLiteral.rawValue, 0)
			}
			open
			func DoubleLiteral() -> TerminalNode? {
				return getToken(StubsParser.Tokens.DoubleLiteral.rawValue, 0)
			}
			open
			func StringLiteral() -> TerminalNode? {
				return getToken(StubsParser.Tokens.StringLiteral.rawValue, 0)
			}
			open
			func BooleanLiteral() -> TerminalNode? {
				return getToken(StubsParser.Tokens.BooleanLiteral.rawValue, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return StubsParser.RULE_primitive
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? StubsParserListener {
				listener.enterPrimitive(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? StubsParserListener {
				listener.exitPrimitive(self)
			}
		}
		override open
		func accept<T>(_ visitor: ParseTreeVisitor<T>) -> T? {
			if let visitor = visitor as? StubsParserVisitor {
			    return visitor.visitPrimitive(self)
			}
			else if let visitor = visitor as? StubsParserBaseVisitor {
			    return visitor.visitPrimitive(self)
			}
			else {
			     return visitor.visitChildren(self)
			}
		}
	}
	@discardableResult
	 open func primitive() throws -> PrimitiveContext {
		var _localctx: PrimitiveContext = PrimitiveContext(_ctx, getState())
		try enterRule(_localctx, 56, StubsParser.RULE_primitive)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(298)
		 	_la = try _input.LA(1)
		 	if (!(//closure
		 	 { () -> Bool in
		 	      let testSet: Bool = {  () -> Bool in
		 	   let testArray: [Int] = [_la, StubsParser.Tokens.IntegerLiteral.rawValue,StubsParser.Tokens.DoubleLiteral.rawValue,StubsParser.Tokens.StringLiteral.rawValue,StubsParser.Tokens.BooleanLiteral.rawValue]
		 	    return  Utils.testBitLeftShiftArray(testArray, 0)
		 	}()
		 	      return testSet
		 	 }())) {
		 	try _errHandler.recoverInline(self)
		 	}
		 	else {
		 		_errHandler.reportMatch(self)
		 		try consume()
		 	}

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class ArrayContext: ParserRuleContext {
			open
			func Array() -> TerminalNode? {
				return getToken(StubsParser.Tokens.Array.rawValue, 0)
			}
			open
			func ParenOpen() -> TerminalNode? {
				return getToken(StubsParser.Tokens.ParenOpen.rawValue, 0)
			}
			open
			func expression() -> [ExpressionContext] {
				return getRuleContexts(ExpressionContext.self)
			}
			open
			func expression(_ i: Int) -> ExpressionContext? {
				return getRuleContext(ExpressionContext.self, i)
			}
			open
			func ParenClose() -> TerminalNode? {
				return getToken(StubsParser.Tokens.ParenClose.rawValue, 0)
			}
			open
			func Seperator() -> [TerminalNode] {
				return getTokens(StubsParser.Tokens.Seperator.rawValue)
			}
			open
			func Seperator(_ i:Int) -> TerminalNode? {
				return getToken(StubsParser.Tokens.Seperator.rawValue, i)
			}
		override open
		func getRuleIndex() -> Int {
			return StubsParser.RULE_array
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? StubsParserListener {
				listener.enterArray(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? StubsParserListener {
				listener.exitArray(self)
			}
		}
		override open
		func accept<T>(_ visitor: ParseTreeVisitor<T>) -> T? {
			if let visitor = visitor as? StubsParserVisitor {
			    return visitor.visitArray(self)
			}
			else if let visitor = visitor as? StubsParserBaseVisitor {
			    return visitor.visitArray(self)
			}
			else {
			     return visitor.visitChildren(self)
			}
		}
	}
	@discardableResult
	 open func array() throws -> ArrayContext {
		var _localctx: ArrayContext = ArrayContext(_ctx, getState())
		try enterRule(_localctx, 58, StubsParser.RULE_array)
		defer {
	    		try! exitRule()
	    }
		do {
			var _alt:Int
		 	try enterOuterAlt(_localctx, 1)
		 	setState(300)
		 	try match(StubsParser.Tokens.Array.rawValue)
		 	setState(301)
		 	try match(StubsParser.Tokens.ParenOpen.rawValue)
		 	setState(307)
		 	try _errHandler.sync(self)
		 	_alt = try getInterpreter().adaptivePredict(_input,25,_ctx)
		 	while (_alt != 2 && _alt != ATN.INVALID_ALT_NUMBER) {
		 		if ( _alt==1 ) {
		 			setState(302)
		 			try expression()
		 			setState(303)
		 			try match(StubsParser.Tokens.Seperator.rawValue)

		 	 
		 		}
		 		setState(309)
		 		try _errHandler.sync(self)
		 		_alt = try getInterpreter().adaptivePredict(_input,25,_ctx)
		 	}
		 	setState(310)
		 	try expression()
		 	setState(311)
		 	try match(StubsParser.Tokens.ParenClose.rawValue)

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	override open
	func sempred(_ _localctx: RuleContext?, _ ruleIndex: Int,  _ predIndex: Int)throws -> Bool {
		switch (ruleIndex) {
		case  19:
			return try orExpression_sempred(_localctx?.castdown(OrExpressionContext.self), predIndex)
		case  20:
			return try andExpression_sempred(_localctx?.castdown(AndExpressionContext.self), predIndex)
		case  21:
			return try equalExpression_sempred(_localctx?.castdown(EqualExpressionContext.self), predIndex)
		case  22:
			return try relationalExpression_sempred(_localctx?.castdown(RelationalExpressionContext.self), predIndex)
		case  23:
			return try additiveExpression_sempred(_localctx?.castdown(AdditiveExpressionContext.self), predIndex)
		case  24:
			return try multiplicativeExpression_sempred(_localctx?.castdown(MultiplicativeExpressionContext.self), predIndex)
	    default: return true
		}
	}
	private func orExpression_sempred(_ _localctx: OrExpressionContext!,  _ predIndex: Int) throws -> Bool {
		switch (predIndex) {
		    case 0:return precpred(_ctx, 2)
		    default: return true
		}
	}
	private func andExpression_sempred(_ _localctx: AndExpressionContext!,  _ predIndex: Int) throws -> Bool {
		switch (predIndex) {
		    case 1:return precpred(_ctx, 2)
		    default: return true
		}
	}
	private func equalExpression_sempred(_ _localctx: EqualExpressionContext!,  _ predIndex: Int) throws -> Bool {
		switch (predIndex) {
		    case 2:return precpred(_ctx, 2)
		    default: return true
		}
	}
	private func relationalExpression_sempred(_ _localctx: RelationalExpressionContext!,  _ predIndex: Int) throws -> Bool {
		switch (predIndex) {
		    case 3:return precpred(_ctx, 2)
		    default: return true
		}
	}
	private func additiveExpression_sempred(_ _localctx: AdditiveExpressionContext!,  _ predIndex: Int) throws -> Bool {
		switch (predIndex) {
		    case 4:return precpred(_ctx, 2)
		    default: return true
		}
	}
	private func multiplicativeExpression_sempred(_ _localctx: MultiplicativeExpressionContext!,  _ predIndex: Int) throws -> Bool {
		switch (predIndex) {
		    case 5:return precpred(_ctx, 2)
		    default: return true
		}
	}


	public
	static let _serializedATN = StubsParserATN().jsonString

	public
	static let _ATN = ATNDeserializer().deserializeFromJson(_serializedATN)
}