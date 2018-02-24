//
//  FunctionTests.swift
//  StubsCompilerTests
//
//  Created by Patrick Remy on 23.01.18.
//

import XCTest
import Antlr4
import StubsCompiler

class FunctionTests: XCTestCase {

    func testReturnWithoutExpressionInVoidFunction() {
        let code =
        """
        object Foo {
            def main(args: Array[String]) = {
                return;
            }
        }
        """

        XCTAssertNoThrow(try Compiler.compile(code))
    }

    func testConditionalReturn() {
        let code =
        """
        object Foo {
            def bar(a: Boolean): Boolean = {
                if (a) {
                    return true;
                } else {
                    return false;
                }
            }
            def main(args: Array[String]) = {
                bar(true);
            }
        }
        """

        XCTAssertNoThrow(try Compiler.compile(code))
    }

}
