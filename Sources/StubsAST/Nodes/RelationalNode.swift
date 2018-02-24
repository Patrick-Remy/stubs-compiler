//
//  RelationalNode.swift
//  StubsAST
//
//  Created by Patrick Remy on 20.12.17.
//

import Foundation
import Antlr4

public class RelationalNode: Node {

    public enum Operator: String {
        case less = "<"
        case greater = ">"
        case lessOrEqual = "<="
        case greaterOrEqual = ">="
    }

    public override weak var parent: Node? {
        didSet {
            // Reinvoke children's parent setters to set scope properly
            left.parent = self
            right.parent = self
        }
    }
    public private(set) var left: Node {
        willSet {
            left.parent = nil
            newValue.parent = self
        }
    }
    public private(set) var right: Node {
        willSet {
            right.parent = nil
            newValue.parent = self
        }
    }
    public private(set) var `operator`: Operator

    private init(_ left: Node, operator: Operator, _ right: Node, references token: Token) {
        self.left = left
        self.right = right
        self.operator = `operator`

        super.init()
        self.token = token
        returnType = .boolean

        self.left.parent = self
        self.right.parent = self
    }

    convenience init(_ left: Node, lessThan right: Node, references token: Token) {
        self.init(left, operator: .less, right, references: token)
    }

    convenience init(_ left: Node, greaterThan right: Node, references token: Token) {
        self.init(left, operator: .greater, right, references: token)
    }

    convenience init(_ left: Node, lessOrEqualThan right: Node, references token: Token) {
        self.init(left, operator: .lessOrEqual, right, references: token)
    }

    convenience init(_ left: Node, greaterOrEqualThan right: Node, references token: Token) {
        self.init(left, operator: .greaterOrEqual, right, references: token)
    }

}


// MARK: - Equatable
public extension RelationalNode {

    static func ==(lhs: RelationalNode, rhs: RelationalNode) -> Bool {
        return lhs.operator == rhs.operator && lhs.left == rhs.left && lhs.right == rhs.right
    }

}
