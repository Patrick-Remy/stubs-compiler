//
//  RelationalTests.swift
//  StubsCodeGeneratorTests
//
//  Created by Patrick Remy on 28.01.18.
//

import XCTest
import Antlr4
@testable import StubsAST
import StubsTypeChecker


class RelationalTests: XCTestCase {

    override func setUp() {
        continueAfterFailure = false
    }

    // MARK: - Less

    func testIntegerLessThanInteger() {
        let ast = ObjectDecNode(
            "RelationalIntegerLessThanIntegerTest",
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
                        IfNode(
                            RelationalNode(
                                PrimitiveNode(
                                    "-2",
                                    ofType: .integer,
                                    references: CommonToken(0)
                                ),
                                lessThan: PrimitiveNode(
                                    "1",
                                    ofType: .integer,
                                    references: CommonToken(0)
                                ),
                                references: CommonToken(0)
                            ),
                            then: FuncCallNode(
                                IdentifierNode(
                                    "println",
                                    references: CommonToken(0)
                                ),
                                parameters: [
                                    PrimitiveNode(
                                        "true",
                                        ofType: .string,
                                        references: CommonToken(0)
                                    )
                                ]
                            )
                        ),
                        IfNode(
                            RelationalNode(
                                PrimitiveNode(
                                    "1",
                                    ofType: .integer,
                                    references: CommonToken(0)
                                ),
                                lessThan: PrimitiveNode(
                                    "1",
                                    ofType: .integer,
                                    references: CommonToken(0)
                                ),
                                references: CommonToken(0)
                            ),
                            then: BlockNode([]),
                            else: FuncCallNode(
                                IdentifierNode(
                                    "println",
                                    references: CommonToken(0)
                                ),
                                parameters: [
                                    PrimitiveNode(
                                        "false",
                                        ofType: .string,
                                        references: CommonToken(0)
                                    )
                                ]
                            )
                        ),
                        IfNode(
                            RelationalNode(
                                PrimitiveNode(
                                    "4",
                                    ofType: .integer,
                                    references: CommonToken(0)
                                ),
                                lessThan: PrimitiveNode(
                                    "1",
                                    ofType: .integer,
                                    references: CommonToken(0)
                                ),
                                references: CommonToken(0)
                            ),
                            then: BlockNode([]),
                            else: FuncCallNode(
                                IdentifierNode(
                                    "println",
                                    references: CommonToken(0)
                                ),
                                parameters: [
                                    PrimitiveNode(
                                        "false",
                                        ofType: .string,
                                        references: CommonToken(0)
                                    )
                                ]
                            )
                        )
                    ]
                )
            ]
        )


        XCTAssertNoThrow(try TypeChecker.validate(ast))
        XCTAssertNoThrow(try TestSuite.generateClassFile(ast))
        let url = try! TestSuite.generateClassFile(ast)
        XCTAssertNoThrow(try TestSuite.runProgram(url, className: "RelationalIntegerLessThanIntegerTest"))
        let output = try! TestSuite.runProgram(url, className: "RelationalIntegerLessThanIntegerTest")
        XCTAssertEqual(output, "true\nfalse\nfalse\n")
    }

    func testDoubleLessThanInteger() {
        let ast = ObjectDecNode(
            "RelationalDoubleLessThanIntegerTest",
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
                        IfNode(
                            RelationalNode(
                                PrimitiveNode(
                                    "-2.1",
                                    ofType: .double,
                                    references: CommonToken(0)
                                ),
                                lessThan: PrimitiveNode(
                                    "1",
                                    ofType: .integer,
                                    references: CommonToken(0)
                                ),
                                references: CommonToken(0)
                            ),
                            then: FuncCallNode(
                                IdentifierNode(
                                    "println",
                                    references: CommonToken(0)
                                ),
                                parameters: [
                                    PrimitiveNode(
                                        "true",
                                        ofType: .string,
                                        references: CommonToken(0)
                                    )
                                ]
                            )
                        ),
                        IfNode(
                            RelationalNode(
                                PrimitiveNode(
                                    "1.0",
                                    ofType: .double,
                                    references: CommonToken(0)
                                ),
                                lessThan: PrimitiveNode(
                                    "1",
                                    ofType: .integer,
                                    references: CommonToken(0)
                                ),
                                references: CommonToken(0)
                            ),
                            then: BlockNode([]),
                            else: FuncCallNode(
                                IdentifierNode(
                                    "println",
                                    references: CommonToken(0)
                                ),
                                parameters: [
                                    PrimitiveNode(
                                        "false",
                                        ofType: .string,
                                        references: CommonToken(0)
                                    )
                                ]
                            )
                        ),
                        IfNode(
                            RelationalNode(
                                PrimitiveNode(
                                    "4.5",
                                    ofType: .double,
                                    references: CommonToken(0)
                                ),
                                lessThan: PrimitiveNode(
                                    "1",
                                    ofType: .integer,
                                    references: CommonToken(0)
                                ),
                                references: CommonToken(0)
                            ),
                            then: BlockNode([]),
                            else: FuncCallNode(
                                IdentifierNode(
                                    "println",
                                    references: CommonToken(0)
                                ),
                                parameters: [
                                    PrimitiveNode(
                                        "false",
                                        ofType: .string,
                                        references: CommonToken(0)
                                    )
                                ]
                            )
                        )
                    ]
                )
            ]
        )


        XCTAssertNoThrow(try TypeChecker.validate(ast))
        XCTAssertNoThrow(try TestSuite.generateClassFile(ast))
        let url = try! TestSuite.generateClassFile(ast)
        XCTAssertNoThrow(try TestSuite.runProgram(url, className: "RelationalDoubleLessThanIntegerTest"))
        let output = try! TestSuite.runProgram(url, className: "RelationalDoubleLessThanIntegerTest")
        XCTAssertEqual(output, "true\nfalse\nfalse\n")
    }

    // MARK: - Less or equal

    func testIntegerLessOrEqualThanInteger() {
        let ast = ObjectDecNode(
            "RelationalIntegerLessOrEqualThanIntegerTest",
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
                        IfNode(
                            RelationalNode(
                                PrimitiveNode(
                                    "2",
                                    ofType: .integer,
                                    references: CommonToken(0)
                                ),
                                lessOrEqualThan: PrimitiveNode(
                                    "3",
                                    ofType: .integer,
                                    references: CommonToken(0)
                                ),
                                references: CommonToken(0)
                            ),
                            then: FuncCallNode(
                                IdentifierNode(
                                    "println",
                                    references: CommonToken(0)
                                ),
                                parameters: [
                                    PrimitiveNode(
                                        "true",
                                        ofType: .string,
                                        references: CommonToken(0)
                                    )
                                ]
                            )
                        ),
                        IfNode(
                            RelationalNode(
                                PrimitiveNode(
                                    "3",
                                    ofType: .integer,
                                    references: CommonToken(0)
                                ),
                                lessOrEqualThan: PrimitiveNode(
                                    "3",
                                    ofType: .integer,
                                    references: CommonToken(0)
                                ),
                                references: CommonToken(0)
                            ),
                            then: FuncCallNode(
                                IdentifierNode(
                                    "println",
                                    references: CommonToken(0)
                                ),
                                parameters: [
                                    PrimitiveNode(
                                        "true",
                                        ofType: .string,
                                        references: CommonToken(0)
                                    )
                                ]
                            )
                        ),
                        IfNode(
                            RelationalNode(
                                PrimitiveNode(
                                    "4",
                                    ofType: .integer,
                                    references: CommonToken(0)
                                ),
                                lessOrEqualThan: PrimitiveNode(
                                    "1",
                                    ofType: .integer,
                                    references: CommonToken(0)
                                ),
                                references: CommonToken(0)
                            ),
                            then: BlockNode([]),
                            else: FuncCallNode(
                                IdentifierNode(
                                    "println",
                                    references: CommonToken(0)
                                ),
                                parameters: [
                                    PrimitiveNode(
                                        "false",
                                        ofType: .string,
                                        references: CommonToken(0)
                                    )
                                ]
                            )
                        )
                    ]
                )
            ]
        )


        XCTAssertNoThrow(try TypeChecker.validate(ast))
        XCTAssertNoThrow(try TestSuite.generateClassFile(ast))
        let url = try! TestSuite.generateClassFile(ast)
        XCTAssertNoThrow(try TestSuite.runProgram(url, className: "RelationalIntegerLessOrEqualThanIntegerTest"))
        let output = try! TestSuite.runProgram(url, className: "RelationalIntegerLessOrEqualThanIntegerTest")
        XCTAssertEqual(output, "true\ntrue\nfalse\n")
    }

    func testDoubleLessOrEqualThanInteger() {
        let ast = ObjectDecNode(
            "RelationalDoubleLessOrEqualThanIntegerTest",
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
                        IfNode(
                            RelationalNode(
                                PrimitiveNode(
                                    "-2.0",
                                    ofType: .double,
                                    references: CommonToken(0)
                                ),
                                lessOrEqualThan: PrimitiveNode(
                                    "2",
                                    ofType: .integer,
                                    references: CommonToken(0)
                                ),
                                references: CommonToken(0)
                            ),
                            then: FuncCallNode(
                                IdentifierNode(
                                    "println",
                                    references: CommonToken(0)
                                ),
                                parameters: [
                                    PrimitiveNode(
                                        "true",
                                        ofType: .string,
                                        references: CommonToken(0)
                                    )
                                ]
                            )
                        ),
                        IfNode(
                            RelationalNode(
                                PrimitiveNode(
                                    "-2.0",
                                    ofType: .double,
                                    references: CommonToken(0)
                                ),
                                lessOrEqualThan: PrimitiveNode(
                                    "-2",
                                    ofType: .integer,
                                    references: CommonToken(0)
                                ),
                                references: CommonToken(0)
                            ),
                            then: FuncCallNode(
                                IdentifierNode(
                                    "println",
                                    references: CommonToken(0)
                                ),
                                parameters: [
                                    PrimitiveNode(
                                        "true",
                                        ofType: .string,
                                        references: CommonToken(0)
                                    )
                                ]
                            )
                        ),
                        IfNode(
                            RelationalNode(
                                PrimitiveNode(
                                    "4.5",
                                    ofType: .double,
                                    references: CommonToken(0)
                                ),
                                lessOrEqualThan: PrimitiveNode(
                                    "1",
                                    ofType: .integer,
                                    references: CommonToken(0)
                                ),
                                references: CommonToken(0)
                            ),
                            then: BlockNode([]),
                            else: FuncCallNode(
                                IdentifierNode(
                                    "println",
                                    references: CommonToken(0)
                                ),
                                parameters: [
                                    PrimitiveNode(
                                        "false",
                                        ofType: .string,
                                        references: CommonToken(0)
                                    )
                                ]
                            )
                        )
                    ]
                )
            ]
        )


        XCTAssertNoThrow(try TypeChecker.validate(ast))
        XCTAssertNoThrow(try TestSuite.generateClassFile(ast))
        let url = try! TestSuite.generateClassFile(ast)
        XCTAssertNoThrow(try TestSuite.runProgram(url, className: "RelationalDoubleLessOrEqualThanIntegerTest"))
        let output = try! TestSuite.runProgram(url, className: "RelationalDoubleLessOrEqualThanIntegerTest")
        XCTAssertEqual(output, "true\ntrue\nfalse\n")
    }

    // MARK: - Greater

    func testIntegerGreaterThanInteger() {
        let ast = ObjectDecNode(
            "RelationalIntegerGreaterThanIntegerTest",
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
                        IfNode(
                            RelationalNode(
                                PrimitiveNode(
                                    "2",
                                    ofType: .integer,
                                    references: CommonToken(0)
                                ),
                                greaterThan: PrimitiveNode(
                                    "-3",
                                    ofType: .integer,
                                    references: CommonToken(0)
                                ),
                                references: CommonToken(0)
                            ),
                            then: FuncCallNode(
                                IdentifierNode(
                                    "println",
                                    references: CommonToken(0)
                                ),
                                parameters: [
                                    PrimitiveNode(
                                        "true",
                                        ofType: .string,
                                        references: CommonToken(0)
                                    )
                                ]
                            )
                        ),
                        IfNode(
                            RelationalNode(
                                PrimitiveNode(
                                    "1",
                                    ofType: .integer,
                                    references: CommonToken(0)
                                ),
                                greaterThan: PrimitiveNode(
                                    "1",
                                    ofType: .integer,
                                    references: CommonToken(0)
                                ),
                                references: CommonToken(0)
                            ),
                            then: BlockNode([]),
                            else: FuncCallNode(
                                IdentifierNode(
                                    "println",
                                    references: CommonToken(0)
                                ),
                                parameters: [
                                    PrimitiveNode(
                                        "false",
                                        ofType: .string,
                                        references: CommonToken(0)
                                    )
                                ]
                            )
                        ),
                        IfNode(
                            RelationalNode(
                                PrimitiveNode(
                                    "1",
                                    ofType: .integer,
                                    references: CommonToken(0)
                                ),
                                greaterThan: PrimitiveNode(
                                    "4",
                                    ofType: .integer,
                                    references: CommonToken(0)
                                ),
                                references: CommonToken(0)
                            ),
                            then: BlockNode([]),
                            else: FuncCallNode(
                                IdentifierNode(
                                    "println",
                                    references: CommonToken(0)
                                ),
                                parameters: [
                                    PrimitiveNode(
                                        "false",
                                        ofType: .string,
                                        references: CommonToken(0)
                                    )
                                ]
                            )
                        )
                    ]
                )
            ]
        )


        XCTAssertNoThrow(try TypeChecker.validate(ast))
        XCTAssertNoThrow(try TestSuite.generateClassFile(ast))
        let url = try! TestSuite.generateClassFile(ast)
        XCTAssertNoThrow(try TestSuite.runProgram(url, className: "RelationalIntegerGreaterThanIntegerTest"))
        let output = try! TestSuite.runProgram(url, className: "RelationalIntegerGreaterThanIntegerTest")
        XCTAssertEqual(output, "true\nfalse\nfalse\n")
    }

    func testDoubleGreaterThanInteger() {
        let ast = ObjectDecNode(
            "RelationalDoubleGreaterThanIntegerTest",
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
                        IfNode(
                            RelationalNode(
                                PrimitiveNode(
                                    "2.1",
                                    ofType: .double,
                                    references: CommonToken(0)
                                ),
                                greaterThan: PrimitiveNode(
                                    "-4",
                                    ofType: .integer,
                                    references: CommonToken(0)
                                ),
                                references: CommonToken(0)
                            ),
                            then: FuncCallNode(
                                IdentifierNode(
                                    "println",
                                    references: CommonToken(0)
                                ),
                                parameters: [
                                    PrimitiveNode(
                                        "true",
                                        ofType: .string,
                                        references: CommonToken(0)
                                    )
                                ]
                            )
                        ),
                        IfNode(
                            RelationalNode(
                                PrimitiveNode(
                                    "1.0",
                                    ofType: .double,
                                    references: CommonToken(0)
                                ),
                                greaterThan: PrimitiveNode(
                                    "1",
                                    ofType: .integer,
                                    references: CommonToken(0)
                                ),
                                references: CommonToken(0)
                            ),
                            then: BlockNode([]),
                            else: FuncCallNode(
                                IdentifierNode(
                                    "println",
                                    references: CommonToken(0)
                                ),
                                parameters: [
                                    PrimitiveNode(
                                        "false",
                                        ofType: .string,
                                        references: CommonToken(0)
                                    )
                                ]
                            )
                        ),
                        IfNode(
                            RelationalNode(
                                PrimitiveNode(
                                    "1.5",
                                    ofType: .double,
                                    references: CommonToken(0)
                                ),
                                greaterThan: PrimitiveNode(
                                    "4",
                                    ofType: .integer,
                                    references: CommonToken(0)
                                ),
                                references: CommonToken(0)
                            ),
                            then: BlockNode([]),
                            else: FuncCallNode(
                                IdentifierNode(
                                    "println",
                                    references: CommonToken(0)
                                ),
                                parameters: [
                                    PrimitiveNode(
                                        "false",
                                        ofType: .string,
                                        references: CommonToken(0)
                                    )
                                ]
                            )
                        )
                    ]
                )
            ]
        )


        XCTAssertNoThrow(try TypeChecker.validate(ast))
        XCTAssertNoThrow(try TestSuite.generateClassFile(ast))
        let url = try! TestSuite.generateClassFile(ast)
        XCTAssertNoThrow(try TestSuite.runProgram(url, className: "RelationalDoubleGreaterThanIntegerTest"))
        let output = try! TestSuite.runProgram(url, className: "RelationalDoubleGreaterThanIntegerTest")
        XCTAssertEqual(output, "true\nfalse\nfalse\n")
    }

    // MARK: - Greater or equal

    func testIntegerGreaterOrEqualThanInteger() {
        let ast = ObjectDecNode(
            "RelationalIntegerGreaterOrEqualThanIntegerTest",
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
                        IfNode(
                            RelationalNode(
                                PrimitiveNode(
                                    "3",
                                    ofType: .integer,
                                    references: CommonToken(0)
                                ),
                                greaterOrEqualThan: PrimitiveNode(
                                    "2",
                                    ofType: .integer,
                                    references: CommonToken(0)
                                ),
                                references: CommonToken(0)
                            ),
                            then: FuncCallNode(
                                IdentifierNode(
                                    "println",
                                    references: CommonToken(0)
                                ),
                                parameters: [
                                    PrimitiveNode(
                                        "true",
                                        ofType: .string,
                                        references: CommonToken(0)
                                    )
                                ]
                            )
                        ),
                        IfNode(
                            RelationalNode(
                                PrimitiveNode(
                                    "3",
                                    ofType: .integer,
                                    references: CommonToken(0)
                                ),
                                greaterOrEqualThan: PrimitiveNode(
                                    "3",
                                    ofType: .integer,
                                    references: CommonToken(0)
                                ),
                                references: CommonToken(0)
                            ),
                            then: FuncCallNode(
                                IdentifierNode(
                                    "println",
                                    references: CommonToken(0)
                                ),
                                parameters: [
                                    PrimitiveNode(
                                        "true",
                                        ofType: .string,
                                        references: CommonToken(0)
                                    )
                                ]
                            )
                        ),
                        IfNode(
                            RelationalNode(
                                PrimitiveNode(
                                    "1",
                                    ofType: .integer,
                                    references: CommonToken(0)
                                ),
                                greaterOrEqualThan: PrimitiveNode(
                                    "4",
                                    ofType: .integer,
                                    references: CommonToken(0)
                                ),
                                references: CommonToken(0)
                            ),
                            then: BlockNode([]),
                            else: FuncCallNode(
                                IdentifierNode(
                                    "println",
                                    references: CommonToken(0)
                                ),
                                parameters: [
                                    PrimitiveNode(
                                        "false",
                                        ofType: .string,
                                        references: CommonToken(0)
                                    )
                                ]
                            )
                        )
                    ]
                )
            ]
        )


        XCTAssertNoThrow(try TypeChecker.validate(ast))
        XCTAssertNoThrow(try TestSuite.generateClassFile(ast))
        let url = try! TestSuite.generateClassFile(ast)
        XCTAssertNoThrow(try TestSuite.runProgram(url, className: "RelationalIntegerGreaterOrEqualThanIntegerTest"))
        let output = try! TestSuite.runProgram(url, className: "RelationalIntegerGreaterOrEqualThanIntegerTest")
        XCTAssertEqual(output, "true\ntrue\nfalse\n")
    }

    func testDoubleGreaterOrEqualThanInteger() {
        let ast = ObjectDecNode(
            "RelationalDoubleGreaterOrEqualThanIntegerTest",
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
                        IfNode(
                            RelationalNode(
                                PrimitiveNode(
                                    "2.0",
                                    ofType: .double,
                                    references: CommonToken(0)
                                ),
                                greaterOrEqualThan: PrimitiveNode(
                                    "-2",
                                    ofType: .integer,
                                    references: CommonToken(0)
                                ),
                                references: CommonToken(0)
                            ),
                            then: FuncCallNode(
                                IdentifierNode(
                                    "println",
                                    references: CommonToken(0)
                                ),
                                parameters: [
                                    PrimitiveNode(
                                        "true",
                                        ofType: .string,
                                        references: CommonToken(0)
                                    )
                                ]
                            )
                        ),
                        IfNode(
                            RelationalNode(
                                PrimitiveNode(
                                    "-2.0",
                                    ofType: .double,
                                    references: CommonToken(0)
                                ),
                                greaterOrEqualThan: PrimitiveNode(
                                    "-2",
                                    ofType: .integer,
                                    references: CommonToken(0)
                                ),
                                references: CommonToken(0)
                            ),
                            then: FuncCallNode(
                                IdentifierNode(
                                    "println",
                                    references: CommonToken(0)
                                ),
                                parameters: [
                                    PrimitiveNode(
                                        "true",
                                        ofType: .string,
                                        references: CommonToken(0)
                                    )
                                ]
                            )
                        ),
                        IfNode(
                            RelationalNode(
                                PrimitiveNode(
                                    "1.5",
                                    ofType: .double,
                                    references: CommonToken(0)
                                ),
                                greaterOrEqualThan: PrimitiveNode(
                                    "4",
                                    ofType: .integer,
                                    references: CommonToken(0)
                                ),
                                references: CommonToken(0)
                            ),
                            then: BlockNode([]),
                            else: FuncCallNode(
                                IdentifierNode(
                                    "println",
                                    references: CommonToken(0)
                                ),
                                parameters: [
                                    PrimitiveNode(
                                        "false",
                                        ofType: .string,
                                        references: CommonToken(0)
                                    )
                                ]
                            )
                        )
                    ]
                )
            ]
        )


        XCTAssertNoThrow(try TypeChecker.validate(ast))
        XCTAssertNoThrow(try TestSuite.generateClassFile(ast))
        let url = try! TestSuite.generateClassFile(ast)
        XCTAssertNoThrow(try TestSuite.runProgram(url, className: "RelationalDoubleGreaterOrEqualThanIntegerTest"))
        let output = try! TestSuite.runProgram(url, className: "RelationalDoubleGreaterOrEqualThanIntegerTest")
        XCTAssertEqual(output, "true\ntrue\nfalse\n")
    }

}
