//
//  UnaryTests.swift
//  StubsTypeCheckerTests
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

    func testNotBoolean() {
        let ast = ObjectDecNode(
            "UnaryNotTest",
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
    }

    func testNotIntegerThrowsError() {
        let ast = ObjectDecNode(
            "UnaryNotTest",
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

        XCTAssertThrowsError(try TypeChecker.validate(ast))
    }

    func testNotDoubleThrowsError() {
        let ast = ObjectDecNode(
            "UnaryNotTest",
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

        XCTAssertThrowsError(try TypeChecker.validate(ast))
    }

    func testNotStringThrowsError() {
        let ast = ObjectDecNode(
            "UnaryNotTest",
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

        XCTAssertThrowsError(try TypeChecker.validate(ast))
    }

    // MARK: - Minus

    func testMinusInteger() {
        let ast = ObjectDecNode(
            "UnaryMinusTest",
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
                        )
                    ]
                )
            ]
        )

        XCTAssertNoThrow(try TypeChecker.validate(ast))
    }

    func testMinusDouble() {
        let ast = ObjectDecNode(
            "UnaryMinusTest",
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
                        )
                    ]
                )
            ]
        )

        XCTAssertNoThrow(try TypeChecker.validate(ast))
    }

    func testMinusBooleanThrowsError() {
        let ast = ObjectDecNode(
            "UnaryMinusTest",
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

        XCTAssertThrowsError(try TypeChecker.validate(ast))
    }

    func testMinusStringThrowsError() {
        let ast = ObjectDecNode(
            "UnaryMinusTest",
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
                                        "42",
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

        XCTAssertThrowsError(try TypeChecker.validate(ast))
    }

    // MARK: - Plus

    func testPlusInteger() {
        let ast = ObjectDecNode(
            "UnaryPlusTest",
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
                        )
                    ]
                )
            ]
        )

        XCTAssertNoThrow(try TypeChecker.validate(ast))
    }

    func testPlusDouble() {
        let ast = ObjectDecNode(
            "UnaryPlusTest",
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
                        )
                    ]
                )
            ]
        )

        XCTAssertNoThrow(try TypeChecker.validate(ast))
    }

    func testPlusBooleanThrowsError() {
        let ast = ObjectDecNode(
            "UnaryPlusTest",
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

        XCTAssertThrowsError(try TypeChecker.validate(ast))
    }

    func testPlusStringThrowsError() {
        let ast = ObjectDecNode(
            "UnaryPlusTest",
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
                                        "42",
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

        XCTAssertThrowsError(try TypeChecker.validate(ast))
    }

}
