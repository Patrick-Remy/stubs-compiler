//
//  FibonacciTests.swift
//  StubsParserTests
//
//  Created by Patrick Remy on 30.12.17.
//

import XCTest
import Antlr4
import StubsLexer
import StubsParser

class FibonacciTests: XCTestCase {

    override func setUp() {
        continueAfterFailure = false
    }

    func testFibonacci() {
        let code =
        """
        object Fibonacci {
            def main(args: Array[String]) = {
                var a: Int = 1;
                var b: Int = 1;
                var temp: Int = 0;
                while (a < 144) {
                    temp = b;
                    b = a + b;
                    a = temp;
                    println(a);
                }
            }
        }
        """

        let inputStream = ANTLRInputStream(code)
        let lexer = StubsLexer(inputStream)
        let tokenStream = CommonTokenStream(lexer)

        let parser: StubsParser! = try? StubsParser(tokenStream)
        XCTAssertNotNil(parser)
        parser.setErrorHandler(BailErrorStrategy())

        XCTAssertNoThrow(try parser.program())
    }

}
