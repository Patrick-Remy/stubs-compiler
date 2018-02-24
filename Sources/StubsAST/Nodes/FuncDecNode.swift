//
//  FuncDecNode.swift
//  StubsAST
//
//  Created by Patrick Remy on 18.12.17.
//

import Foundation

public class FuncDecNode: Node {

    public typealias ParameterDescription = (String, VarDecNode.VarType)

    public override weak var parent: Node? {
        didSet {
            scope = Scope(ofParent: parent?.scope)

            // Reinvoke children's parent setters to set scope properly
            variableDeclarations.forEach { $0.parent = self }
            statements.forEach { $0.parent = self }
        }
    }
    public private(set) var identifier: String
    public private(set) var parameters: [ParameterDescription]
    public private(set) var variableDeclarations: [VarDecNode] {
        willSet {
            variableDeclarations.forEach { $0.parent = nil }
            newValue.forEach { $0.parent = self }
        }
    }
    public private(set) var statements: [Node] {
        willSet {
            statements.forEach { $0.parent = nil }
            newValue.forEach { $0.parent = self }
        }
    }
    public var returnNodes: [ReturnNode] {
        return returnNodes(from: statements)
    }

    init(_ identifier: String, parameters: [ParameterDescription] = [], returnType: VarDecNode.VarType? = nil, declarations variableDeclarations: [VarDecNode] = [], statements: [Node] = []) {
        self.identifier = identifier
        self.parameters = parameters
        self.variableDeclarations = variableDeclarations
        self.statements = statements

        super.init()
        self.scope = Scope()
        self.returnType = returnType

        self.variableDeclarations.forEach { $0.parent = self }
        self.statements.forEach { $0.parent = self }
    }

    private func returnNodes(from statements: [Node]) -> [ReturnNode] {
        var returnStatements: [ReturnNode] = []
        statements.forEach {
            if let node = $0 as? ReturnNode {
                returnStatements.append(node)
            } else if let node = $0 as? WhileNode {
                returnStatements.append(contentsOf: returnNodes(from: [node.statement]))
            } else if let node = $0 as? IfNode {
                returnStatements.append(contentsOf: returnNodes(from: [node.thenStatement]))
            } else if let node = $0 as? BlockNode {
                returnStatements.append(contentsOf: returnNodes(from: node.statements))
            }
        }
        return returnStatements
    }

}


// MARK: - Equatable
public func ==(lhs: FuncDecNode.ParameterDescription, rhs: FuncDecNode.ParameterDescription) -> Bool {
    return lhs.0 == rhs.0 && lhs.1 == rhs.1
}

public func ==(lhs: [FuncDecNode.ParameterDescription], rhs: [FuncDecNode.ParameterDescription]) -> Bool {
    return lhs.count == rhs.count && zip(lhs, rhs).contains(where: { $0.0 != $0.1 }) == false
}

public extension FuncDecNode {

    static func ==(lhs: FuncDecNode, rhs: FuncDecNode) -> Bool {
        return lhs.identifier == rhs.identifier && lhs.parameters == rhs.parameters && lhs.variableDeclarations == rhs.variableDeclarations && lhs.statements == rhs.statements
    }

}
