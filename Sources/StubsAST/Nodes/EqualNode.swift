//
//  EqualNode.swift
//  StubsAST
//
//  Created by Patrick Remy on 20.12.17.
//

import Foundation
import Antlr4

public class EqualNode: Node {

    public enum Operator: String {
        case equal = "=="
        case notEqual = "!="
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
            left.parent = nil
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

    convenience init(_ left: Node, equals right: Node, references token: Token) {
        self.init(left, operator: .equal, right, references: token)
    }

    convenience init(_ left: Node, notEquals right: Node, references token: Token) {
        self.init(left, operator: .notEqual, right, references: token)
    }

}


// MARK: - Equatable
public extension EqualNode {

    static func ==(lhs: EqualNode, rhs: EqualNode) -> Bool {
        return lhs.operator == rhs.operator && lhs.left == rhs.left && lhs.right == rhs.right
    }

}
