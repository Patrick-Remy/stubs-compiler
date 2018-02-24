//
//  AddTests.swift
//  StubsCodeGeneratorTests
//
//  Created by Patrick Remy on 27.01.18.
//

import XCTest
import Antlr4
@testable import StubsAST
import StubsTypeChecker


class AddTests: XCTestCase {

    override func setUp() {
        continueAfterFailure = false
    }

    // MARK: - Plus

    func testIntegerPlusInteger() {
        let ast = ObjectDecNode(
            "AddIntegerPlusIntegerTest",
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
                                AdditiveNode(
                                    PrimitiveNode(
                                        "1",
                                        ofType: .integer,
                                        references: CommonToken(0)
                                    ),
                                    plus: PrimitiveNode(
                                        "-3",
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
        XCTAssertNoThrow(try TestSuite.runProgram(url, className: "AddIntegerPlusIntegerTest"))
        let output = try! TestSuite.runProgram(url, className: "AddIntegerPlusIntegerTest")
        XCTAssertEqual(output, "-2\n")
    }

    func testIntegerPlusDouble() {
        let ast = ObjectDecNode(
            "AddIntegerPlusDoubleTest",
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
                                AdditiveNode(
                                    PrimitiveNode(
                                        "1",
                                        ofType: .integer,
                                        references: CommonToken(0)
                                    ),
                                    plus: PrimitiveNode(
                                        "3.2",
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
        XCTAssertNoThrow(try TestSuite.runProgram(url, className: "AddIntegerPlusDoubleTest"))
        let output: String! = try! TestSuite.runProgram(url, className: "AddIntegerPlusDoubleTest")
        XCTAssertNotNil(output)
        let outputNumber: Double! = Double(output.trimmingCharacters(in: .whitespacesAndNewlines))
        XCTAssertNotNil(outputNumber)
        XCTAssertEqual((outputNumber * 10).rounded() / 10, 4.2)
    }

    func testDoublePlusInteger() {
        let ast = ObjectDecNode(
            "AddDoublePlusIntegerTest",
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
                                AdditiveNode(
                                    PrimitiveNode(
                                        "1.2",
                                        ofType: .double,
                                        references: CommonToken(0)
                                    ),
                                    plus: PrimitiveNode(
                                        "3",
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
        XCTAssertNoThrow(try TestSuite.runProgram(url, className: "AddDoublePlusIntegerTest"))
        let output: String! = try! TestSuite.runProgram(url, className: "AddDoublePlusIntegerTest")
        XCTAssertNotNil(output)
        let outputNumber: Double! = Double(output.trimmingCharacters(in: .whitespacesAndNewlines))
        XCTAssertNotNil(outputNumber)
        XCTAssertEqual((outputNumber * 10).rounded() / 10, 4.2)
    }

    func testDoublePlusDouble() {
        let ast = ObjectDecNode(
            "AddDoublePlusDoubleTest",
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
                                AdditiveNode(
                                    PrimitiveNode(
                                        "1.1",
                                        ofType: .double,
                                        references: CommonToken(0)
                                    ),
                                    plus: PrimitiveNode(
                                        "3.1",
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
        XCTAssertNoThrow(try TestSuite.runProgram(url, className: "AddDoublePlusDoubleTest"))
        let output: String! = try! TestSuite.runProgram(url, className: "AddDoublePlusDoubleTest")
        XCTAssertNotNil(output)
        let outputNumber: Double! = Double(output.trimmingCharacters(in: .whitespacesAndNewlines))
        XCTAssertNotNil(outputNumber)
        XCTAssertEqual((outputNumber * 10).rounded() / 10, 4.2)
    }

    // MARK: - Minus

    func testIntegerMinusInteger() {
        let ast = ObjectDecNode(
            "AddIntegerMinusIntegerTest",
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
                                AdditiveNode(
                                    PrimitiveNode(
                                        "1",
                                        ofType: .integer,
                                        references: CommonToken(0)
                                    ),
                                    minus: PrimitiveNode(
                                        "3",
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
        XCTAssertNoThrow(try TestSuite.runProgram(url, className: "AddIntegerMinusIntegerTest"))
        let output = try! TestSuite.runProgram(url, className: "AddIntegerMinusIntegerTest")
        XCTAssertEqual(output, "-2\n")
    }

    func testIntegerMinusDouble() {
        let ast = ObjectDecNode(
            "AddIntegerMinusDoubleTest",
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
                                AdditiveNode(
                                    PrimitiveNode(
                                        "1",
                                        ofType: .integer,
                                        references: CommonToken(0)
                                    ),
                                    minus: PrimitiveNode(
                                        "3.2",
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
        XCTAssertNoThrow(try TestSuite.runProgram(url, className: "AddIntegerMinusDoubleTest"))
        let output: String! = try! TestSuite.runProgram(url, className: "AddIntegerMinusDoubleTest")
        XCTAssertNotNil(output)
        let outputNumber: Double! = Double(output.trimmingCharacters(in: .whitespacesAndNewlines))
        XCTAssertNotNil(outputNumber)
        XCTAssertEqual((outputNumber * 10).rounded() / 10, -2.2)
    }

    func testDoubleMinusInteger() {
        let ast = ObjectDecNode(
            "AddDoubleMinusIntegerTest",
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
                                AdditiveNode(
                                    PrimitiveNode(
                                        "1.8",
                                        ofType: .double,
                                        references: CommonToken(0)
                                    ),
                                    minus: PrimitiveNode(
                                        "4",
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
        XCTAssertNoThrow(try TestSuite.runProgram(url, className: "AddDoubleMinusIntegerTest"))
        let output: String! = try! TestSuite.runProgram(url, className: "AddDoubleMinusIntegerTest")
        XCTAssertNotNil(output)
        let outputNumber: Double! = Double(output.trimmingCharacters(in: .whitespacesAndNewlines))
        XCTAssertNotNil(outputNumber)
        XCTAssertEqual((outputNumber * 10).rounded() / 10, -2.2)
    }

    func testDoubleMinusDouble() {
        let ast = ObjectDecNode(
            "AddDoubleMinusDoubleTest",
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
                                AdditiveNode(
                                    PrimitiveNode(
                                        "-1.2",
                                        ofType: .double,
                                        references: CommonToken(0)
                                    ),
                                    minus: PrimitiveNode(
                                        "-3.4",
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
        XCTAssertNoThrow(try TestSuite.runProgram(url, className: "AddDoubleMinusDoubleTest"))
        let output: String! = try! TestSuite.runProgram(url, className: "AddDoubleMinusDoubleTest")
        XCTAssertNotNil(output)
        let outputNumber: Double! = Double(output.trimmingCharacters(in: .whitespacesAndNewlines))
        XCTAssertNotNil(outputNumber)
        XCTAssertEqual((outputNumber * 10).rounded() / 10, 2.2)
    }

}
