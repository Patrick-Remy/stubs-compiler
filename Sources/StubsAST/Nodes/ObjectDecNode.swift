//
//  ObjectDecNode.swift
//  StubsAST
//
//  Created by Patrick Remy on 18.12.17.
//

import Foundation

public class ObjectDecNode: Node {

    public override weak var parent: Node? {
        didSet {
            scope = Scope(ofParent: parent?.scope)

            // Reinvoke children's parent setters to set scope properly
            variableDeclarations.forEach { $0.parent = self }
            functionDeclarations.forEach { $0.parent = self }
        }
    }
    public private(set) var identifier: String
    public private(set) var variableDeclarations: [VarDecNode] {
        willSet {
            variableDeclarations.forEach { $0.parent = nil }
            newValue.forEach { $0.parent = self }
        }
    }
    public private(set) var functionDeclarations: [FuncDecNode] {
        willSet {
            functionDeclarations.forEach { $0.parent = nil }
            newValue.forEach { $0.parent = self }
        }
    }

    init(_ identifier: String, variables variableDeclarations: [VarDecNode] = [], functions functionDeclarations: [FuncDecNode] = []) {
        self.identifier = identifier
        self.variableDeclarations = variableDeclarations
        self.functionDeclarations = functionDeclarations

        super.init()
        self.scope = Scope()

        self.variableDeclarations.forEach { $0.parent = self }
        self.functionDeclarations.forEach { $0.parent = self }
    }

}


// MARK: - Equatable
public extension ObjectDecNode {

    static func ==(lhs: ObjectDecNode, rhs: ObjectDecNode) -> Bool {
        return lhs.identifier == rhs.identifier && lhs.variableDeclarations == rhs.variableDeclarations && lhs.functionDeclarations == rhs.functionDeclarations
    }

}
