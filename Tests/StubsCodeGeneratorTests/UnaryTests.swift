//
//  UnaryTests.swift
//  StubsCodeGeneratorTests
//
//  Created by Patrick Remy on 16.02.18.
//

import XCTest
import Antlr4
@testable import StubsAST
import StubsTypeChecker


class UnaryTests: XCTestCase {

    override func setUp() {
        continueAfterFailure = false
    }

    // MARK: - Not

    func testNotTrue() {
        let ast = ObjectDecNode(
            "UnaryNotTrueTest",
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
                                UnaryNode(
                                    not: PrimitiveNode(
                                        "true",
                                        ofType: .boolean,
                                        references: CommonToken(0)
                                    ),
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
        XCTAssertNoThrow(try TestSuite.runProgram(url, className: "UnaryNotTrueTest"))
        let output = try! TestSuite.runProgram(url, className: "UnaryNotTrueTest")
        XCTAssertEqual(output, "false\n")
    }

    func testNotFalse() {
        let ast = ObjectDecNode(
            "UnaryNotFalseTest",
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
                                UnaryNode(
                                    not: PrimitiveNode(
                                        "false",
                                        ofType: .boolean,
                                        references: CommonToken(0)
                                    ),
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
        XCTAssertNoThrow(try TestSuite.runProgram(url, className: "UnaryNotFalseTest"))
        let output = try! TestSuite.runProgram(url, className: "UnaryNotFalseTest")
        XCTAssertEqual(output, "true\n")
    }

    // MARK: - Negate

    func testMinusInteger() {
        let ast = ObjectDecNode(
            "UnaryMinusIntegerTest",
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
                                UnaryNode(
                                    minus: PrimitiveNode(
                                        "1",
                                        ofType: .integer,
                                        references: CommonToken(0)
                                    ),
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
                                UnaryNode(
                                    minus: PrimitiveNode(
                                        "-1",
                                        ofType: .integer,
                                        references: CommonToken(0)
                                    ),
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
        XCTAssertNoThrow(try TestSuite.runProgram(url, className: "UnaryMinusIntegerTest"))
        let output = try! TestSuite.runProgram(url, className: "UnaryMinusIntegerTest")
        XCTAssertEqual(output, "-1\n1\n")
    }

    func testMinusDouble() {
        let ast = ObjectDecNode(
            "UnaryMinusDoubleTest",
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
                                UnaryNode(
                                    minus: PrimitiveNode(
                                        "1.0",
                                        ofType: .double,
                                        references: CommonToken(0)
                                    ),
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
                                UnaryNode(
                                    minus: PrimitiveNode(
                                        "-1.0",
                                        ofType: .double,
                                        references: CommonToken(0)
                                    ),
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
        XCTAssertNoThrow(try TestSuite.runProgram(url, className: "UnaryMinusDoubleTest"))
        let output = try! TestSuite.runProgram(url, className: "UnaryMinusDoubleTest")
        XCTAssertEqual(output, "-1.0\n1.0\n")
    }

    // MARK: - Plus

    func testPlusInteger() {
        let ast = ObjectDecNode(
            "UnaryPlusIntegerTest",
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
                                UnaryNode(
                                    plus: PrimitiveNode(
                                        "1",
                                        ofType: .integer,
                                        references: CommonToken(0)
                                    ),
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
                                UnaryNode(
                                    plus: PrimitiveNode(
                                        "-1",
                                        ofType: .integer,
                                        references: CommonToken(0)
                                    ),
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
        XCTAssertNoThrow(try TestSuite.runProgram(url, className: "UnaryPlusIntegerTest"))
        let output = try! TestSuite.runProgram(url, className: "UnaryPlusIntegerTest")
        XCTAssertEqual(output, "1\n-1\n")
    }

    func testPlusDouble() {
        let ast = ObjectDecNode(
            "UnaryPlusDoubleTest",
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
                                UnaryNode(
                                    plus: PrimitiveNode(
                                        "1.0",
                                        ofType: .double,
                                        references: CommonToken(0)
                                    ),
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
                                UnaryNode(
                                    plus: PrimitiveNode(
                                        "-1.0",
                                        ofType: .double,
                                        references: CommonToken(0)
                                    ),
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
        XCTAssertNoThrow(try TestSuite.runProgram(url, className: "UnaryPlusDoubleTest"))
        let output = try! TestSuite.runProgram(url, className: "UnaryPlusDoubleTest")
        XCTAssertEqual(output, "1.0\n-1.0\n")
    }

}
