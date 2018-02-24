//
//  BlockNode.swift
//  StubsAST
//
//  Created by Patrick Remy on 19.12.17.
//

import Foundation

public class BlockNode: Node {

    public override weak var parent: Node? {
        didSet {
            scope = Scope(ofParent: parent?.scope)

            // Reinvoke children's parent setters to set scope properly
            statements.forEach { $0.parent = self }
        }
    }
    public private(set) var statements: [Node] {
        willSet {
            statements.forEach { $0.parent = nil }
            newValue.forEach { $0.parent = self }
        }
    }

    init(_ statements: [Node]) {
        self.statements = statements

        super.init()
        self.scope = Scope()

        self.statements.forEach { $0.parent = self }
    }

}


// MARK: - Equatable
public extension BlockNode {

    static func ==(lhs: BlockNode, rhs: BlockNode) -> Bool {
        return lhs.statements == rhs.statements
    }

}
