//
//  VarDecNode.swift
//  StubsAST
//
//  Created by Patrick Remy on 18.12.17.
//

import Foundation

public class VarDecNode: Node {

    public indirect enum VarType: Equatable {
        case boolean
        case double
        case integer
        case string
        case array(of: VarType)

        init?(fromString string: String) {
            switch string {
            case "Boolean":
                self = .boolean
            case "Double":
                self = .double
            case "Int":
                self = .integer
            case "String":
                self = .string
            default:
                return nil
            }
        }

        static public func ==(lhs: VarType, rhs: VarType) -> Bool {
            switch (lhs, rhs) {
            case (.boolean, .boolean),
                 (.double, .double),
                 (.integer, .integer),
                 (.string, .string):
                return true

            case let (.array(leftVarType), .array(rightVarType)):
                return leftVarType == rightVarType

            default:
                return false
            }
        }
    }

    public override weak var parent: Node? {
        didSet {
            // Reinvoke children's parent setters to set scope properly
            identifier.parent = self
            expression.parent = self
        }
    }
    public private(set) var identifier: IdentifierNode
    public private(set) var datatype: VarType
    public private(set) var expression: Node! {
        willSet {
            expression?.parent = nil
            newValue?.parent = self
        }
    }

    init(_ identifier: IdentifierNode, datatype: VarType, assign expression: Node!) {
        self.identifier = identifier
        self.datatype = datatype
        self.expression = expression

        super.init()

        self.identifier.parent = self
        self.expression?.parent = self
    }

}


// MARK: - Equatable
public extension VarDecNode {

    static func ==(lhs: VarDecNode, rhs: VarDecNode) -> Bool {
        return lhs.identifier == rhs.identifier && lhs.datatype == rhs.datatype && lhs.expression == rhs.expression
    }

}
