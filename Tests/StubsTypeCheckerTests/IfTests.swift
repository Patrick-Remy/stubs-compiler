//
//  IfTests.swift
//  StubsTypeCheckerTests
//
//  Created by Patrick Remy on 01.01.18.
//

import XCTest
import Antlr4
@testable import StubsAST
import StubsTypeChecker

class IfTests: XCTestCase {

    func testBooleanExpression() {
        let ast = ObjectDecNode(
            "BooleanExpressionTest",
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
                            PrimitiveNode(
                                "true",
                                ofType: .boolean,
                                references: CommonToken(0)
                            ),
                            then: BlockNode(
                                []
                            )
                        )
                    ]
                )
            ]
        )

        XCTAssertNoThrow(try TypeChecker.validate(ast))
    }

    func testNonBooleanExpressionThrowsError() {
        let stringAST = ObjectDecNode(
            "NonBooleanExpressionTest",
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
                            PrimitiveNode(
                                "foobar",
                                ofType: .string,
                                references: CommonToken(0)
                            ),
                            then: BlockNode(
                                []
                            )
                        )
                    ]
                )
            ]
        )
        let integerAST = ObjectDecNode(
            "NonBooleanExpressionTest",
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
                            PrimitiveNode(
                                "1",
                                ofType: .integer,
                                references: CommonToken(0)
                            ),
                            then: BlockNode(
                                []
                            )
                        )
                    ]
                )
            ]
        )
        let doubleAST = ObjectDecNode(
            "NonBooleanExpressionTest",
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
                            PrimitiveNode(
                                "1.0",
                                ofType: .double,
                                references: CommonToken(0)
                            ),
                            then: BlockNode(
                                []
                            )
                        )
                    ]
                )
            ]
        )
        let arrayAST = ObjectDecNode(
            "NonBooleanExpressionTest",
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
                            PrimitiveNode(
                                "1",
                                ofType: .array(of: .boolean),
                                references: CommonToken(0)
                            ),
                            then: BlockNode(
                                []
                            )
                        )
                    ]
                )
            ]
        )

        XCTAssertThrowsError(try TypeChecker.validate(stringAST))
        XCTAssertThrowsError(try TypeChecker.validate(integerAST))
        XCTAssertThrowsError(try TypeChecker.validate(doubleAST))
        XCTAssertThrowsError(try TypeChecker.validate(arrayAST))
    }

}
