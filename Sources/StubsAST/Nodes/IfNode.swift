//
//  IfNode.swift
//  StubsAST
//
//  Created by Patrick Remy on 18.12.17.
//

import Foundation

public class IfNode: Node {

    public override weak var parent: Node? {
        didSet {
            // Reinvoke children's parent setters to set scope properly
            booleanExpression.parent = self
            thenStatement.parent = self
            elseStatement?.parent = self
        }
    }
    public private(set) var booleanExpression: Node {
        willSet {
            booleanExpression.parent = nil
            newValue.parent = self
        }
    }
    public private(set) var thenStatement: Node {
        willSet {
            thenStatement.parent = nil
            newValue.parent = self
        }
    }
    public private(set) var elseStatement: Node? {
        willSet {
            elseStatement?.parent = nil
            newValue?.parent = self
        }
    }

    init(_ booleanExpression: Node, then thenStatement: Node, else elseStatement: Node? = nil) {
        self.booleanExpression = booleanExpression
        self.thenStatement = thenStatement
        self.elseStatement = elseStatement

        super.init()

        self.booleanExpression.parent = self
        self.thenStatement.parent = self
        self.elseStatement?.parent = self
    }

}


// MARK: - Equatable
public extension IfNode {

    static func ==(lhs: IfNode, rhs: IfNode) -> Bool {
        return lhs.booleanExpression == rhs.booleanExpression && lhs.thenStatement == rhs.thenStatement && lhs.elseStatement == rhs.elseStatement
    }

}
