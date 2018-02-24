//
//  EqualTests.swift
//  StubsTypeCheckerTests
//
//  Created by Patrick Remy on 07.01.18.
//

import XCTest
import Antlr4
@testable import StubsAST
import StubsTypeChecker

class EqualTests: XCTestCase {

    func testBooleanCompare() {
        let ast = ObjectDecNode(
            "BooleanCompareTest",
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
                            ),
                            do: BlockNode(
                                []
                            )
                        )
                    ]
                )
            ]
        )

        XCTAssertNoThrow(try TypeChecker.validate(ast))
    }

    func testStringCompare() {
        let ast = ObjectDecNode(
            "StringCompareTest",
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
                            EqualNode(
                                PrimitiveNode(
                                    "foo",
                                    ofType: .string,
                                    references: CommonToken(0)
                                ),
                                equals: PrimitiveNode(
                                    "bar",
                                    ofType: .string,
                                    references: CommonToken(0)
                                ),
                                references: CommonToken(0)
                            ),
                            do: BlockNode(
                                []
                            )
                        )
                    ]
                )
            ]
        )

        XCTAssertNoThrow(try TypeChecker.validate(ast))
    }

    func testIntegerCompare() {
        let ast = ObjectDecNode(
            "StringCompareTest",
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
                            EqualNode(
                                PrimitiveNode(
                                    "1",
                                    ofType: .integer,
                                    references: CommonToken(0)
                                ),
                                equals: PrimitiveNode(
                                    "2",
                                    ofType: .integer,
                                    references: CommonToken(0)
                                ),
                                references: CommonToken(0)
                            ),
                            do: BlockNode(
                                []
                            )
                        )
                    ]
                )
            ]
        )

        XCTAssertNoThrow(try TypeChecker.validate(ast))
    }

    func testDoubleCompare() {
        let ast = ObjectDecNode(
            "StringCompareTest",
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
                            EqualNode(
                                PrimitiveNode(
                                    "1",
                                    ofType: .double,
                                    references: CommonToken(0)
                                ),
                                equals: PrimitiveNode(
                                    "2",
                                    ofType: .double,
                                    references: CommonToken(0)
                                ),
                                references: CommonToken(0)
                            ),
                            do: BlockNode(
                                []
                            )
                        )
                    ]
                )
            ]
        )

        XCTAssertNoThrow(try TypeChecker.validate(ast))
    }

    func testIntegerDoubleCompare() {
        let integerDoubleAST = ObjectDecNode(
            "IntegerDoubleCompareTest",
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
                            EqualNode(
                                PrimitiveNode(
                                    "1",
                                    ofType: .integer,
                                    references: CommonToken(0)
                                ),
                                equals: PrimitiveNode(
                                    "2.0",
                                    ofType: .double,
                                    references: CommonToken(0)
                                ),
                                references: CommonToken(0)
                            ),
                            do: BlockNode(
                                []
                            )
                        )
                    ]
                )
            ]
        )
        let doubleIntegerAST = ObjectDecNode(
            "DoubleIntegerCompareTest",
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
                            EqualNode(
                                PrimitiveNode(
                                    "1.0",
                                    ofType: .double,
                                    references: CommonToken(0)
                                ),
                                equals: PrimitiveNode(
                                    "2",
                                    ofType: .integer,
                                    references: CommonToken(0)
                                ),
                                references: CommonToken(0)
                            ),
                            do: BlockNode(
                                []
                            )
                        )
                    ]
                )
            ]
        )

        XCTAssertNoThrow(try TypeChecker.validate(integerDoubleAST))
        XCTAssertNoThrow(try TypeChecker.validate(doubleIntegerAST))
    }

    func testIncompatibleTypeThrowsError() {
        let integerStringAST = ObjectDecNode(
            "IntegerStringCompareTest",
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
                            EqualNode(
                                PrimitiveNode(
                                    "1",
                                    ofType: .integer,
                                    references: CommonToken(0)
                                ),
                                equals: PrimitiveNode(
                                    "foobar",
                                    ofType: .string,
                                    references: CommonToken(0)
                                ),
                                references: CommonToken(0)
                            ),
                            do: BlockNode(
                                []
                            )
                        )
                    ]
                )
            ]
        )
        let booleanIntegerAST = ObjectDecNode(
            "BooleanIntegerCompareTest",
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
                            EqualNode(
                                PrimitiveNode(
                                    "true",
                                    ofType: .boolean,
                                    references: CommonToken(0)
                                ),
                                equals: PrimitiveNode(
                                    "2",
                                    ofType: .integer,
                                    references: CommonToken(0)
                                ),
                                references: CommonToken(0)
                            ),
                            do: BlockNode(
                                []
                            )
                        )
                    ]
                )
            ]
        )
        let stringDoubleAST = ObjectDecNode(
            "StringDoubleCompareTest",
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
                            EqualNode(
                                PrimitiveNode(
                                    "foobar",
                                    ofType: .string,
                                    references: CommonToken(0)
                                ),
                                equals: PrimitiveNode(
                                    "2.0",
                                    ofType: .double,
                                    references: CommonToken(0)
                                ),
                                references: CommonToken(0)
                            ),
                            do: BlockNode(
                                []
                            )
                        )
                    ]
                )
            ]
        )

        XCTAssertThrowsError(try TypeChecker.validate(integerStringAST))
        XCTAssertThrowsError(try TypeChecker.validate(booleanIntegerAST))
        XCTAssertThrowsError(try TypeChecker.validate(stringDoubleAST))
    }

}

