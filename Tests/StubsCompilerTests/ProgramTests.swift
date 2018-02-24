//
//  ProgramTests.swift
//  StubsCompilerTests
//
//  Created by Patrick Remy on 07.01.18.
//

import XCTest
import Antlr4
import StubsCompiler

class ProgramTests: XCTestCase {

    func testEmptyProgram() {
        let code = ""

        XCTAssertNoThrow(try Compiler.compile(code))
    }

    func testEmptyObject() {
        let code =
        """
        object Foo {
        }
        """

        XCTAssertNoThrow(try Compiler.compile(code))
    }

    func testNoMainFunction() {
        let code =
        """
        object Foo {
            def foo(args: Array[String]) = {
            }
        }
        """

        XCTAssertNoThrow(try Compiler.compile(code))
    }

    func testFuzzyProgram() throws {
        let code =
        """
        object Fuzzy {
            var a: String = "a";
            var b: String = "b";
            var x: String = "x";
            var y: String = "y";

            def bar(a: Int, b: Double): Double = {
                var x: Array[Double] = Array(0, 2, fuzz(fuzz(fuzz(fuzz(a)))));
                println(foo(a + b));
                println(x);
                return a + x(2) + 2;
            }

            def main(args: Array[String]) = {
                println(bar(0, 8));
            }

            def foo(a: Double): String = {
                var b: Double = 0.00006;

                while(fuzz(a + 9) * 2 < fuzz(8))
                    if(5 < fuzz(-892848234))
                        if((-2 + 9.870 == 6) || (384 + 2 > 884.878) || true && false || true)
                            b = bar(-1, -b * -2);
                        else {
                            b = a + 9;
                        }

                return "bar";
            }

            def fuzz(x: Double): Double = {
                var y: Double = x;
                return (y * 99 + 2 - 1.0) * 9 / 2 - y;
            }
        }
        """

        XCTAssertNoThrow(try Compiler.compile(code))
    }

}
