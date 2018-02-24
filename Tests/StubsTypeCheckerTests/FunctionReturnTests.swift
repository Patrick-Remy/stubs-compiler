//
//  FunctionReturnTests.swift
//  StubsTypeCheckerTests
//
//  Created by Patrick Remy on 04.01.18.
//

import XCTest
import Antlr4
@testable import StubsAST
import StubsTypeChecker

class FunctionReturnTests: XCTestCase {

    func testMissingReturnThrowsError() {
        let booleanAST = ObjectDecNode(
            "FunctionReturnTest",
            variables: [],
            functions: [
                FuncDecNode(
                    "foo",
                    parameters: [],
                    returnType: .boolean,
                    declarations: [],
                    statements: []
                ),
                FuncDecNode(
                    "main",
                    parameters: [
                        ("args", .array(of: .string))
                    ],
                    returnType: nil,
                    declarations: [],
                    statements: []
                )
            ]
        )
        let stringAST = ObjectDecNode(
            "FunctionReturnTest",
            variables: [],
            functions: [
                FuncDecNode(
                    "foo",
                    parameters: [],
                    returnType: .string,
                    declarations: [],
                    statements: []
                ),
                FuncDecNode(
                    "main",
                    parameters: [
                        ("args", .array(of: .string))
                    ],
                    returnType: nil,
                    declarations: [],
                    statements: []
                )
            ]
        )
        let integerAST = ObjectDecNode(
            "FunctionReturnTest",
            variables: [],
            functions: [
                FuncDecNode(
                    "foo",
                    parameters: [],
                    returnType: .integer,
                    declarations: [],
                    statements: []
                ),
                FuncDecNode(
                    "main",
                    parameters: [
                        ("args", .array(of: .string))
                    ],
                    returnType: nil,
                    declarations: [],
                    statements: []
                )
            ]
        )
        let doubleAST = ObjectDecNode(
            "FunctionReturnTest",
            variables: [],
            functions: [
                FuncDecNode(
                    "foo",
                    parameters: [],
                    returnType: .double,
                    declarations: [],
                    statements: []
                ),
                FuncDecNode(
                    "main",
                    parameters: [
                        ("args", .array(of: .string))
                    ],
                    returnType: nil,
                    declarations: [],
                    statements: []
                )
            ]
        )
        let arrayAST = ObjectDecNode(
            "FunctionReturnTest",
            variables: [],
            functions: [
                FuncDecNode(
                    "foo",
                    parameters: [],
                    returnType: .array(of: .double),
                    declarations: [],
                    statements: []
                ),
                FuncDecNode(
                    "main",
                    parameters: [
                        ("args", .array(of: .string))
                    ],
                    returnType: nil,
                    declarations: [],
                    statements: []
                )
            ]
        )

        XCTAssertThrowsError(try TypeChecker.validate(booleanAST))
        XCTAssertThrowsError(try TypeChecker.validate(stringAST))
        XCTAssertThrowsError(try TypeChecker.validate(integerAST))
        XCTAssertThrowsError(try TypeChecker.validate(doubleAST))
        XCTAssertThrowsError(try TypeChecker.validate(arrayAST))
    }

    func testVoidFunction() {

        let voidAST = ObjectDecNode(
            "FunctionReturnTest",
            variables: [],
            functions: [
                FuncDecNode(
                    "foo",
                    parameters: [],
                    returnType: nil,
                    declarations: [],
                    statements: []
                ),
                FuncDecNode(
                    "main",
                    parameters: [
                        ("args", .array(of: .string))
                    ],
                    returnType: nil,
                    declarations: [],
                    statements: []
                )
            ]
        )
        let voidReturnAST = ObjectDecNode(
            "FunctionReturnTest",
            variables: [],
            functions: [
                FuncDecNode(
                    "foo",
                    parameters: [],
                    returnType: nil,
                    declarations: [],
                    statements: [
                        ReturnNode()
                    ]
                ),
                FuncDecNode(
                    "main",
                    parameters: [
                        ("args", .array(of: .string))
                    ],
                    returnType: nil,
                    declarations: [],
                    statements: []
                )
            ]
        )
        let booleanReturnAST = ObjectDecNode(
            "FunctionReturnTest",
            variables: [],
            functions: [
                FuncDecNode(
                    "foo",
                    parameters: [],
                    returnType: nil,
                    declarations: [],
                    statements: [
                        ReturnNode(
                            PrimitiveNode(
                                "true",
                                ofType: .boolean,
                                references: CommonToken(0)
                            )
                        )
                    ]
                ),
                FuncDecNode(
                    "main",
                    parameters: [
                        ("args", .array(of: .string))
                    ],
                    returnType: nil,
                    declarations: [],
                    statements: []
                )
            ]
        )
        let stringReturnAST = ObjectDecNode(
            "FunctionReturnTest",
            variables: [],
            functions: [
                FuncDecNode(
                    "foo",
                    parameters: [],
                    returnType: nil,
                    declarations: [],
                    statements: [
                        ReturnNode(
                            PrimitiveNode(
                                "bar",
                                ofType: .string,
                                references: CommonToken(0)
                            )
                        )
                    ]
                ),
                FuncDecNode(
                    "main",
                    parameters: [
                        ("args", .array(of: .string))
                    ],
                    returnType: nil,
                    declarations: [],
                    statements: []
                )
            ]
        )
        let integerReturnAST = ObjectDecNode(
            "FunctionReturnTest",
            variables: [],
            functions: [
                FuncDecNode(
                    "foo",
                    parameters: [],
                    returnType: nil,
                    declarations: [],
                    statements: [
                        ReturnNode(
                            PrimitiveNode(
                                "1",
                                ofType: .integer,
                                references: CommonToken(0)
                            )
                        )
                    ]
                ),
                FuncDecNode(
                    "main",
                    parameters: [
                        ("args", .array(of: .string))
                    ],
                    returnType: nil,
                    declarations: [],
                    statements: []
                )
            ]
        )
        let doubleReturnAST = ObjectDecNode(
            "FunctionReturnTest",
            variables: [],
            functions: [
                FuncDecNode(
                    "foo",
                    parameters: [],
                    returnType: nil,
                    declarations: [],
                    statements: [
                        ReturnNode(
                            PrimitiveNode(
                                "1.0",
                                ofType: .double,
                                references: CommonToken(0)
                            )
                        )
                    ]
                ),
                FuncDecNode(
                    "main",
                    parameters: [
                        ("args", .array(of: .string))
                    ],
                    returnType: nil,
                    declarations: [],
                    statements: []
                )
            ]
        )

        XCTAssertNoThrow(try TypeChecker.validate(voidAST))
        XCTAssertNoThrow(try TypeChecker.validate(voidReturnAST))
        XCTAssertThrowsError(try TypeChecker.validate(booleanReturnAST))
        XCTAssertThrowsError(try TypeChecker.validate(stringReturnAST))
        XCTAssertThrowsError(try TypeChecker.validate(integerReturnAST))
        XCTAssertThrowsError(try TypeChecker.validate(doubleReturnAST))
    }

    func testBooleanFunction() {
        let voidReturnAST = ObjectDecNode(
            "FunctionReturnTest",
            variables: [],
            functions: [
                FuncDecNode(
                    "foo",
                    parameters: [],
                    returnType: .boolean,
                    declarations: [],
                    statements: [
                        ReturnNode()
                    ]
                ),
                FuncDecNode(
                    "main",
                    parameters: [
                        ("args", .array(of: .string))
                    ],
                    returnType: nil,
                    declarations: [],
                    statements: []
                )
            ]
        )
        let booleanReturnAST = ObjectDecNode(
            "FunctionReturnTest",
            variables: [],
            functions: [
                FuncDecNode(
                    "foo",
                    parameters: [],
                    returnType: .boolean,
                    declarations: [],
                    statements: [
                        ReturnNode(
                            PrimitiveNode(
                                "true",
                                ofType: .boolean,
                                references: CommonToken(0)
                            )
                        )
                    ]
                ),
                FuncDecNode(
                    "main",
                    parameters: [
                        ("args", .array(of: .string))
                    ],
                    returnType: nil,
                    declarations: [],
                    statements: []
                )
            ]
        )
        let stringReturnAST = ObjectDecNode(
            "FunctionReturnTest",
            variables: [],
            functions: [
                FuncDecNode(
                    "foo",
                    parameters: [],
                    returnType: .boolean,
                    declarations: [],
                    statements: [
                        ReturnNode(
                            PrimitiveNode(
                                "bar",
                                ofType: .string,
                                references: CommonToken(0)
                            )
                        )
                    ]
                ),
                FuncDecNode(
                    "main",
                    parameters: [
                        ("args", .array(of: .string))
                    ],
                    returnType: nil,
                    declarations: [],
                    statements: []
                )
            ]
        )
        let integerReturnAST = ObjectDecNode(
            "FunctionReturnTest",
            variables: [],
            functions: [
                FuncDecNode(
                    "foo",
                    parameters: [],
                    returnType: .boolean,
                    declarations: [],
                    statements: [
                        ReturnNode(
                            PrimitiveNode(
                                "1",
                                ofType: .integer,
                                references: CommonToken(0)
                            )
                        )
                    ]
                ),
                FuncDecNode(
                    "main",
                    parameters: [
                        ("args", .array(of: .string))
                    ],
                    returnType: nil,
                    declarations: [],
                    statements: []
                )
            ]
        )
        let doubleReturnAST = ObjectDecNode(
            "FunctionReturnTest",
            variables: [],
            functions: [
                FuncDecNode(
                    "foo",
                    parameters: [],
                    returnType: .boolean,
                    declarations: [],
                    statements: [
                        ReturnNode(
                            PrimitiveNode(
                                "1.0",
                                ofType: .double,
                                references: CommonToken(0)
                            )
                        )
                    ]
                ),
                FuncDecNode(
                    "main",
                    parameters: [
                        ("args", .array(of: .string))
                    ],
                    returnType: nil,
                    declarations: [],
                    statements: []
                )
            ]
        )

        XCTAssertNoThrow(try TypeChecker.validate(booleanReturnAST))
        XCTAssertThrowsError(try TypeChecker.validate(voidReturnAST))
        XCTAssertThrowsError(try TypeChecker.validate(stringReturnAST))
        XCTAssertThrowsError(try TypeChecker.validate(integerReturnAST))
        XCTAssertThrowsError(try TypeChecker.validate(doubleReturnAST))
    }

    func testIntegerFunction() {
        let voidReturnAST = ObjectDecNode(
            "FunctionReturnTest",
            variables: [],
            functions: [
                FuncDecNode(
                    "foo",
                    parameters: [],
                    returnType: .integer,
                    declarations: [],
                    statements: [
                        ReturnNode()
                    ]
                ),
                FuncDecNode(
                    "main",
                    parameters: [
                        ("args", .array(of: .string))
                    ],
                    returnType: nil,
                    declarations: [],
                    statements: []
                )
            ]
        )
        let booleanReturnAST = ObjectDecNode(
            "FunctionReturnTest",
            variables: [],
            functions: [
                FuncDecNode(
                    "foo",
                    parameters: [],
                    returnType: .integer,
                    declarations: [],
                    statements: [
                        ReturnNode(
                            PrimitiveNode(
                                "true",
                                ofType: .boolean,
                                references: CommonToken(0)
                            )
                        )
                    ]
                ),
                FuncDecNode(
                    "main",
                    parameters: [
                        ("args", .array(of: .string))
                    ],
                    returnType: nil,
                    declarations: [],
                    statements: []
                )
            ]
        )
        let stringReturnAST = ObjectDecNode(
            "FunctionReturnTest",
            variables: [],
            functions: [
                FuncDecNode(
                    "foo",
                    parameters: [],
                    returnType: .integer,
                    declarations: [],
                    statements: [
                        ReturnNode(
                            PrimitiveNode(
                                "bar",
                                ofType: .string,
                                references: CommonToken(0)
                            )
                        )
                    ]
                ),
                FuncDecNode(
                    "main",
                    parameters: [
                        ("args", .array(of: .string))
                    ],
                    returnType: nil,
                    declarations: [],
                    statements: []
                )
            ]
        )
        let integerReturnAST = ObjectDecNode(
            "FunctionReturnTest",
            variables: [],
            functions: [
                FuncDecNode(
                    "foo",
                    parameters: [],
                    returnType: .integer,
                    declarations: [],
                    statements: [
                        ReturnNode(
                            PrimitiveNode(
                                "1",
                                ofType: .integer,
                                references: CommonToken(0)
                            )
                        )
                    ]
                ),
                FuncDecNode(
                    "main",
                    parameters: [
                        ("args", .array(of: .string))
                    ],
                    returnType: nil,
                    declarations: [],
                    statements: []
                )
            ]
        )
        let doubleReturnAST = ObjectDecNode(
            "FunctionReturnTest",
            variables: [],
            functions: [
                FuncDecNode(
                    "foo",
                    parameters: [],
                    returnType: .integer,
                    declarations: [],
                    statements: [
                        ReturnNode(
                            PrimitiveNode(
                                "1.0",
                                ofType: .double,
                                references: CommonToken(0)
                            )
                        )
                    ]
                ),
                FuncDecNode(
                    "main",
                    parameters: [
                        ("args", .array(of: .string))
                    ],
                    returnType: nil,
                    declarations: [],
                    statements: []
                )
            ]
        )

        XCTAssertNoThrow(try TypeChecker.validate(integerReturnAST))
        XCTAssertThrowsError(try TypeChecker.validate(voidReturnAST))
        XCTAssertThrowsError(try TypeChecker.validate(booleanReturnAST))
        XCTAssertThrowsError(try TypeChecker.validate(stringReturnAST))
        XCTAssertThrowsError(try TypeChecker.validate(doubleReturnAST))
    }

    func testDoubleFunction() {
        let voidReturnAST = ObjectDecNode(
            "FunctionReturnTest",
            variables: [],
            functions: [
                FuncDecNode(
                    "foo",
                    parameters: [],
                    returnType: .double,
                    declarations: [],
                    statements: [
                        ReturnNode()
                    ]
                ),
                FuncDecNode(
                    "main",
                    parameters: [
                        ("args", .array(of: .string))
                    ],
                    returnType: nil,
                    declarations: [],
                    statements: []
                )
            ]
        )
        let booleanReturnAST = ObjectDecNode(
            "FunctionReturnTest",
            variables: [],
            functions: [
                FuncDecNode(
                    "foo",
                    parameters: [],
                    returnType: .double,
                    declarations: [],
                    statements: [
                        ReturnNode(
                            PrimitiveNode(
                                "true",
                                ofType: .boolean,
                                references: CommonToken(0)
                            )
                        )
                    ]
                ),
                FuncDecNode(
                    "main",
                    parameters: [
                        ("args", .array(of: .string))
                    ],
                    returnType: nil,
                    declarations: [],
                    statements: []
                )
            ]
        )
        let stringReturnAST = ObjectDecNode(
            "FunctionReturnTest",
            variables: [],
            functions: [
                FuncDecNode(
                    "foo",
                    parameters: [],
                    returnType: .double,
                    declarations: [],
                    statements: [
                        ReturnNode(
                            PrimitiveNode(
                                "bar",
                                ofType: .string,
                                references: CommonToken(0)
                            )
                        )
                    ]
                ),
                FuncDecNode(
                    "main",
                    parameters: [
                        ("args", .array(of: .string))
                    ],
                    returnType: nil,
                    declarations: [],
                    statements: []
                )
            ]
        )
        let integerReturnAST = ObjectDecNode(
            "FunctionReturnTest",
            variables: [],
            functions: [
                FuncDecNode(
                    "foo",
                    parameters: [],
                    returnType: .double,
                    declarations: [],
                    statements: [
                        ReturnNode(
                            PrimitiveNode(
                                "1",
                                ofType: .integer,
                                references: CommonToken(0)
                            )
                        )
                    ]
                ),
                FuncDecNode(
                    "main",
                    parameters: [
                        ("args", .array(of: .string))
                    ],
                    returnType: nil,
                    declarations: [],
                    statements: []
                )
            ]
        )
        let doubleReturnAST = ObjectDecNode(
            "FunctionReturnTest",
            variables: [],
            functions: [
                FuncDecNode(
                    "foo",
                    parameters: [],
                    returnType: .double,
                    declarations: [],
                    statements: [
                        ReturnNode(
                            PrimitiveNode(
                                "1.0",
                                ofType: .double,
                                references: CommonToken(0)
                            )
                        )
                    ]
                ),
                FuncDecNode(
                    "main",
                    parameters: [
                        ("args", .array(of: .string))
                    ],
                    returnType: nil,
                    declarations: [],
                    statements: []
                )
            ]
        )

        XCTAssertNoThrow(try TypeChecker.validate(integerReturnAST))
        XCTAssertNoThrow(try TypeChecker.validate(doubleReturnAST))
        XCTAssertThrowsError(try TypeChecker.validate(voidReturnAST))
        XCTAssertThrowsError(try TypeChecker.validate(booleanReturnAST))
        XCTAssertThrowsError(try TypeChecker.validate(stringReturnAST))
    }

    func testStringFunction() {
        let voidReturnAST = ObjectDecNode(
            "FunctionReturnTest",
            variables: [],
            functions: [
                FuncDecNode(
                    "foo",
                    parameters: [],
                    returnType: .string,
                    declarations: [],
                    statements: [
                        ReturnNode()
                    ]
                ),
                FuncDecNode(
                    "main",
                    parameters: [
                        ("args", .array(of: .string))
                    ],
                    returnType: nil,
                    declarations: [],
                    statements: []
                )
            ]
        )
        let booleanReturnAST = ObjectDecNode(
            "FunctionReturnTest",
            variables: [],
            functions: [
                FuncDecNode(
                    "foo",
                    parameters: [],
                    returnType: .string,
                    declarations: [],
                    statements: [
                        ReturnNode(
                            PrimitiveNode(
                                "true",
                                ofType: .boolean,
                                references: CommonToken(0)
                            )
                        )
                    ]
                ),
                FuncDecNode(
                    "main",
                    parameters: [
                        ("args", .array(of: .string))
                    ],
                    returnType: nil,
                    declarations: [],
                    statements: []
                )
            ]
        )
        let stringReturnAST = ObjectDecNode(
            "FunctionReturnTest",
            variables: [],
            functions: [
                FuncDecNode(
                    "foo",
                    parameters: [],
                    returnType: .string,
                    declarations: [],
                    statements: [
                        ReturnNode(
                            PrimitiveNode(
                                "bar",
                                ofType: .string,
                                references: CommonToken(0)
                            )
                        )
                    ]
                ),
                FuncDecNode(
                    "main",
                    parameters: [
                        ("args", .array(of: .string))
                    ],
                    returnType: nil,
                    declarations: [],
                    statements: []
                )
            ]
        )
        let integerReturnAST = ObjectDecNode(
            "FunctionReturnTest",
            variables: [],
            functions: [
                FuncDecNode(
                    "foo",
                    parameters: [],
                    returnType: .string,
                    declarations: [],
                    statements: [
                        ReturnNode(
                            PrimitiveNode(
                                "1",
                                ofType: .integer,
                                references: CommonToken(0)
                            )
                        )
                    ]
                ),
                FuncDecNode(
                    "main",
                    parameters: [
                        ("args", .array(of: .string))
                    ],
                    returnType: nil,
                    declarations: [],
                    statements: []
                )
            ]
        )
        let doubleReturnAST = ObjectDecNode(
            "FunctionReturnTest",
            variables: [],
            functions: [
                FuncDecNode(
                    "foo",
                    parameters: [],
                    returnType: .string,
                    declarations: [],
                    statements: [
                        ReturnNode(
                            PrimitiveNode(
                                "1.0",
                                ofType: .double,
                                references: CommonToken(0)
                            )
                        )
                    ]
                ),
                FuncDecNode(
                    "main",
                    parameters: [
                        ("args", .array(of: .string))
                    ],
                    returnType: nil,
                    declarations: [],
                    statements: []
                )
            ]
        )

        XCTAssertNoThrow(try TypeChecker.validate(stringReturnAST))
        XCTAssertThrowsError(try TypeChecker.validate(voidReturnAST))
        XCTAssertThrowsError(try TypeChecker.validate(booleanReturnAST))
        XCTAssertThrowsError(try TypeChecker.validate(integerReturnAST))
        XCTAssertThrowsError(try TypeChecker.validate(doubleReturnAST))
    }

}
