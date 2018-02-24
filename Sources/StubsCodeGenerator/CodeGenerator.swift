//
//  CodeGenerator.swift
//  StubsCodeGenerator
//
//  Created by Patrick Remy on 23.01.18.
//

import Foundation
import StubsAST

public class CodeGenerator {

    public static var lineSeparator = "\n"
    private var currentObjectDec: ObjectDecNode?
    private var currentFuncDec: FuncDecNode?
    private var localVariables: [String: (Int, VarDecNode.VarType, Int)] = [:]
    private var labelCount = 0

    init() {
    }

    public class func generate(for ast: Node) -> String {
        return CodeGenerator().generate(for: ast)
    }

    private func generate(for node: Node) -> String {
        if let node = node as? AdditiveNode {
            return
                """
                \(generate(for: node.left))
                \(convertType(node.left.returnType!, to: node.returnType!))
                \(generate(for: node.right))
                \(convertType(node.right.returnType!, to: node.returnType!))
                \(methodPrefix(for: node.returnType!))\(descriptor(for: node.operator))
                """
        } else if let node = node as? AndNode {
            return
                """
                \(generate(for: node.left))
                \(generate(for: node.right))
                iand
                """
        } else if let node = node as? ArrayNode {
            guard case let .array(of: varType) = node.returnType! else {
                return "Error!"
            }

            var code = "ldc \(node.values.count)"

            var allocationInstruction = "newarray "
            switch varType {
            case .double:
                allocationInstruction += "double"
            case .boolean:
                allocationInstruction += "boolean"
            case .integer:
                allocationInstruction += "int"
            case .string:
                allocationInstruction = "anewarray java/lang/String"
            default:
                break
            }
            code += CodeGenerator.lineSeparator + allocationInstruction

            for index in 0..<node.values.count {
                code += CodeGenerator.lineSeparator +
                    """
                    dup
                    ldc \(index)
                    \(generate(for: node.values[index]))
                    \(convertType(node.values[index].returnType!, to: varType))
                    \(methodPrefix(for: node.returnType!))store
                    """
            }

            return code
        } else if let node = node as? BlockNode {
            return generate(for: node.statements)
        } else if let node = node as? EqualNode {
            var code = ""
            if node.left.returnType == .double || node.right.returnType == .double {
                // dcmpl pushes 0, if doubles are equal
                code =
                    """
                    \(generate(for: node.left))
                    \(convertType(node.left.returnType!, to: .double))
                    \(generate(for: node.right))
                    \(convertType(node.right.returnType!, to: .double))
                    dcmpl
                    """
            } else {
                code =
                    """
                    \(generate(for: node.left))
                    \(generate(for: node.right))
                    """
                if node.left.returnType == .integer || node.left.returnType == .boolean {
                    code += CodeGenerator.lineSeparator + "isub"
                }
            }
            let labelEqualsTrue = generateUniqueLabel()
            let labelEnd = generateUniqueLabel()

            var ifInstruction = "ifeq"
            if node.left.returnType != .double && node.left.returnType != .integer && node.left.returnType != .boolean {
                ifInstruction = "if_acmpeq"
            }

            switch node.operator {
            case .equal:
                code += CodeGenerator.lineSeparator +
                    """
                    \(ifInstruction) \(labelEqualsTrue)
                    ldc 0
                    goto \(labelEnd)
                    \(labelEqualsTrue):
                    ldc 1
                    \(labelEnd):
                    """
            case .notEqual:
                code += CodeGenerator.lineSeparator +
                    """
                    \(ifInstruction) \(labelEqualsTrue)
                    ldc 1
                    goto \(labelEnd)
                    \(labelEqualsTrue):
                    ldc 0
                    \(labelEnd):
                    """
            }

            return code
        } else if let node = node as? FuncCallNode {
            if node.identifier.identifier == "println", let parameter = node.parameters.first, let parameterType = parameter.returnType {
                // Assume println is defined for all parameter types
                return
                    """
                    getstatic java/lang/System/out Ljava/io/PrintStream;
                    \(generate(for: parameter))
                    invokevirtual java/io/PrintStream/println(\(descriptor(for: parameterType)))V
                    """
            }

            // Array access
            if node.parameters.count == 1, let indexReturnTyp = node.parameters.first?.returnType, indexReturnTyp == .integer, let arrayDecNode = try? node.scope.declarationNode(forVariable: node.identifier), case .array(of: _) = arrayDecNode.datatype {
                if let localVariableId = localVariableForIdentifier(node.identifier.identifier)?.0 {
                    return
                        """
                        aload \(localVariableId)
                        \(generate(for: node.parameters))
                        \(methodPrefix(for: arrayDecNode.datatype))load
                        """
                } else {
                    return
                        """
                        getstatic \(currentObjectDec!.identifier)/\(arrayDecNode.identifier.identifier) \(descriptor(for: arrayDecNode.datatype))
                        \(generate(for: node.parameters))
                        \(methodPrefix(for: arrayDecNode.datatype))load
                        """
                }
            }

            // Use associated func declaration to handle possible type conversion
            let funcDecNode = try! node.scope.declarationNode(forFunction: node)
            // Put parameters on stack
            let parametersTuple = zip(node.parameters, funcDecNode.parameters.map { $0.1 })
            // Convert expression types to expected parameters types
            var instructions = parametersTuple.map { generate(for: $0.0) + CodeGenerator.lineSeparator + convertType($0.0.returnType!, to: $0.1) + CodeGenerator.lineSeparator }
            instructions.append("invokestatic \(currentObjectDec!.identifier)/\(funcDecNode.identifier)(\(descriptor(for: funcDecNode.parameters)))\(descriptor(for: funcDecNode.returnType))")

            return instructions.reduce("") { $0 + $1 + CodeGenerator.lineSeparator }
        } else if let node = node as? FuncDecNode {
            currentFuncDec = node
            clearLocalVariables()

            // Register parameters as local variables
            node.parameters.forEach { _ = generateIdForLocalVariable($0.0, ofType: $0.1) }

            let code =
                """
                .method public static \(node.identifier)(\(descriptor(for: node.parameters)))\(descriptor(for: node.returnType))
                .limit stack 255
                .limit locals 255
                ; Local variable declarations
                \(generate(for: node.variableDeclarations))
                ; Statements
                \(generate(for: node.statements))
                return ; default return for void functions, shouldn't be reached on non-void functions
                .end method
                """
            clearLocalVariables()
            currentFuncDec = nil
            return code
        } else if let node = node as? IdentifierNode {
            guard currentFuncDec != nil, let localVariableTuple = localVariableForIdentifier(node.identifier) else {
                return "getstatic \(currentObjectDec!.identifier)/\(node.identifier) \(descriptor(for: node.returnType))"
            }
            var methodPrefix = self.methodPrefix(for: localVariableTuple.1)
            if case .array(of: _) = localVariableTuple.1 {
                methodPrefix = "a"
            }
            return "\(methodPrefix)load \(localVariableTuple.0)"
        } else if let node = node as? IfNode {
            if let elseStatement = node.elseStatement {
                let falseLabel = generateUniqueLabel()
                let endLabel = generateUniqueLabel()
                return
                    """
                    \(generate(for: node.booleanExpression))
                    ifeq \(falseLabel)
                    \(generate(for: node.thenStatement))
                    goto \(endLabel)
                    \(falseLabel):
                    \(generate(for: elseStatement))
                    \(endLabel):
                    """
            } else {
                let falseLabel = generateUniqueLabel()
                return
                    """
                    \(generate(for: node.booleanExpression))
                    ifeq \(falseLabel)
                    \(generate(for: node.thenStatement))
                    \(falseLabel):
                    """
            }
        } else if let node = node as? MultNode {
            return
                """
                \(generate(for: node.left))
                \(convertType(node.left.returnType!, to: node.returnType!))
                \(generate(for: node.right))
                \(convertType(node.right.returnType!, to: node.returnType!))
                \(methodPrefix(for: node.returnType!))\(descriptor(for: node.operator))
                """
        } else if let node = node as? ObjectDecNode {
            currentObjectDec = node
            let staticDeclarations = node.variableDeclarations.map { ".field public static \($0.identifier.identifier) \(descriptor(for: $0.datatype))" }.reduce("") { $0 + $1 + CodeGenerator.lineSeparator }

            let code =
                """
                .class public \(node.identifier)
                .super java/lang/Object

                ; Field declarations
                \(staticDeclarations)
                ; Static constructor
                .method public static <clinit>()V
                .limit stack 255
                .limit locals 255
                \(generate(for: node.variableDeclarations))
                return
                .end method

                ; Default constructor
                .method public <init>()V
                aload_0 ; push this
                invokespecial java/lang/Object/<init>()V ; call super
                return
                .end method

                ; Function declarations
                \(generate(for: node.functionDeclarations, separator: CodeGenerator.lineSeparator + CodeGenerator.lineSeparator))
                """
            currentObjectDec = nil
            return code
        } else if let node = node as? OrNode {
            return
                """
                \(generate(for: node.left))
                \(generate(for: node.right))
                ior
                """
        } else if let node = node as? PrimitiveNode {
            var code = ""
            switch node.returnType! {
            case .integer:
                code = "ldc \(node.value)"
            case .double:
                code = "ldc2_w "
                // Append .0 to ensure value isn't interpreted as long instead of double
                if !node.value.contains(".") {
                    code += node.value.appending(".0")
                } else {
                    code += node.value
                }
            case .boolean:
                code = "ldc "
                if node.value == "true" {
                    code += "1"
                } else {
                    code += "0"
                }
            case .string:
                code += "ldc \"\(node.value)\""
            case .array(of: _):
                // Arrays are represented through array nodes
                break
            }
            return code
        } else if let node = node as? RelationalNode {
            var code = ""
            if node.left.returnType == .double || node.right.returnType == .double {
                // Use dcmpl to get 0 on equal, -1 on less and 1 for greater
                // This int can be used with common if compare
                code =
                    """
                    \(generate(for: node.left))
                    \(convertType(node.left.returnType!, to: .double))
                    \(generate(for: node.right))
                    \(convertType(node.right.returnType!, to: .double))
                    dcmpl
                    """
            } else {
                code =
                    """
                    \(generate(for: node.left))
                    \(generate(for: node.right))
                    isub
                    """
            }

            let labelEnd = generateUniqueLabel()
            let labelTrue = generateUniqueLabel()
            code += CodeGenerator.lineSeparator +
                """
                if\(descriptor(for: node.operator)) \(labelTrue)
                ldc 0
                goto \(labelEnd)
                \(labelTrue):
                ldc 1
                \(labelEnd):
                """
            return code
        } else if let node = node as? ReturnNode {
            if let expression = node.expression {
                var methodPrefix = self.methodPrefix(for: node.returnType!)
                // Only return address, if array is returned
                if case .array(of: _) = node.returnType! {
                    methodPrefix = "a"
                }
                return
                    """
                    \(generate(for: expression))
                    \(convertType(expression.returnType!, to: currentFuncDec!.returnType!))
                    \(methodPrefix)return
                    """
            } else {
                return "return"
            }
        } else if let node = node as? UnaryNode {
            var code = generate(for: node.expression) + CodeGenerator.lineSeparator
            switch node.operator {
            case .plus:
                // Nothing to do
                break
            case .minus:
                code += "\(methodPrefix(for: node.expression.returnType!))neg"
            case .not:
                let trueLabel = generateUniqueLabel()
                let endLabel = generateUniqueLabel()
                code +=
                    """
                    ifne \(trueLabel)
                    ldc 1
                    goto \(endLabel)
                    \(trueLabel):
                    ldc 0
                    \(endLabel):
                    """
            }
            return code
        } else if let node = node as? VarAssignNode {
            let varDecNode = try! node.scope.declarationNode(forVariable: node.identifier)
            if let objectDecNode = varDecNode.parent as? ObjectDecNode {
                if let index = node.index, case let .array(of: datatype) = varDecNode.datatype {
                    return
                        """
                        getstatic \(objectDecNode.identifier)/\(node.identifier.identifier) \(descriptor(for: varDecNode.datatype))
                        \(generate(for: index))
                        \(generate(for: node.expression))
                        \(convertType(node.expression.returnType!, to: datatype))
                        \(methodPrefix(for: varDecNode.datatype))store
                        """
                } else {
                    return
                        """
                        \(generate(for: node.expression))
                        \(convertType(node.expression.returnType!, to: varDecNode.datatype))
                        putstatic \(objectDecNode.identifier)/\(node.identifier.identifier) \(descriptor(for: varDecNode.datatype))
                        """
                }
            } else {
                if let index = node.index, case let .array(of: datatype) = varDecNode.datatype {
                    return
                        """
                        aload \(localVariableForIdentifier(node.identifier.identifier)!.0)
                        \(generate(for: index))
                        \(generate(for: node.expression))
                        \(convertType(node.expression.returnType!, to: datatype))
                        \(methodPrefix(for: varDecNode.datatype))store
                        """
                } else if case .array(of: _) = varDecNode.datatype {
                    return
                        """
                        \(generate(for: node.expression))
                        astore \(localVariableForIdentifier(node.identifier.identifier)!.0)
                        """
                } else {
                    return
                        """
                        \(generate(for: node.expression))
                        \(convertType(node.expression.returnType!, to: varDecNode.datatype))
                        \(methodPrefix(for: varDecNode.datatype))store \(localVariableForIdentifier(node.identifier.identifier)!.0)
                        """
                }
            }
        } else if let node = node as? VarDecNode {
            var methodPrefix = self.methodPrefix(for: node.datatype)
            if case .array(of: _) = node.datatype {
                methodPrefix = "a"
            }

            // Check wheather it's a local or static variable
            var storeInstruction: String!
            if node.parent is ObjectDecNode, let objectDecNode = self.currentObjectDec {
                storeInstruction = "putstatic \(objectDecNode.identifier)/\(node.identifier.identifier) \(descriptor(for: node.datatype))"
            } else {
                storeInstruction = "\(methodPrefix)store \(generateIdForLocalVariable(node.identifier.identifier, ofType: node.datatype))"
            }

            return
                """
                \(generate(for: node.expression))
                \(convertType(node.expression.returnType!, to: node.datatype))
                \(storeInstruction!)
                """
        } else if let node = node as? WhileNode {
            let labelConditionTest = generateUniqueLabel()
            let labelFalse = generateUniqueLabel()
            return
                """
                \(labelConditionTest):
                \(generate(for: node.booleanExpression))
                ifeq \(labelFalse)
                \(generate(for: node.statement))
                goto \(labelConditionTest)
                \(labelFalse):
                """
        }
        return "; nothing to do for node \(node)"
    }

    // MARK: - Util functions

    func generateUniqueLabel() -> String {
        labelCount += 1
        return "label\(labelCount)"
    }

    func clearLocalVariables() {
        localVariables.removeAll()
    }

    func generateIdForLocalVariable(_ identifier: String, ofType type: VarDecNode.VarType) -> Int {
        let uniqueId = localVariables.values.reduce(0) { max($0, $1.0 + $1.2) }
        var size = 1
        if type == .double {
            size = 2
        }
        localVariables.updateValue((uniqueId, type, size), forKey: identifier)
        return uniqueId
    }

    func localVariableForIdentifier(_ identifier: String) -> (Int, VarDecNode.VarType, Int)? {
        return localVariables[identifier]
    }

    // MARK: - Private interface

    private func generate(for nodes: [Node], separator: String = CodeGenerator.lineSeparator) -> String {
        return nodes.map { self.generate(for: $0) }.reduce("") { $0 + $1 + separator }
    }

    private func descriptor(for datatype: VarDecNode.VarType?) -> String {
        guard let datatype = datatype else {
            return "V"
        }

        switch datatype {
        case .double:
            return "D"
        case .boolean:
            return "Z"
        case .integer:
            return "I"
        case .string:
            return "Ljava/lang/String;"
        case let .array(of: varType):
            return "[\(descriptor(for: varType))"
        }
    }

    private func methodPrefix(for datatype: VarDecNode.VarType) -> String {
        switch datatype {
        case .double:
            return "d"
        case .integer, .boolean:
            return "i"
        case .string:
            return "a"
        case let .array(of: varType):
            var methodPrefix = self.methodPrefix(for: varType)
            if varType == .boolean {
                methodPrefix = "b"
            }
            return methodPrefix + "a"
        }
    }

    private func descriptor(for parameters: [FuncDecNode.ParameterDescription]) -> String {
        return parameters.map { descriptor(for: $0.1) }.reduce("") { $0 + $1 }
    }

    private func descriptor(for operator: AdditiveNode.Operator) -> String {
        switch `operator` {
        case .plus:
            return "add"
        case .minus:
            return "sub"
        }
    }

    private func descriptor(for operator: MultNode.Operator) -> String {
        switch `operator` {
        case .mult:
            return "mul"
        case .divide:
            return "div"
        case .modulo:
            return "rem"
        }
    }

    private func descriptor(for operator: RelationalNode.Operator) -> String {
        switch `operator` {
        case .less:
            return "lt"
        case .lessOrEqual:
            return "le"
        case .greater:
            return "gt"
        case .greaterOrEqual:
            return "ge"
        }
    }

    private func convertType(_ fromVarType: VarDecNode.VarType, to toVarType: VarDecNode.VarType) -> String {
        guard fromVarType != toVarType else {
            return "; no conversion needed"
        }
        return "\(methodPrefix(for: fromVarType))2\(methodPrefix(for: toVarType))"
    }

}
