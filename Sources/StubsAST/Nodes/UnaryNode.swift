//
//  UnaryNode.swift
//  StubsAST
//
//  Created by Patrick Remy on 18.12.17.
//

import Foundation
import Antlr4

public class UnaryNode: Node {

    public enum Operator: String {
        case plus = "+"
        case minus = "-"
        case not = "!"
    }

    public override weak var parent: Node? {
        didSet {
            // Reinvoke children's parent setters to set scope properly
            expression.parent = self
        }
    }
    public private(set) var `operator`: Operator
    public private(set) var expression: Node {
        willSet {
            expression.parent = nil
            newValue.parent = self
        }
    }

    private init(_ operator: Operator, expression: Node, references token: Token) {
        self.operator = `operator`
        self.expression = expression

        super.init()
        self.token = token

        self.expression.parent = self
    }

    convenience init(plus expression: Node, references token: Token) {
        self.init(.plus, expression: expression, references: token)
    }

    convenience init(minus expression: Node, references token: Token) {
        self.init(.minus, expression: expression, references: token)
    }

    convenience init(not expression: Node, references token: Token) {
        self.init(.not, expression: expression, references: token)
    }

}


// MARK: - Equatable
public extension UnaryNode {

    static func ==(lhs: UnaryNode, rhs: UnaryNode) -> Bool {
        return lhs.operator == rhs.operator && lhs.expression == rhs.expression
    }

}
