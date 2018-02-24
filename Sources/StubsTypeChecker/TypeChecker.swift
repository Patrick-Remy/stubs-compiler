//
//  TypeChecker.swift
//  StubsTypeChecker
//
//  Created by Patrick Remy on 20.12.17.
//

import Foundation
import StubsAST

public class TypeChecker {

    public enum Error: Swift.Error {
        case incompatibleTypes(Node)
        case nonIntegerIndex(Node, forVariable: Node)
        case ambigiousReference(FuncCallNode)
        case wrongReturnType(ReturnNode, forFunction: FuncDecNode)
        case noReturnInNonVoidFunction(FuncDecNode)
        case noMainFunction
    }

    private init() {
    }

    public class func validate(_ ast: Node) throws {
        try TypeChecker().validate(ast)
    }

    private func validate(_ node: Node) throws {
        if let node = node as? AdditiveNode {
            try validate(node.left)
            try validate(node.right)

            guard let leftReturnType = node.left.returnType, let rightReturnType = node.right.returnType else {
                throw Error.incompatibleTypes(node)
            }

            if leftReturnType == .double || rightReturnType == .double, leftReturnType == .integer || rightReturnType == .integer {
                node.returnType = .double
                // Do not inherit types, because code generation needs correct types
                // node.left.returnType = .double
                // node.right.returnType = .double
            } else if leftReturnType != rightReturnType || (leftReturnType != .integer && leftReturnType != .double) {
                throw Error.incompatibleTypes(node)
            } else {
                // Return types are equal and even integer or double
                node.returnType = node.left.returnType
            }
        } else if let node = node as? AndNode {
            try validate(node.left)
            try validate(node.right)

            guard let leftReturnType = node.left.returnType, let rightReturnType = node.right.returnType, leftReturnType == .boolean, rightReturnType == .boolean else {
                throw Error.incompatibleTypes(node)
            }
        } else if let node = node as? ArrayNode {
            try validate(node.values)

            guard var returnType = node.values.first?.returnType else {
                return
            }
            try node.values.forEach { value in
                guard let valueReturnType = value.returnType else {
                    throw Error.incompatibleTypes(node)
                }
                if returnType == .double, valueReturnType == .integer {
                    // Do not inherit types, because code generation needs correct types
                    // value.returnType = .double
                } else if returnType == .integer, valueReturnType == .double {
                    returnType = .double
                } else if valueReturnType != returnType {
                    throw Error.incompatibleTypes(node)
                }
            }
            node.returnType = .array(of: returnType)
        } else if let node = node as? BlockNode {
            try validate(node.statements)
        } else if let node = node as? EqualNode {
            try validate(node.left)
            try validate(node.right)

            guard let leftReturnType = node.left.returnType, let rightReturnType = node.right.returnType else {
                throw Error.incompatibleTypes(node)
            }

            if leftReturnType == .double || rightReturnType == .double, leftReturnType == .integer || rightReturnType == .integer {
                // Do not inherit types, because code generation needs correct types
                // node.left.returnType = .double
                // node.right.returnType = .double
            } else if leftReturnType != rightReturnType {
                throw Error.incompatibleTypes(node)
            }

            // Return types are equal
            node.returnType = .boolean
        } else if let node = node as? FuncCallNode {
            try validate(node.parameters)

            if node.identifier.identifier == "println", node.parameters.count == 1 {
                // println with any parameter is okay!
            } else if node.parameters.count == 1, let indexParameterReturnType = node.parameters.first?.returnType, indexParameterReturnType == .integer, let arrayDecNode = try? node.scope.declarationNode(forVariable: node.identifier) {
                // If array is global, ensure no matching function exists
                guard !(arrayDecNode.parent is ObjectDecNode) || (try? node.scope.declarationNode(forFunction: node)) == nil else {
                    throw Error.ambigiousReference(node)
                }
                guard case let VarDecNode.VarType.array(of: datatype) = arrayDecNode.datatype else {
                    throw Error.incompatibleTypes(node)
                }
                node.returnType = datatype
            } else {
                let declarationNode = try node.scope.declarationNode(forFunction: node)

                for parameterIndex in 0..<node.parameters.count {
                    let callArgument = node.parameters[parameterIndex]
                    let declarationArgumentReturnType = declarationNode.parameters[parameterIndex].1
                    guard callArgument.returnType != nil else {
                        throw Error.incompatibleTypes(node)
                    }

                    if callArgument.returnType! == .integer, declarationArgumentReturnType == .double {
                        // Only inherit type for arrays, because code generation needs corrrect type information on primitives
                        // callArgument.returnType = .double
                    } else if callArgument.returnType! == .array(of: .integer), declarationArgumentReturnType == .array(of: .double) {
                        callArgument.returnType = .array(of: .double)
                    } else if callArgument.returnType! != declarationArgumentReturnType {
                        throw Error.incompatibleTypes(node)
                    }
                }

                node.returnType = declarationNode.returnType
            }
        } else if let node = node as? FuncDecNode {
            try validate(node.variableDeclarations)
            try validate(node.statements)

            let returnNodes = node.returnNodes
            guard !returnNodes.isEmpty || node.returnType == nil else {
                throw Error.noReturnInNonVoidFunction(node)
            }
            try returnNodes.forEach { returnNode in
                if let functionReturnType = node.returnType {
                    if let expressionReturnType = returnNode.returnType, expressionReturnType != functionReturnType, !(expressionReturnType == .integer && functionReturnType == .double), !(expressionReturnType == .array(of: .integer) && functionReturnType == .array(of: .double)) {
                        throw Error.wrongReturnType(returnNode, forFunction: node)
                    } else if returnNode.returnType == nil {
                        throw Error.wrongReturnType(returnNode, forFunction: node)
                    }
                } else if returnNode.returnType != nil {
                    throw Error.wrongReturnType(returnNode, forFunction: node)
                }
            }
        } else if let node = node as? IdentifierNode {
            node.returnType = try node.scope.declarationNode(forVariable: node).datatype
        } else if let node = node as? IfNode {
            try validate(node.booleanExpression)

            guard let returnType = node.booleanExpression.returnType, returnType == .boolean else {
                throw Error.incompatibleTypes(node)
            }

            try validate(node.thenStatement)
            if let elseStatement = node.elseStatement {
                try validate(elseStatement)
            }
        } else if let node = node as? MultNode {
            try validate(node.left)
            try validate(node.right)

            guard let leftReturnType = node.left.returnType, let rightReturnType = node.right.returnType else {
                throw Error.incompatibleTypes(node)
            }

            if leftReturnType == .double || rightReturnType == .double, leftReturnType == .integer || rightReturnType == .integer {
                node.returnType = .double
                // Do not inherit types, because code generation needs correct types
                // node.left.returnType = .double
                // node.right.returnType = .double
            } else if leftReturnType != rightReturnType || (leftReturnType != .integer && leftReturnType != .double) {
                throw Error.incompatibleTypes(node)
            } else {
                // Return types are equal and even integer or double
                node.returnType = node.left.returnType
            }
        } else if let node = node as? ObjectDecNode {
            try validate(node.variableDeclarations)
            try node.functionDeclarations.forEach { try node.scope.register(function: $0) }
            try validate(node.functionDeclarations)

            // DISABLED: Exactly one main function with correct parameters
            // guard node.functionDeclarations.reduce(0, { $0 + ($1.identifier == "main" && $1.parameters == [("args", .array(of: .string))] ? 1 : 0) }) == 1 else {
            //    throw Error.noMainFunction()
            // }
        } else if let node = node as? OrNode {
            try validate(node.left)
            try validate(node.right)

            guard let leftReturnType = node.left.returnType, let rightReturnType = node.right.returnType, leftReturnType == .boolean, rightReturnType == .boolean else {
                throw Error.incompatibleTypes(node)
            }
            node.returnType = .boolean
        } else if node is PrimitiveNode {
            // Type is auto-set for primitive literals
        } else if let node = node as? RelationalNode {
            try validate(node.left)
            try validate(node.right)

            guard let leftReturnType = node.left.returnType, let rightReturnType = node.right.returnType else {
                throw Error.incompatibleTypes(node)
            }

            if leftReturnType == .double || rightReturnType == .double, leftReturnType == .integer || rightReturnType == .integer {
                // Do not inherit types, because code generation needs correct types
                // node.left.returnType = .double
                // node.right.returnType = .double
            } else if leftReturnType != rightReturnType || (leftReturnType != .integer && leftReturnType != .double) {
                throw Error.incompatibleTypes(node)
            }

            // Return types are equal and even integer or double
            node.returnType = .boolean
        } else if let node = node as? ReturnNode, let expression = node.expression {
            try validate(expression)
            node.returnType = expression.returnType
        } else if let node = node as? UnaryNode {
            try validate(node.expression)
            guard let expressionReturnType = node.expression.returnType, (expressionReturnType == .boolean && node.operator == .not) || ((expressionReturnType == .integer || expressionReturnType == .double) && (node.operator == .plus || node.operator == .minus)) else {
                throw Error.incompatibleTypes(node)
            }

            node.returnType = expressionReturnType
        } else if let node = node as? VarAssignNode {
            try validate(node.expression)

            guard let expressionReturnType = node.expression.returnType else {
                throw Error.incompatibleTypes(node)
            }

            let declaredType = try node.scope.declarationNode(forVariable: node.identifier).datatype

            if let indexNode = node.index {
                try validate(indexNode)

                // Only integer indexes are allowed
                guard indexNode.returnType == .integer else {
                    throw Error.nonIntegerIndex(indexNode, forVariable: node)
                }

                // Ensure expression return type equals datatype holding the referenced array
                guard case let .array(of: datatype) = declaredType, datatype == expressionReturnType || (datatype == .double && expressionReturnType == .integer) else {
                    throw Error.incompatibleTypes(node)
                }
            } else {
                if declaredType == .double, expressionReturnType == .integer {
                    // Only inherit type for arrays, because code generation needs correct type information on primitives
                    // node.expression.returnType = .double
                } else if declaredType == .array(of: .double), expressionReturnType == .array(of: .integer) {
                    node.expression.returnType = .array(of: .double)
                } else if declaredType != expressionReturnType {
                    throw Error.incompatibleTypes(node)
                }
            }
        } else if let node = node as? VarDecNode {
            try validate(node.expression)

            guard let returnType = node.expression.returnType else {
                throw Error.incompatibleTypes(node)
            }
            if returnType == .integer, node.datatype == .double {
                // Only inherit type for arrays, because code generation needs correct type information on primitives
                // node.expression.returnType = .double
            } else if returnType == .array(of: .integer), node.datatype == .array(of: .double) {
                node.expression.returnType = .array(of: .double)
            } else if returnType != node.datatype {
                throw Error.incompatibleTypes(node)
            }

            try node.scope.register(variable: node)
        } else if let node = node as? WhileNode {
            try validate(node.booleanExpression)

            guard let returnType = node.booleanExpression.returnType, returnType == .boolean else {
                throw Error.incompatibleTypes(node)
            }

            try validate(node.statement)
        }
    }

    private func validate(_ nodes: [Node]) throws {
        try nodes.forEach { try self.validate($0) }
    }

}
