//
//  ArrayTests.swift
//  StubsParserTests
//
//  Created by Patrick Remy on 07.01.18.
//

import XCTest
import Antlr4
import StubsLexer
import StubsParser


class ArrayTests: XCTestCase {

    override func setUp() {
        continueAfterFailure = false
    }
    
    func testArrayDeclaration() {
        let code =
        """
        object ArrayDeclaration {
            def main(args: Array[String]) = {
                var intArr: Array[Int] = Array(1, 2, 3);
                var stringArr: Array[String] = Array("1", "2", "3");
                var booleanArr: Array[Boolean] = Array(true, false, true);
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

    func testArrayReference() {
        let code =
        """
        object ArrayReference {
            def foo(): Int = {
                return 0;
            }

            def main(args: Array[String]) = {
                var arr: Array[Int] = Array(1, 2, 3);
                var a: Int = 0;
                var b: Int = 1;

                arr(0);
                arr(a);
                arr(a + b);
                arr(foo());
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

    func testArrayAssignment() {
        let code =
        """
        object ArrayReference {
            def foo(): Int = {
                return 0;
            }

            def main(args: Array[String]) = {
                var arr: Array[Int] = Array(1, 2, 3);
                arr(0) = 4;
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
