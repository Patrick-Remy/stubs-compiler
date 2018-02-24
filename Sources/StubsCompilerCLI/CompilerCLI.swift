//
//  CompilerCLI.swift
//  StubsCompilerCLI
//
//  Created by Patrick Remy on 12.12.17.
//

import Foundation
import StubsCompiler
import StubsTypeChecker
import Antlr4

public class CompilerCLI {

    enum Error: Swift.Error {
        case missingFileName
        case fileNotFound
        case permissionDenied(for: String)
    }

    private var arguments: [String]
    private var sourceCode: String!
    private var outputFileUrl: URL!
    private let standardOutput = FileHandle.standardOutput
    private let errorOutput = FileHandle.standardOutput

    public init(arguments: [String] = CommandLine.arguments) {
        self.arguments = arguments
    }

    public func run() {
        do {
            try parseArguments()
        } catch let error {
            errorOutput.write("Error: \(error)\n".data(using: .utf8)!)
            printHelp()
            exit(1)
        }

        do {
            let generatedCode: String = try Compiler.compile(sourceCode)
            guard FileManager.default.createFile(atPath: outputFileUrl.absoluteURL.path, contents: nil), FileManager.default.isWritableFile(atPath: outputFileUrl.absoluteURL.path) else {
                throw Error.permissionDenied(for: outputFileUrl.path)
            }
            try generatedCode.write(to: outputFileUrl, atomically: false, encoding: .utf8)
        } catch let error {
            errorOutput.write("Error: \(error)\n".data(using: .utf8)!)
            standardOutput.write(descriptionForError(error).data(using: .utf8)!)
            exit(1)
        }
    }

    private func printHelp() {
        let helpString =
            """

            StubsCompiler v0.0.1
            Usage: StubsCompiler -compile fileName

            """
        standardOutput.write(helpString.data(using: .utf8)!)
    }

    private func parseArguments() throws {
        // Remove self's executable filename
        assert(!arguments.isEmpty)
        arguments.remove(at: 0)

        guard arguments.count > 1, arguments[0] == "-compile" else {
            throw Error.missingFileName
        }

        sourceCode = try String(contentsOfFile: arguments[1], encoding: .utf8)
        outputFileUrl = URL(fileURLWithPath: arguments[1]).deletingPathExtension().appendingPathExtension("j")
    }

    private func descriptionForError(_ error: Swift.Error) -> String {
        var errorString = ""

        if let error = error as? TypeChecker.Error {
            switch error {
            case let .incompatibleTypes(node):
                errorString += "Incompatible types"
                guard node.token != nil else {
                    break
                }
                errorString += " near \(node.token.getLine()):\(node.token.getCharPositionInLine())."
            case let .nonIntegerIndex(node, forVariable: _):
                errorString += "Non integer index for"
                guard node.token != nil else {
                    break
                }
                errorString += " near \(node.token.getLine()):\(node.token.getCharPositionInLine())."
            case .noMainFunction:
                errorString = "Main function is missing."
            case let .noReturnInNonVoidFunction(node):
                guard node.token != nil else {
                    break
                }
                errorString = "No return in non-void function \(node.identifier)."
            case let .wrongReturnType(_, forFunction: funcDecNode):
                errorString = "Wrong return type for function \(funcDecNode.identifier)."
            case let .ambigiousReference(funcCallNode):
                errorString = "Ambigious reference for identifier \(funcCallNode.identifier)"
                guard funcCallNode.token != nil else {
                    break
                }
                errorString += " near \(funcCallNode.token.getLine()):\(funcCallNode.token.getCharPositionInLine())."
            }

            return errorString.appending("\n\n")
        }

        return errorString
    }
}
