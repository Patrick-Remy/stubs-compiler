//
//  AdditiveNode.swift
//  StubsAST
//
//  Created by Patrick Remy on 20.12.17.
//

import Foundation
import Antlr4

public class AdditiveNode: Node {

    public enum Operator: String {
        case plus = "+"
        case minus = "-"
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

    convenience init(_ left: Node, plus right: Node, references token: Token) {
        self.init(left, operator: .plus, right, references: token)
    }

    convenience init(_ left: Node, minus right: Node, references token: Token) {
        self.init(left, operator: .minus, right, references: token)
    }

}


// MARK: - Equatable
public extension AdditiveNode {

    static func ==(lhs: AdditiveNode, rhs: AdditiveNode) -> Bool {
        return lhs.operator == rhs.operator && lhs.left == rhs.left && lhs.right == rhs.right
    }

}
