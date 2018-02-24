//
//  ASTGenerator.swift
//  StubsAST
//
//  Created by Patrick Remy on 18.12.17.
//

import Foundation
import StubsParser
import Antlr4

public class ASTGenerator: StubsParserBaseVisitor<Node> {

    public class func generate(from parseTree: ParseTree) -> Node? {
        return ASTGenerator().visit(parseTree)
    }

    // MARK: - Programs
    public override func visitProgram(_ ctx: StubsParser.ProgramContext) -> Node? {
        guard let objectDeclaration = ctx.objectDeclaration() else {
            return nil
        }

        return visitObjectDeclaration(objectDeclaration)
    }

    // MARK: - Objects
    public override func visitObjectDeclaration(_ ctx: StubsParser.ObjectDeclarationContext) -> Node? {
        guard let identifier = ctx.objectIdentifier()?.Identifier()?.getText(), let objectBody = ctx.objectBody() else {
            return nil
        }

        let variableDeclarations = objectBody.variableDeclaration().map { self.visitVariableDeclaration($0) as! VarDecNode }
        let functionDeclarations = objectBody.functionDeclaration().map { self.visitFunctionDeclaration($0) as! FuncDecNode }

        return ObjectDecNode(identifier, variables: variableDeclarations, functions: functionDeclarations)
    }

    // MARK: - Variables
    public override func visitVariableDeclaration(_ ctx: StubsParser.VariableDeclarationContext) -> Node? {
        guard let identifier = ctx.variableIdentifier()?.Identifier(), let identifierToken = identifier.getSymbol(), let datatypeContext = ctx.datatype(), let variableTypeString = datatypeContext.NativeType()?.getText(), var variableType = VarDecNode.VarType(fromString: variableTypeString), let assignExpression = ctx.expression(), let assignExpressionNode = visitExpression(assignExpression) else {
            return nil
        }

        if datatypeContext.Array() != nil {
            variableType = .array(of: variableType)
        }

        let identifierNode = IdentifierNode(identifier.getText(), references: identifierToken)

        return VarDecNode(identifierNode, datatype: variableType, assign: assignExpressionNode)
    }

    public override func visitVariableAssignment(_ ctx: StubsParser.VariableAssignmentContext) -> Node? {
        guard let identifier = ctx.variableIdentifier()?.Identifier(), let identifierToken = identifier.getSymbol(), let assignExpression = ctx.expression(), let assignExpressionNode = visitExpression(assignExpression) else {
            return nil
        }

        let identifierNode = IdentifierNode(identifier.getText(), references: identifierToken)

        guard let indexExpression = ctx.additiveExpression(), let indexExpressionNode = visitAdditiveExpression(indexExpression) else {
            return VarAssignNode(identifierNode, assign: assignExpressionNode)
        }

        return VarAssignNode(identifierNode, index: indexExpressionNode, assign: assignExpressionNode)
    }

    // MARK: - Functions
    public override func visitFunctionDeclaration(_ ctx: StubsParser.FunctionDeclarationContext) -> Node? {
        guard let identifier = ctx.functionIdentifier()?.Identifier()?.getText(), let functionBody = ctx.functionBody() else {
            return nil
        }

        var returnType: VarDecNode.VarType?
        if let datatype = ctx.datatype(), let returnTypeString = datatype.NativeType()?.getText() {
            returnType = VarDecNode.VarType(fromString: returnTypeString)!

            if datatype.Array() != nil {
                returnType = .array(of: returnType!)
            }
        }

        let variableDeclarations = functionBody.variableDeclaration().map { self.visitVariableDeclaration($0) as! VarDecNode }
        let statements = functionBody.statement().map { self.visitStatement($0)! }

        var parameters: [(String, VarDecNode.VarType)] = []
        if let argumentList = ctx.functionDeclarationArgumentList() {
            let argumentIdentifiers = argumentList.variableIdentifier().map { $0.getText() }
            let argumentDatatypes: [VarDecNode.VarType] = argumentList.datatype().map {
                var datatype = VarDecNode.VarType(fromString: $0.NativeType()!.getText())!
                if $0.Array() != nil {
                    datatype = .array(of: datatype)
                }
                return datatype
            }

            parameters.append(contentsOf: zip(argumentIdentifiers, argumentDatatypes))
        }

        return FuncDecNode(identifier, parameters: parameters, returnType: returnType, declarations: variableDeclarations, statements: statements)
    }

    public override func visitFunctionCall(_ ctx: StubsParser.FunctionCallContext) -> Node? {
        guard let identifier = ctx.functionIdentifier()?.Identifier(), let identifierToken = identifier.getSymbol() else {
            return nil
        }

        let identifierNode = IdentifierNode(identifier.getText(), references: identifierToken)
        let parameterNodes = ctx.expression().map { self.visitExpression($0)! }

        return FuncCallNode(identifierNode, parameters: parameterNodes)
    }

    // MARK: - Statements
    public override func visitStatement(_ ctx: StubsParser.StatementContext) -> Node? {
        guard let expression = ctx.expression() else {
            return super.visitStatement(ctx)
        }

        return visitExpression(expression)
    }

    public override func visitBlockStatement(_ ctx: StubsParser.BlockStatementContext) -> Node? {
        return BlockNode(ctx.statement().map { statement in
            let statementNode = visitStatement(statement)
            if statementNode == nil {
                return statementNode!
            }
            return statementNode!
        })
    }

    public override func visitIfStatement(_ ctx: StubsParser.IfStatementContext) -> Node? {
        guard let booleanExpression = ctx.expression(), let booleanExpressionNode = visitExpression(booleanExpression), let thenStatement = ctx.statement(0), let thenNode = visitStatement(thenStatement) else {
            return nil
        }

        var elseNode: Node?
        if let elseStatement = ctx.statement(1), let elseStatementNode = visitStatement(elseStatement) {
            elseNode = elseStatementNode
        }

        return IfNode(booleanExpressionNode, then: thenNode, else: elseNode)
    }

    public override func visitWhileStatement(_ ctx: StubsParser.WhileStatementContext) -> Node? {
        guard let booleanExpression = ctx.expression(), let booleanExpressionNode = visitExpression(booleanExpression), let doStatement = ctx.statement(), let doStatementNode = visitStatement(doStatement) else {
            return nil
        }

        return WhileNode(booleanExpressionNode, do: doStatementNode)
    }

    public override func visitReturnStatement(_ ctx: StubsParser.ReturnStatementContext) -> Node? {
        var returnExpression: Node? = nil
        if let expression = ctx.expression() {
            returnExpression = visitExpression(expression)
        }

        return ReturnNode(returnExpression)
    }


    // MARK: - Expressions
    public override func visitOrExpression(_ ctx: StubsParser.OrExpressionContext) -> Node? {
        guard let rightExpression = ctx.andExpression(), let rightNode = visitAndExpression(rightExpression) else {
            return nil
        }

        // Return node if rule is only forwarding
        guard let leftExpression = ctx.orExpression(), let leftNode = visitOrExpression(leftExpression) else {
            return rightNode
        }

        guard let token = ctx.Or()?.getSymbol() else {
            return nil
        }

        return OrNode(leftNode, or: rightNode, references: token)
    }

    public override func visitAndExpression(_ ctx: StubsParser.AndExpressionContext) -> Node? {
        guard let rightExpression = ctx.equalExpression(), let rightNode = visitEqualExpression(rightExpression) else {
            return nil
        }

        // Return node if rule is only forwarding
        guard let leftExpression = ctx.andExpression(), let leftNode = visitAndExpression(leftExpression) else {
            return rightNode
        }

        guard let token = ctx.And()?.getSymbol() else {
            return nil
        }

        return AndNode(leftNode, and: rightNode, references: token)
    }

    public override func visitEqualExpression(_ ctx: StubsParser.EqualExpressionContext) -> Node? {
        guard let rightExpression = ctx.relationalExpression(), let rightNode = visitRelationalExpression(rightExpression) else {
            return nil
        }

        // Return node if rule is only forwarding
        guard let leftExpression = ctx.equalExpression(), let leftNode = visitEqualExpression(leftExpression) else {
            return rightNode
        }

        if let token = ctx.Equal()?.getSymbol() {
            return EqualNode(leftNode, equals: rightNode, references: token)
        } else if let token = ctx.NotEqual()?.getSymbol() {
            return EqualNode(leftNode, notEquals: rightNode, references: token)
        } else {
            return nil
        }
    }

    public override func visitRelationalExpression(_ ctx: StubsParser.RelationalExpressionContext) -> Node? {
        guard let rightExpression = ctx.additiveExpression(), let rightNode = visitAdditiveExpression(rightExpression) else {
            return nil
        }

        // Return node if rule is only forwarding
        guard let leftExpression = ctx.relationalExpression(), let leftNode = visitRelationalExpression(leftExpression) else {
            return rightNode
        }

        if let token = ctx.Less()?.getSymbol() {
            return RelationalNode(leftNode, lessThan: rightNode, references: token)
        } else if let token = ctx.Greater()?.getSymbol() {
            return RelationalNode(leftNode, greaterThan: rightNode, references: token)
        } else if let token = ctx.LessOrEqual()?.getSymbol() {
            return RelationalNode(leftNode, lessOrEqualThan: rightNode, references: token)
        } else if let token = ctx.GreaterOrEqual()?.getSymbol() {
            return RelationalNode(leftNode, greaterOrEqualThan: rightNode, references: token)
        } else {
            return nil
        }
    }

    public override func visitAdditiveExpression(_ ctx: StubsParser.AdditiveExpressionContext) -> Node? {
        guard let rightExpression = ctx.multiplicativeExpression(), let rightNode = visitMultiplicativeExpression(rightExpression) else {
            return nil
        }

        // Return node if rule is only forwarding
        guard let leftExpression = ctx.additiveExpression(), let leftNode = visitAdditiveExpression(leftExpression) else {
            return rightNode
        }

        if let token = ctx.Plus()?.getSymbol() {
            return AdditiveNode(leftNode, plus: rightNode, references: token)
        } else if let token = ctx.Minus()?.getSymbol() {
            return AdditiveNode(leftNode, minus: rightNode, references: token)
        } else {
            return nil
        }
    }

    public override func visitMultiplicativeExpression(_ ctx: StubsParser.MultiplicativeExpressionContext) -> Node? {
        guard let rightExpression = ctx.unaryExpression(), let rightNode = visitUnaryExpression(rightExpression) else {
            return nil
        }

        // Return node if rule is only forwarding
        guard let leftExpression = ctx.multiplicativeExpression(), let leftNode = visitMultiplicativeExpression(leftExpression) else {
            return rightNode
        }

        if let token = ctx.Mult()?.getSymbol() {
            return MultNode(leftNode, mult: rightNode, references: token)
        } else if let token = ctx.Divide()?.getSymbol() {
            return MultNode(leftNode, divide: rightNode, references: token)
        } else if let token = ctx.Modulo()?.getSymbol() {
            return MultNode(leftNode, modulo: rightNode, references: token)
        } else {
            return nil
        }
    }

    public override func visitUnaryExpression(_ ctx: StubsParser.UnaryExpressionContext) -> Node? {
        guard let expression = ctx.primaryExpression(), let expressionNode = visitPrimaryExpression(expression) else {
            return nil
        }

        if let token = ctx.Plus()?.getSymbol() {
            return UnaryNode(plus: expressionNode, references: token)
        } else if let token = ctx.Minus()?.getSymbol() {
            return UnaryNode(minus: expressionNode, references: token)
        } else if let token = ctx.Not()?.getSymbol() {
            return UnaryNode(not: expressionNode, references: token)
        } else {
            return expressionNode
        }
    }

    public override func visitPrimaryExpression(_ ctx: StubsParser.PrimaryExpressionContext) -> Node? {
        guard let expression = ctx.expression() else {
            return super.visitPrimaryExpression(ctx)
        }

        return visitExpression(expression)
    }

    // MARK: - Literals
    public override func visitVariableIdentifier(_ ctx: StubsParser.VariableIdentifierContext) -> Node? {
        guard let identifier = ctx.Identifier(), let token = identifier.getSymbol() else {
            return nil
        }

        return IdentifierNode(identifier.getText(), references: token)
    }

    public override func visitPrimitive(_ ctx: StubsParser.PrimitiveContext) -> Node? {
        if let booleanContext = ctx.BooleanLiteral(), let token = booleanContext.getSymbol() {
            return PrimitiveNode(booleanContext.getText(), ofType: .boolean, references: token)
        } else if let integerContext = ctx.IntegerLiteral(), let token = integerContext.getSymbol() {
            return PrimitiveNode(integerContext.getText(), ofType: .integer, references: token)
        } else if let doubleContext = ctx.DoubleLiteral(), let token = doubleContext.getSymbol() {
            return PrimitiveNode(doubleContext.getText(), ofType: .double, references: token)
        } else if let stringContext = ctx.StringLiteral(), let token = stringContext.getSymbol() {
            // Remove quotes at start and end of string
            let stringValue = String(stringContext.getText().dropFirst().dropLast())
            return PrimitiveNode(stringValue, ofType: .string, references: token)
        }

        return nil
    }

    public override func visitArray(_ ctx: StubsParser.ArrayContext) -> Node? {
        return ArrayNode(ctx.expression().map { self.visitExpression($0)! })
    }

}
