//
//  ReturnNode.swift
//  StubsAST
//
//  Created by Patrick Remy on 29.12.17.
//

import Foundation

public class ReturnNode: Node {

    public override weak var parent: Node? {
        didSet {
            // Reinvoke children's parent setters to set scope properly
            expression?.parent = self
        }
    }
    public private(set) var expression: Node?

    public init(_ expression: Node? = nil) {
        self.expression = expression

        super.init()

        self.expression?.parent = self
    }

}


// MARK: - Equatable
public extension ReturnNode {

    static func ==(lhs: ReturnNode, rhs: ReturnNode) -> Bool {
        return lhs.expression == rhs.expression
    }

}
