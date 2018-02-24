//
//  FibonacciTests.swift
//  StubsCodeGeneratorTests
//
//  Created by Patrick Remy on 27.01.18.
//

import XCTest
import Antlr4
@testable import StubsAST
import StubsTypeChecker


class FibonacciTests: XCTestCase {

    override func setUp() {
        continueAfterFailure = false
    }

    func testFibonacci() {
        let ast = ObjectDecNode(
            "FibonacciTest",
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
                                "a",
                                references: CommonToken(0)
                            ),
                            datatype: .integer,
                            assign: PrimitiveNode(
                                "1",
                                ofType: .integer,
                                references: CommonToken(0)
                            )
                        ),
                        VarDecNode(
                            IdentifierNode(
                                "b",
                                references: CommonToken(0)
                            ),
                            datatype: .integer,
                            assign: PrimitiveNode(
                                "1",
                                ofType: .integer,
                                references: CommonToken(0)
                            )
                        ),
                        VarDecNode(
                            IdentifierNode(
                                "temp",
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
                                    "a",
                                    references: CommonToken(0)
                                ),
                                lessThan: PrimitiveNode(
                                    "144",
                                    ofType: .integer,
                                    references: CommonToken(0)
                                ),
                                references: CommonToken(0)
                            ),
                            do: BlockNode(
                                [
                                    VarAssignNode(
                                        IdentifierNode(
                                            "temp",
                                            references: CommonToken(0)
                                        ),
                                        assign: IdentifierNode(
                                            "b",
                                            references: CommonToken(0)
                                        )
                                    ),
                                    VarAssignNode(
                                        IdentifierNode(
                                            "b",
                                            references: CommonToken(0)
                                        ),
                                        assign: AdditiveNode(
                                            IdentifierNode(
                                                "a",
                                                references: CommonToken(0)
                                            ),
                                            plus: IdentifierNode(
                                                "b",
                                                references: CommonToken(0)
                                            ),
                                            references: CommonToken(0)
                                        )
                                    ),
                                    VarAssignNode(
                                        IdentifierNode(
                                            "a",
                                            references: CommonToken(0)
                                        ),
                                        assign: IdentifierNode(
                                            "temp",
                                            references: CommonToken(0)
                                        )
                                    ),
                                    FuncCallNode(
                                        IdentifierNode(
                                            "println",
                                            references: CommonToken(0)
                                        ),
                                        parameters: [
                                            IdentifierNode(
                                                "a",
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
        XCTAssertNoThrow(try TestSuite.runProgram(url, className: "FibonacciTest", timeout: 20))
        let output = try! TestSuite.runProgram(url, className: "FibonacciTest")
        XCTAssertEqual(output, "1\n2\n3\n5\n8\n13\n21\n34\n55\n89\n144\n")
    }

}
