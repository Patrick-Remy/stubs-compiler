// Generated from StubsParser.g4 by ANTLR 4.7.1
import Antlr4

/**
 * This interface defines a complete listener for a parse tree produced by
 * {@link StubsParser}.
 */
public protocol StubsParserListener: ParseTreeListener {
	/**
	 * Enter a parse tree produced by {@link StubsParser#program}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterProgram(_ ctx: StubsParser.ProgramContext)
	/**
	 * Exit a parse tree produced by {@link StubsParser#program}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitProgram(_ ctx: StubsParser.ProgramContext)
	/**
	 * Enter a parse tree produced by {@link StubsParser#objectDeclaration}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterObjectDeclaration(_ ctx: StubsParser.ObjectDeclarationContext)
	/**
	 * Exit a parse tree produced by {@link StubsParser#objectDeclaration}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitObjectDeclaration(_ ctx: StubsParser.ObjectDeclarationContext)
	/**
	 * Enter a parse tree produced by {@link StubsParser#objectBody}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterObjectBody(_ ctx: StubsParser.ObjectBodyContext)
	/**
	 * Exit a parse tree produced by {@link StubsParser#objectBody}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitObjectBody(_ ctx: StubsParser.ObjectBodyContext)
	/**
	 * Enter a parse tree produced by {@link StubsParser#objectIdentifier}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterObjectIdentifier(_ ctx: StubsParser.ObjectIdentifierContext)
	/**
	 * Exit a parse tree produced by {@link StubsParser#objectIdentifier}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitObjectIdentifier(_ ctx: StubsParser.ObjectIdentifierContext)
	/**
	 * Enter a parse tree produced by {@link StubsParser#datatype}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterDatatype(_ ctx: StubsParser.DatatypeContext)
	/**
	 * Exit a parse tree produced by {@link StubsParser#datatype}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitDatatype(_ ctx: StubsParser.DatatypeContext)
	/**
	 * Enter a parse tree produced by {@link StubsParser#variableDeclaration}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterVariableDeclaration(_ ctx: StubsParser.VariableDeclarationContext)
	/**
	 * Exit a parse tree produced by {@link StubsParser#variableDeclaration}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitVariableDeclaration(_ ctx: StubsParser.VariableDeclarationContext)
	/**
	 * Enter a parse tree produced by {@link StubsParser#variableAssignment}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterVariableAssignment(_ ctx: StubsParser.VariableAssignmentContext)
	/**
	 * Exit a parse tree produced by {@link StubsParser#variableAssignment}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitVariableAssignment(_ ctx: StubsParser.VariableAssignmentContext)
	/**
	 * Enter a parse tree produced by {@link StubsParser#variableIdentifier}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterVariableIdentifier(_ ctx: StubsParser.VariableIdentifierContext)
	/**
	 * Exit a parse tree produced by {@link StubsParser#variableIdentifier}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitVariableIdentifier(_ ctx: StubsParser.VariableIdentifierContext)
	/**
	 * Enter a parse tree produced by {@link StubsParser#functionDeclaration}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterFunctionDeclaration(_ ctx: StubsParser.FunctionDeclarationContext)
	/**
	 * Exit a parse tree produced by {@link StubsParser#functionDeclaration}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitFunctionDeclaration(_ ctx: StubsParser.FunctionDeclarationContext)
	/**
	 * Enter a parse tree produced by {@link StubsParser#functionDeclarationArgumentList}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterFunctionDeclarationArgumentList(_ ctx: StubsParser.FunctionDeclarationArgumentListContext)
	/**
	 * Exit a parse tree produced by {@link StubsParser#functionDeclarationArgumentList}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitFunctionDeclarationArgumentList(_ ctx: StubsParser.FunctionDeclarationArgumentListContext)
	/**
	 * Enter a parse tree produced by {@link StubsParser#functionBody}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterFunctionBody(_ ctx: StubsParser.FunctionBodyContext)
	/**
	 * Exit a parse tree produced by {@link StubsParser#functionBody}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitFunctionBody(_ ctx: StubsParser.FunctionBodyContext)
	/**
	 * Enter a parse tree produced by {@link StubsParser#functionCall}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterFunctionCall(_ ctx: StubsParser.FunctionCallContext)
	/**
	 * Exit a parse tree produced by {@link StubsParser#functionCall}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitFunctionCall(_ ctx: StubsParser.FunctionCallContext)
	/**
	 * Enter a parse tree produced by {@link StubsParser#functionIdentifier}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterFunctionIdentifier(_ ctx: StubsParser.FunctionIdentifierContext)
	/**
	 * Exit a parse tree produced by {@link StubsParser#functionIdentifier}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitFunctionIdentifier(_ ctx: StubsParser.FunctionIdentifierContext)
	/**
	 * Enter a parse tree produced by {@link StubsParser#statement}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterStatement(_ ctx: StubsParser.StatementContext)
	/**
	 * Exit a parse tree produced by {@link StubsParser#statement}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitStatement(_ ctx: StubsParser.StatementContext)
	/**
	 * Enter a parse tree produced by {@link StubsParser#blockStatement}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterBlockStatement(_ ctx: StubsParser.BlockStatementContext)
	/**
	 * Exit a parse tree produced by {@link StubsParser#blockStatement}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitBlockStatement(_ ctx: StubsParser.BlockStatementContext)
	/**
	 * Enter a parse tree produced by {@link StubsParser#ifStatement}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterIfStatement(_ ctx: StubsParser.IfStatementContext)
	/**
	 * Exit a parse tree produced by {@link StubsParser#ifStatement}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitIfStatement(_ ctx: StubsParser.IfStatementContext)
	/**
	 * Enter a parse tree produced by {@link StubsParser#whileStatement}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterWhileStatement(_ ctx: StubsParser.WhileStatementContext)
	/**
	 * Exit a parse tree produced by {@link StubsParser#whileStatement}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitWhileStatement(_ ctx: StubsParser.WhileStatementContext)
	/**
	 * Enter a parse tree produced by {@link StubsParser#returnStatement}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterReturnStatement(_ ctx: StubsParser.ReturnStatementContext)
	/**
	 * Exit a parse tree produced by {@link StubsParser#returnStatement}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitReturnStatement(_ ctx: StubsParser.ReturnStatementContext)
	/**
	 * Enter a parse tree produced by {@link StubsParser#expression}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterExpression(_ ctx: StubsParser.ExpressionContext)
	/**
	 * Exit a parse tree produced by {@link StubsParser#expression}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitExpression(_ ctx: StubsParser.ExpressionContext)
	/**
	 * Enter a parse tree produced by {@link StubsParser#orExpression}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterOrExpression(_ ctx: StubsParser.OrExpressionContext)
	/**
	 * Exit a parse tree produced by {@link StubsParser#orExpression}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitOrExpression(_ ctx: StubsParser.OrExpressionContext)
	/**
	 * Enter a parse tree produced by {@link StubsParser#andExpression}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterAndExpression(_ ctx: StubsParser.AndExpressionContext)
	/**
	 * Exit a parse tree produced by {@link StubsParser#andExpression}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitAndExpression(_ ctx: StubsParser.AndExpressionContext)
	/**
	 * Enter a parse tree produced by {@link StubsParser#equalExpression}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterEqualExpression(_ ctx: StubsParser.EqualExpressionContext)
	/**
	 * Exit a parse tree produced by {@link StubsParser#equalExpression}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitEqualExpression(_ ctx: StubsParser.EqualExpressionContext)
	/**
	 * Enter a parse tree produced by {@link StubsParser#relationalExpression}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterRelationalExpression(_ ctx: StubsParser.RelationalExpressionContext)
	/**
	 * Exit a parse tree produced by {@link StubsParser#relationalExpression}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitRelationalExpression(_ ctx: StubsParser.RelationalExpressionContext)
	/**
	 * Enter a parse tree produced by {@link StubsParser#additiveExpression}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterAdditiveExpression(_ ctx: StubsParser.AdditiveExpressionContext)
	/**
	 * Exit a parse tree produced by {@link StubsParser#additiveExpression}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitAdditiveExpression(_ ctx: StubsParser.AdditiveExpressionContext)
	/**
	 * Enter a parse tree produced by {@link StubsParser#multiplicativeExpression}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterMultiplicativeExpression(_ ctx: StubsParser.MultiplicativeExpressionContext)
	/**
	 * Exit a parse tree produced by {@link StubsParser#multiplicativeExpression}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitMultiplicativeExpression(_ ctx: StubsParser.MultiplicativeExpressionContext)
	/**
	 * Enter a parse tree produced by {@link StubsParser#unaryExpression}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterUnaryExpression(_ ctx: StubsParser.UnaryExpressionContext)
	/**
	 * Exit a parse tree produced by {@link StubsParser#unaryExpression}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitUnaryExpression(_ ctx: StubsParser.UnaryExpressionContext)
	/**
	 * Enter a parse tree produced by {@link StubsParser#primaryExpression}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterPrimaryExpression(_ ctx: StubsParser.PrimaryExpressionContext)
	/**
	 * Exit a parse tree produced by {@link StubsParser#primaryExpression}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitPrimaryExpression(_ ctx: StubsParser.PrimaryExpressionContext)
	/**
	 * Enter a parse tree produced by {@link StubsParser#literal}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterLiteral(_ ctx: StubsParser.LiteralContext)
	/**
	 * Exit a parse tree produced by {@link StubsParser#literal}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitLiteral(_ ctx: StubsParser.LiteralContext)
	/**
	 * Enter a parse tree produced by {@link StubsParser#primitive}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterPrimitive(_ ctx: StubsParser.PrimitiveContext)
	/**
	 * Exit a parse tree produced by {@link StubsParser#primitive}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitPrimitive(_ ctx: StubsParser.PrimitiveContext)
	/**
	 * Enter a parse tree produced by {@link StubsParser#array}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterArray(_ ctx: StubsParser.ArrayContext)
	/**
	 * Exit a parse tree produced by {@link StubsParser#array}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitArray(_ ctx: StubsParser.ArrayContext)
}