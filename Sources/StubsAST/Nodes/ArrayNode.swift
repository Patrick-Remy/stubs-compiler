//
//  ArrayNode.swift
//  StubsAST
//
//  Created by Patrick Remy on 18.12.17.
//

import Foundation

public class ArrayNode: Node {

    public override weak var parent: Node? {
        didSet {
            // Reinvoke children's parent setters to set scope properly
            values.forEach { $0.parent = self }
        }
    }
    public private(set) var values: [Node] {
        willSet {
            values.forEach { $0.parent = nil }
            newValue.forEach { $0.parent = self }
        }
    }

    init(_ values: [Node]) {
        self.values = values

        super.init()

        self.values.forEach { $0.parent = self }
    }

}


// MARK: - Equatable
public extension ArrayNode {

    static func ==(lhs: ArrayNode, rhs: ArrayNode) -> Bool {
        return lhs.values == rhs.values
    }

}
