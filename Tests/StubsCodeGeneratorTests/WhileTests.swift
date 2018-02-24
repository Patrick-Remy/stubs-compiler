//
//  WhileTests.swift
//  StubsCodeGeneratorTests
//
//  Created by Patrick Remy on 27.01.18.
//

import XCTest
import Antlr4
@testable import StubsAST
import StubsTypeChecker


class WhileTests: XCTestCase {

    override func setUp() {
        continueAfterFailure = false
    }
    
    func testEndlessLoop() {
        let ast = ObjectDecNode(
            "WhileEndlessLoopTest",
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
                        WhileNode(
                            PrimitiveNode(
                                "true",
                                ofType: .boolean,
                                references: CommonToken(0)
                            ),
                            do: BlockNode([])
                        )
                    ]
                )
            ]
        )

        XCTAssertNoThrow(try TypeChecker.validate(ast))
        XCTAssertNoThrow(try TestSuite.generateClassFile(ast))
        let url = try! TestSuite.generateClassFile(ast)
        XCTAssertThrowsError(try TestSuite.runProgram(url, className: "WhileEndlessLoopTest"))
    }

    func testNotExecutedLoop() {
        let ast = ObjectDecNode(
            "WhileNotExecutedTest",
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
                        WhileNode(
                            PrimitiveNode(
                                "false",
                                ofType: .boolean,
                                references: CommonToken(0)
                            ),
                            do: BlockNode(
                                [
                                    FuncCallNode(
                                        IdentifierNode(
                                            "println",
                                            references: CommonToken(0)
                                        ),
                                        parameters: [
                                            PrimitiveNode(
                                                "Failed!",
                                                ofType: .string,
                                                references: CommonToken(0)
                                            )
                                        ]
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
        XCTAssertNoThrow(try TestSuite.runProgram(url, className: "WhileNotExecutedTest"))
        let output = try! TestSuite.runProgram(url, className: "WhileNotExecutedTest")
        XCTAssertEqual(output, "")
    }

    func testFalseRelationalExpressionNotExecuted() {
        let ast = ObjectDecNode(
            "WhileFalseRelationalExpressionNotExecutedTest",
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
                        WhileNode(
                            RelationalNode(
                                PrimitiveNode(
                                    "4",
                                    ofType: .integer,
                                    references: CommonToken(0)
                                ),
                                lessThan: PrimitiveNode(
                                    "2",
                                    ofType: .integer,
                                    references: CommonToken(0)
                                ),
                                references: CommonToken(0)
                            ),
                            do: BlockNode(
                                [
                                    FuncCallNode(
                                        IdentifierNode(
                                            "println",
                                            references: CommonToken(0)
                                        ),
                                        parameters: [
                                            PrimitiveNode(
                                                "Failed!",
                                                ofType: .string,
                                                references: CommonToken(0)
                                            )
                                        ]
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
        XCTAssertNoThrow(try TestSuite.runProgram(url, className: "WhileFalseRelationalExpressionNotExecutedTest"))
        let output = try! TestSuite.runProgram(url, className: "WhileFalseRelationalExpressionNotExecutedTest")
        XCTAssertEqual(output, "")
    }

    func testForLoop() {
        let ast = ObjectDecNode(
            "WhileForLoopTest",
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
                                "i",
                                references: CommonToken(0)
                            ),
                            datatype: .integer,
                            assign: PrimitiveNode(
                                "0",
                                ofType: .integer,
                                references: CommonToken(0)
                            )
                        )
                    ],
                    statements: [
                        WhileNode(
                            RelationalNode(
                                IdentifierNode(
                                    "i",
                                    references: CommonToken(0)
                                ),
                                lessThan: PrimitiveNode(
                                    "4",
                                    ofType: .integer,
                                    references: CommonToken(0)
                                ),
                                references: CommonToken(0)
                            ),
                            do: BlockNode(
                                [
                                    FuncCallNode(
                                        IdentifierNode(
                                            "println",
                                            references: CommonToken(0)
                                        ),
                                        parameters: [
                                            IdentifierNode(
                                                "i",
                                                references: CommonToken(0)
                                            )
                                        ]
                                    ),
                                    VarAssignNode(
                                        IdentifierNode(
                                            "i",
                                            references: CommonToken(0)
                                        ),
                                        assign: AdditiveNode(
                                            IdentifierNode(
                                                "i",
                                                references: CommonToken(0)
                                            ),
                                            plus: PrimitiveNode(
                                                "1",
                                                ofType: .integer,
                                                references: CommonToken(0)
                                            ),
                                            references: CommonToken(0)
                                        )
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
        XCTAssertNoThrow(try TestSuite.runProgram(url, className: "WhileForLoopTest"))
        let output = try! TestSuite.runProgram(url, className: "WhileForLoopTest")
        XCTAssertEqual(output, "0\n1\n2\n3\n")
    }
    
}
