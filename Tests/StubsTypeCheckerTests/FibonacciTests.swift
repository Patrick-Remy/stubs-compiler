//
//  FibonacciTests.swift
//  StubsTypeCheckerTests
//
//  Created by Patrick Remy on 30.12.17.
//

import XCTest
import Antlr4
@testable import StubsAST
import StubsTypeChecker

class FibonacciTests: XCTestCase {

    func testFibonacci() {
        let ast = ObjectDecNode(
            "Fibonacci",
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
    }

}
