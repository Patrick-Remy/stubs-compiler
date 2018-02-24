//
//  FibonacciTests.swift
//  StubsCompilerTests
//
//  Created by Patrick Remy on 30.12.17.
//

import XCTest
import StubsCompiler

class FibonacciTests: XCTestCase {

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

        XCTAssertNoThrow(try Compiler.compile(code))
    }

    func testRecursiveFibonacci() {
        // Modified version from Peter Braun
        // Source: https://peter-braun.org/de/2012/06/fibonacci-numbers-in-scala/
        let code =
        """
        object Fibonacci {
            def fib(n: Int): Int = {
                var a: Int = 0;
                var b: Int = 1;
                var i: Int = 0;
                var c: Int = 0;

                while(i < n) {
                    c = a + b;
                    a = b;
                    b = c;
                    i = i + 1;
                }
                return a;
            }

            def main(args: Array[String]) = {
                println(fib(100));
            }
        }
        """

        XCTAssertNoThrow(try Compiler.compile(code))
    }

}
