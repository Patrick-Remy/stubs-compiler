//
//  ProgramTests.swift
//  StubsParserTests
//
//  Created by Patrick Remy on 07.01.18.
//

import XCTest
import Antlr4
import StubsLexer
import StubsParser

class ProgramTests: XCTestCase {

    override func setUp() {
        continueAfterFailure = false
    }
    
    func testEmptyProgram() {
        let code = ""

        let inputStream = ANTLRInputStream(code)
        let lexer = StubsLexer(inputStream)
        let tokenStream = CommonTokenStream(lexer)

        let parser: StubsParser! = try? StubsParser(tokenStream)
        XCTAssertNotNil(parser)
        parser.setErrorHandler(BailErrorStrategy())

        XCTAssertNoThrow(try parser.program())
    }
    
}
