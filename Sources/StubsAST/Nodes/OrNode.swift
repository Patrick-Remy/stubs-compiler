//
//  OrNode.swift
//  StubsAST
//
//  Created by Patrick Remy on 20.12.17.
//

import Foundation
import Antlr4

public class OrNode: Node {

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

    init(_ left: Node, or right: Node, references token: Token) {
        self.left = left
        self.right = right

        super.init()
        self.token = token
        returnType = .boolean

        self.left.parent = self
        self.right.parent = self
    }

}


// MARK: - Equatable
public extension OrNode {

    static func ==(lhs: OrNode, rhs: OrNode) -> Bool {
        return lhs.left == rhs.left && lhs.right == rhs.right
    }

}
