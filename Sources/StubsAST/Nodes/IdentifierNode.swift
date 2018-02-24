//
//  IdentifierNode.swift
//  StubsAST
//
//  Created by Patrick Remy on 18.12.17.
//

import Foundation
import Antlr4

public class IdentifierNode: Node {

    public private(set) var identifier: String

    init(_ identifier: String, references token: Token!) {
        self.identifier = identifier

        super.init()

        self.token = token
    }

}


// MARK: - Equatable
public extension IdentifierNode {

    static func ==(lhs: IdentifierNode, rhs: IdentifierNode) -> Bool {
        return lhs.identifier == rhs.identifier
    }

}
