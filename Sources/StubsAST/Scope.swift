//
//  Scope.swift
//  StubsAST
//
//  Created by Patrick Remy on 20.12.17.
//

import Foundation

public class Scope {

    public enum Error: Swift.Error {
        case undeclared(Node)
        case redeclaring(Node, of: Node)
        case redeclaringParameter(FuncDecNode.ParameterDescription, of: FuncDecNode.ParameterDescription)
    }

    public internal(set) var parent: Scope?
    private var variables: [String: VarDecNode] = [:]
    private var functions: [String: [FuncDecNode]] = [:]
    private var functionParameters: [String: FuncDecNode.ParameterDescription] = [:]

    init(ofParent parent: Scope? = nil) {
        self.parent = parent
    }

    public func register(variable varDecNode: VarDecNode) throws {
        if let variable = variables[varDecNode.identifier.identifier] {
            throw Error.redeclaring(varDecNode, of: variable)
        }
        variables.updateValue(varDecNode, forKey: varDecNode.identifier.identifier)
    }

    public func register(function funcDecNode: FuncDecNode) throws {
        if var functions = functions[funcDecNode.identifier] {
            if let function = functions.first(where: { incompatibleDeclarations(funcDecNode, $0) }) {
                throw Error.redeclaring(funcDecNode, of: function)
            } else {
                functions.append(funcDecNode)
                self.functions.updateValue(functions, forKey: funcDecNode.identifier)
            }
        } else {
            functions.updateValue([funcDecNode], forKey: funcDecNode.identifier)
        }
        
        try funcDecNode.parameters.forEach { try funcDecNode.scope.register(parameter: $0) }
    }

    func register(parameter: FuncDecNode.ParameterDescription) throws {
        if let functionParameter = functionParameters[parameter.0] {
            throw Error.redeclaringParameter(parameter, of: functionParameter)
        }
        functionParameters.updateValue(parameter, forKey: parameter.0)
    }

    public func declarationNode(forVariable identifierNode: IdentifierNode) throws -> VarDecNode {
        if let node = variables[identifierNode.identifier] {
            return node
        } else if let parameter = functionParameters[identifierNode.identifier] {
            // TODO: Better way needed!
            // TODO: Remove optionals in node declarations
            let node = VarDecNode(
                IdentifierNode(
                    parameter.0,
                    references: nil
                ),
                datatype: parameter.1,
                assign: nil
            )
            return node
        } else if let parent = parent {
            return try parent.declarationNode(forVariable: identifierNode)
        } else {
            throw Error.undeclared(identifierNode)
        }
    }

    public func declarationNode(forFunction funcCallNode: FuncCallNode) throws -> FuncDecNode {
        guard let function = functions[funcCallNode.identifier.identifier]?.first(where: { compatibleCall(funcCallNode, forDeclaration: $0) }) else {
            if let parent = parent {
                return try parent.declarationNode(forFunction: funcCallNode)
            } else {
                throw Error.undeclared(funcCallNode)
            }
        }

        return function
    }

    private func incompatibleDeclarations(_ lhs: FuncDecNode, _ rhs: FuncDecNode) -> Bool {
        return lhs.parameters.count == rhs.parameters.count && !zip(lhs.parameters, rhs.parameters).contains(where: { $0.0.1 != $0.1.1 && [$0.0.1, $0.1.1].contains(where: { $0 != .integer && $0 != .double }) })
    }

    private func compatibleCall(_ call: FuncCallNode, forDeclaration declaration: FuncDecNode) -> Bool {
        return call.parameters.count == declaration.parameters.count && !zip(call.parameters, declaration.parameters).contains(where: { $0.0.returnType != $0.1.1 && [$0.0.returnType, $0.1.1].contains(where: { $0 != nil && $0! != .integer && $0! != .double }) })
    }

}
