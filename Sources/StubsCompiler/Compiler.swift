//
//  Compiler.swift
//  StubsCompiler
//
//  Created by Patrick Remy on 12.12.17.
//

import Foundation
import Antlr4
import StubsParser
import StubsLexer
import StubsAST
import StubsTypeChecker
import StubsCodeGenerator

public class Compiler {

    public class func compile(_ code: String) throws -> String {
        let inputStream = ANTLRInputStream(code)
        let lexer = StubsLexer(inputStream)
        let tokenStream = CommonTokenStream(lexer)

        let parser = try StubsParser(tokenStream)
        parser.setErrorHandler(BailErrorStrategy())
        let parseTree = try parser.program()

        guard let ast = ASTGenerator.generate(from: parseTree) else {
            return ""
        }
        try TypeChecker.validate(ast)
        return CodeGenerator.generate(for: ast)
    }

}
