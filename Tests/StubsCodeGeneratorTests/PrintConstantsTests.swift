//
//  PrintConstantsTests.swift
//  StubsCodeGeneratorTests
//
//  Created by Patrick Remy on 27.01.18.
//

import XCTest
import Antlr4
@testable import StubsAST
import StubsTypeChecker


class PrintConstantsTests: XCTestCase {

    override func setUp() {
        continueAfterFailure = false
    }

    func testBoolean() {
        let ast = ObjectDecNode(
            "PrintConstantBooleanTest",
            variables: [],
            functions: [
                FuncDecNode(
                    "main",
                    parameters: [
                        ("args", .array(of: .string))
                    ],
                    returnType: nil,
                    declarations: [],
                    statements: [
                        FuncCallNode(
                            IdentifierNode(
                                "println",
                                references: CommonToken(0)
                            ),
                            parameters: [
                                PrimitiveNode(
                                    "true",
                                    ofType: .boolean,
                                    references: CommonToken(0)
                                )
                            ]
                        ),
                        FuncCallNode(
                            IdentifierNode(
                                "println",
                                references: CommonToken(0)
                            ),
                            parameters: [
                                PrimitiveNode(
                                    "false",
                                    ofType: .boolean,
                                    references: CommonToken(0)
                                )
                            ]
                        )
                    ]
                )
            ]
        )

        XCTAssertNoThrow(try TypeChecker.validate(ast))
        XCTAssertNoThrow(try TestSuite.generateClassFile(ast))
        let url = try! TestSuite.generateClassFile(ast)
        XCTAssertNoThrow(try TestSuite.runProgram(url, className: "PrintConstantBooleanTest"))
        let output = try! TestSuite.runProgram(url, className: "PrintConstantBooleanTest")
        XCTAssertEqual(output, "true\nfalse\n")
    }

    func testString() {
        let ast = ObjectDecNode(
            "PrintConstantStringTest",
            variables: [],
            functions: [
                FuncDecNode(
                    "main",
                    parameters: [
                        ("args", .array(of: .string))
                    ],
                    returnType: nil,
                    declarations: [],
                    statements: [
                        FuncCallNode(
                            IdentifierNode(
                                "println",
                                references: CommonToken(0)
                            ),
                            parameters: [
                                PrimitiveNode(
                                    "Hello World",
                                    ofType: .string,
                                    references: CommonToken(0)
                                )
                            ]
                        )
                    ]
                )
            ]
        )

        XCTAssertNoThrow(try TypeChecker.validate(ast))
        XCTAssertNoThrow(try TestSuite.generateClassFile(ast))
        let url = try! TestSuite.generateClassFile(ast)
        XCTAssertNoThrow(try TestSuite.runProgram(url, className: "PrintConstantStringTest"))
        let output = try! TestSuite.runProgram(url, className: "PrintConstantStringTest")
        XCTAssertEqual(output, "Hello World\n")
    }

    func testInteger() {
        let ast = ObjectDecNode(
            "PrintConstantIntegerTest",
            variables: [],
            functions: [
                FuncDecNode(
                    "main",
                    parameters: [
                        ("args", .array(of: .string))
                    ],
                    returnType: nil,
                    declarations: [],
                    statements: [
                        FuncCallNode(
                            IdentifierNode(
                                "println",
                                references: CommonToken(0)
                            ),
                            parameters: [
                                PrimitiveNode(
                                    "42",
                                    ofType: .integer,
                                    references: CommonToken(0)
                                )
                            ]
                        )
                    ]
                )
            ]
        )

        XCTAssertNoThrow(try TypeChecker.validate(ast))
        XCTAssertNoThrow(try TestSuite.generateClassFile(ast))
        let url = try! TestSuite.generateClassFile(ast)
        XCTAssertNoThrow(try TestSuite.runProgram(url, className: "PrintConstantIntegerTest"))
        let output = try! TestSuite.runProgram(url, className: "PrintConstantIntegerTest")
        XCTAssertEqual(output, "42\n")
    }

    func testDouble() {
        let ast = ObjectDecNode(
            "PrintConstantDoubleTest",
            variables: [],
            functions: [
                FuncDecNode(
                    "main",
                    parameters: [
                        ("args", .array(of: .string))
                    ],
                    returnType: nil,
                    declarations: [],
                    statements: [
                        FuncCallNode(
                            IdentifierNode(
                                "println",
                                references: CommonToken(0)
                            ),
                            parameters: [
                                PrimitiveNode(
                                    "42.0",
                                    ofType: .double,
                                    references: CommonToken(0)
                                )
                            ]
                        )
                    ]
                )
            ]
        )

        XCTAssertNoThrow(try TypeChecker.validate(ast))
        XCTAssertNoThrow(try TestSuite.generateClassFile(ast))
        let url = try! TestSuite.generateClassFile(ast)
        XCTAssertNoThrow(try TestSuite.runProgram(url, className: "PrintConstantDoubleTest"))
        let output = try! TestSuite.runProgram(url, className: "PrintConstantDoubleTest")
        XCTAssertEqual(output, "42.0\n")
    }

}
