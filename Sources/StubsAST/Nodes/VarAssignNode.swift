//
//  VarAssignNode.swift
//  StubsAST
//
//  Created by Patrick Remy on 18.12.17.
//

import Foundation

public class VarAssignNode: Node {

    public override weak var parent: Node? {
        didSet {
            // Reinvoke children's parent setters to set scope properly
            identifier.parent = self
            index?.parent = self
            expression.parent = self
        }
    }
    public private(set) var identifier: IdentifierNode
    public private(set) var index: Node?
    public private(set) var expression: Node {
        willSet {
            expression.parent = nil
            newValue.parent = self
        }
    }

    init(_ identifier: IdentifierNode, index: Node? = nil, assign expression: Node) {
        self.identifier = identifier
        self.index = index
        self.expression = expression

        super.init()

        self.identifier.parent = self
        self.index?.parent = self
        self.expression.parent = self
    }

}


// MARK: - Equatable
public extension VarAssignNode {

    static func ==(lhs: VarAssignNode, rhs: VarAssignNode) -> Bool {
        return lhs.identifier == rhs.identifier && lhs.index == rhs.index && lhs.expression == rhs.expression
    }

}
