//
//  FuncCallNode.swift
//  StubsAST
//
//  Created by Patrick Remy on 18.12.17.
//

import Foundation
import Antlr4

public class FuncCallNode: Node {

    public override weak var parent: Node? {
        didSet {
            // Reinvoke children's parent setters to set scope properly
            identifier.parent = self
            parameters.forEach { $0.parent = self }
        }
    }
    public private(set) var identifier: IdentifierNode
    public private(set) var parameters: [Node] {
        willSet {
            parameters.forEach { $0.parent = nil }
            newValue.forEach { $0.parent = self }
        }
    }

    init(_ identifier: IdentifierNode, parameters: [Node] = []) {
        self.identifier = identifier
        self.parameters = parameters

        super.init()

        self.identifier.parent = self
        self.parameters.forEach { $0.parent = self }
    }

}


// MARK: - Equatable
public extension FuncCallNode {

    static func ==(lhs: FuncCallNode, rhs: FuncCallNode) -> Bool {
        return lhs.identifier == rhs.identifier && lhs.parameters == rhs.parameters
    }

}
