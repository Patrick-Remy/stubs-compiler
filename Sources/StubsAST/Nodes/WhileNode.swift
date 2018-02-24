//
//  WhileNode.swift
//  StubsAST
//
//  Created by Patrick Remy on 18.12.17.
//

import Foundation

public class WhileNode: Node {

    public override weak var parent: Node? {
        didSet {
            // Reinvoke children's parent setters to set scope properly
            booleanExpression.parent = self
            statement.parent = self
        }
    }
    public private(set) var booleanExpression: Node {
        willSet {
            booleanExpression.parent = nil
            newValue.parent = self
        }
    }
    public private(set) var statement: Node {
        willSet {
            statement.parent = nil
            newValue.parent = self
        }
    }

    init(_ booleanExpression: Node, do statement: Node) {
        self.booleanExpression = booleanExpression
        self.statement = statement

        super.init()

        self.booleanExpression.parent = self
        self.statement.parent = self
    }

}


// MARK: - Equatable
public extension WhileNode {

    static func ==(lhs: WhileNode, rhs: WhileNode) -> Bool {
        return lhs.booleanExpression == rhs.booleanExpression && lhs.statement == rhs.statement
    }

}
