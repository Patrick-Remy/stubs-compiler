//
//  Node.swift
//  StubsAST
//
//  Created by Patrick Remy on 18.12.17.
//

import Foundation
import Antlr4

public class Node {

    public internal(set) weak var parent: Node?
    private var _scope: Scope?
    public internal(set) var scope: Scope! {
        get {
            return _scope ?? parent?.scope
        }
        set {
            _scope = newValue
        }
    }
    public var returnType: VarDecNode.VarType?
    public internal(set) var token: Token!

}

extension Node: Equatable {

    public static func ==(lhs: Node, rhs: Node) -> Bool {

        if let lhs = lhs as? AdditiveNode, let rhs = rhs as? AdditiveNode {
            return lhs == rhs
        } else if let lhs = lhs as? AndNode, let rhs = rhs as? AndNode {
            return lhs == rhs
        } else if let lhs = lhs as? ArrayNode, let rhs = rhs as? ArrayNode {
            return lhs == rhs
        } else if let lhs = lhs as? BlockNode, let rhs = rhs as? BlockNode {
            return lhs == rhs
        } else if let lhs = lhs as? EqualNode, let rhs = rhs as? EqualNode {
            return lhs == rhs
        } else if let lhs = lhs as? FuncCallNode, let rhs = rhs as? FuncCallNode {
            return lhs == rhs
        } else if let lhs = lhs as? FuncDecNode, let rhs = rhs as? FuncDecNode {
            return lhs == rhs
        } else if let lhs = lhs as? IdentifierNode, let rhs = rhs as? IdentifierNode {
            return lhs == rhs
        } else if let lhs = lhs as? IfNode, let rhs = rhs as? IfNode {
            return lhs == rhs
        } else if let lhs = lhs as? MultNode, let rhs = rhs as? MultNode {
            return lhs == rhs
        } else if let lhs = lhs as? ObjectDecNode, let rhs = rhs as? ObjectDecNode {
            return lhs == rhs
        } else if let lhs = lhs as? OrNode, let rhs = rhs as? OrNode {
            return lhs == rhs
        } else if let lhs = lhs as? PrimitiveNode, let rhs = rhs as? PrimitiveNode {
            return lhs == rhs
        } else if let lhs = lhs as? RelationalNode, let rhs = rhs as? RelationalNode {
            return lhs == rhs
        } else if let lhs = lhs as? ReturnNode, let rhs = rhs as? ReturnNode {
            return lhs == rhs
        } else if let lhs = lhs as? UnaryNode, let rhs = rhs as? UnaryNode {
            return lhs == rhs
        } else if let lhs = lhs as? VarAssignNode, let rhs = rhs as? VarAssignNode {
            return lhs == rhs
        } else if let lhs = lhs as? VarDecNode, let rhs = rhs as? VarDecNode {
            return lhs == rhs
        } else if let lhs = lhs as? WhileNode, let rhs = rhs as? WhileNode {
            return lhs == rhs
        } else {
            return false
        }

    }

}
