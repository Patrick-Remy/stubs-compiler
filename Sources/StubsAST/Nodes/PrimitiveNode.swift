//
//  PrimitiveNode.swift
//  StubsAST
//
//  Created by Patrick Remy on 18.12.17.
//

import Foundation
import Antlr4

public class PrimitiveNode: Node {

    public private(set) var value: String

    init(_ value: String, ofType returnType: VarDecNode.VarType, references token: Token) {
        self.value = value

        super.init()
        self.token = token
        self.returnType = returnType
    }

}


// MARK: - Equatable
public extension PrimitiveNode {

    static func ==(lhs: PrimitiveNode, rhs: PrimitiveNode) -> Bool {
        return lhs.value == rhs.value
    }

}
