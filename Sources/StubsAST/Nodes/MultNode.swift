//
//  MultNode.swift
//  StubsAST
//
//  Created by Patrick Remy on 20.12.17.
//

import Foundation
import Antlr4

public class MultNode: Node {

    public enum Operator: String {
        case mult = "*"
        case divide = "/"
        case modulo = "%"
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

        self.left.parent = self
        self.right.parent = self
    }

    convenience init(_ left: Node, mult right: Node, references token: Token) {
        self.init(left, operator: .mult, right, references: token)
    }

    convenience init(_ left: Node, divide right: Node, references token: Token) {
        self.init(left, operator: .divide, right, references: token)
    }

    convenience init(_ left: Node, modulo right: Node, references token: Token) {
        self.init(left, operator: .modulo, right, references: token)
    }

}


// MARK: - Equatable
public extension MultNode {

    static func ==(lhs: MultNode, rhs: MultNode) -> Bool {
        return lhs.operator == rhs.operator && lhs.left == rhs.left && lhs.right == rhs.right
    }

}
