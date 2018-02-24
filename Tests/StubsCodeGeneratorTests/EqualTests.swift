//
//  EqualTests.swift
//  StubsCodeGeneratorTests
//
//  Created by Patrick Remy on 28.01.18.
//

import XCTest
import Antlr4
@testable import StubsAST
import StubsTypeChecker


class EqualTests: XCTestCase {

    override func setUp() {
        continueAfterFailure = false
    }

    // MARK: - Equals

    func testBooleanEqualsBoolean() {
        let ast = ObjectDecNode(
            "EqualBooleanEqualsBooleanTest",
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
                                EqualNode(
                                    PrimitiveNode(
                                        "true",
                                        ofType: .boolean,
                                        references: CommonToken(0)
                                    ),
                                    equals: PrimitiveNode(
                                        "true",
                                        ofType: .boolean,
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
                                EqualNode(
                                    PrimitiveNode(
                                        "false",
                                        ofType: .boolean,
                                        references: CommonToken(0)
                                    ),
                                    equals: PrimitiveNode(
                                        "false",
                                        ofType: .boolean,
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
                                EqualNode(
                                    PrimitiveNode(
                                        "true",
                                        ofType: .boolean,
                                        references: CommonToken(0)
                                    ),
                                    equals: PrimitiveNode(
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
        XCTAssertNoThrow(try TestSuite.runProgram(url, className: "EqualBooleanEqualsBooleanTest"))
        let output = try! TestSuite.runProgram(url, className: "EqualBooleanEqualsBooleanTest")
        XCTAssertEqual(output, "true\ntrue\nfalse\n")
    }


    func testIntegerEqualsInteger() {
        let ast = ObjectDecNode(
            "EqualIntegerEqualsIntegerTest",
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
                                EqualNode(
                                    PrimitiveNode(
                                        "0",
                                        ofType: .integer,
                                        references: CommonToken(0)
                                    ),
                                    equals: PrimitiveNode(
                                        "0",
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
                                EqualNode(
                                    PrimitiveNode(
                                        "0",
                                        ofType: .integer,
                                        references: CommonToken(0)
                                    ),
                                    equals: PrimitiveNode(
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
                                EqualNode(
                                    PrimitiveNode(
                                        "-1",
                                        ofType: .integer,
                                        references: CommonToken(0)
                                    ),
                                    equals: PrimitiveNode(
                                        "1",
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
        XCTAssertNoThrow(try TestSuite.runProgram(url, className: "EqualIntegerEqualsIntegerTest"))
        let output = try! TestSuite.runProgram(url, className: "EqualIntegerEqualsIntegerTest")
        XCTAssertEqual(output, "true\nfalse\nfalse\n")
    }

    func testIntegerEqualsDouble() {
        let ast = ObjectDecNode(
            "EqualIntegerEqualsDoubleTest",
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
                                EqualNode(
                                    PrimitiveNode(
                                        "0",
                                        ofType: .integer,
                                        references: CommonToken(0)
                                    ),
                                    equals: PrimitiveNode(
                                        "0.0",
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
                                EqualNode(
                                    PrimitiveNode(
                                        "0",
                                        ofType: .integer,
                                        references: CommonToken(0)
                                    ),
                                    equals: PrimitiveNode(
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
                                EqualNode(
                                    PrimitiveNode(
                                        "-1",
                                        ofType: .integer,
                                        references: CommonToken(0)
                                    ),
                                    equals: PrimitiveNode(
                                        "1.0",
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
        XCTAssertNoThrow(try TestSuite.runProgram(url, className: "EqualIntegerEqualsDoubleTest"))
        let output = try! TestSuite.runProgram(url, className: "EqualIntegerEqualsDoubleTest")
        XCTAssertEqual(output, "true\nfalse\nfalse\n")
    }

    func testStringEqualsStringRef() {
        let ast = ObjectDecNode(
            "EqualStringEqualsStringTest",
            variables: [],
            functions: [
                FuncDecNode(
                    "main",
                    parameters: [
                        ("args", .array(of: .string))
                    ],
                    returnType: nil,
                    declarations: [
                        VarDecNode(
                            IdentifierNode(
                                "helloWorld",
                                references: CommonToken(0)
                            ),
                            datatype: .string,
                            assign: PrimitiveNode(
                                "Hello World",
                                ofType: .string,
                                references: CommonToken(0)
                            )
                        )
                    ],
                    statements: [
                        FuncCallNode(
                            IdentifierNode(
                                "println",
                                references: CommonToken(0)
                            ),
                            parameters: [
                                EqualNode(
                                    IdentifierNode(
                                        "helloWorld",
                                        references: CommonToken(0)
                                    ),
                                    equals: IdentifierNode(
                                        "helloWorld",
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
                                EqualNode(
                                    IdentifierNode(
                                        "helloWorld",
                                        references: CommonToken(0)
                                    ),
                                    equals: PrimitiveNode(
                                        "Hello World",
                                        ofType: .string,
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
                                EqualNode(
                                    PrimitiveNode(
                                        "Hello World",
                                        ofType: .string,
                                        references: CommonToken(0)
                                    ),
                                    equals: PrimitiveNode(
                                        "Hello World",
                                        ofType: .string,
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
                                EqualNode(
                                    PrimitiveNode(
                                        "Hello",
                                        ofType: .string,
                                        references: CommonToken(0)
                                    ),
                                    equals: PrimitiveNode(
                                        "World",
                                        ofType: .string,
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
        XCTAssertNoThrow(try TestSuite.runProgram(url, className: "EqualStringEqualsStringTest"))
        let output = try! TestSuite.runProgram(url, className: "EqualStringEqualsStringTest")
        XCTAssertEqual(output, "true\ntrue\ntrue\nfalse\n")
    }

    // MARK: - Not equals

    func testIntegerNotEqualsInteger() {
        let ast = ObjectDecNode(
            "EqualIntegerNotEqualsIntegerTest",
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
                                EqualNode(
                                    PrimitiveNode(
                                        "1",
                                        ofType: .integer,
                                        references: CommonToken(0)
                                    ),
                                    notEquals: PrimitiveNode(
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
                                EqualNode(
                                    PrimitiveNode(
                                        "0",
                                        ofType: .integer,
                                        references: CommonToken(0)
                                    ),
                                    notEquals: PrimitiveNode(
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
                                EqualNode(
                                    PrimitiveNode(
                                        "-1",
                                        ofType: .integer,
                                        references: CommonToken(0)
                                    ),
                                    notEquals: PrimitiveNode(
                                        "1",
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
        XCTAssertNoThrow(try TestSuite.runProgram(url, className: "EqualIntegerNotEqualsIntegerTest"))
        let output = try! TestSuite.runProgram(url, className: "EqualIntegerNotEqualsIntegerTest")
        XCTAssertEqual(output, "false\ntrue\ntrue\n")
    }

    func testIntegerNotEqualsDouble() {
        let ast = ObjectDecNode(
            "EqualIntegerNotEqualsDoubleTest",
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
                                EqualNode(
                                    PrimitiveNode(
                                        "1",
                                        ofType: .integer,
                                        references: CommonToken(0)
                                    ),
                                    notEquals: PrimitiveNode(
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
                                EqualNode(
                                    PrimitiveNode(
                                        "0",
                                        ofType: .integer,
                                        references: CommonToken(0)
                                    ),
                                    notEquals: PrimitiveNode(
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
                                EqualNode(
                                    PrimitiveNode(
                                        "-1",
                                        ofType: .integer,
                                        references: CommonToken(0)
                                    ),
                                    notEquals: PrimitiveNode(
                                        "1.0",
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
        XCTAssertNoThrow(try TestSuite.runProgram(url, className: "EqualIntegerNotEqualsDoubleTest"))
        let output = try! TestSuite.runProgram(url, className: "EqualIntegerNotEqualsDoubleTest")
        XCTAssertEqual(output, "false\ntrue\ntrue\n")
    }

}
