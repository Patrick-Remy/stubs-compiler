//
//  ArrayTests.swift
//  StubsTypeCheckerTests
//
//  Created by Patrick Remy on 03.01.18.
//

import XCTest
import Antlr4
@testable import StubsAST
import StubsTypeChecker

class ArrayTests: XCTestCase {

    // MARK: - Declaration

    func testIntegerArrayDeclaration() {
        let ast = ObjectDecNode(
            "IntegerArrayTest",
            variables: [
                VarDecNode(
                    IdentifierNode(
                        "foo",
                        references: CommonToken(0)
                    ),
                    datatype: .array(of: .integer),
                    assign: ArrayNode(
                        [
                            PrimitiveNode(
                                "1",
                                ofType: .integer,
                                references: CommonToken(0)
                            ),
                            PrimitiveNode(
                                "2",
                                ofType: .integer,
                                references: CommonToken(0)
                            )
                        ]
                    )
                )
            ],
            functions: [
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

        XCTAssertNoThrow(try TypeChecker.validate(ast))
    }

    func testDoubleArrayDeclaration() {
        let ast = ObjectDecNode(
            "DoubleArrayTest",
            variables: [
                VarDecNode(
                    IdentifierNode(
                        "foo",
                        references: CommonToken(0)
                    ),
                    datatype: .array(of: .double),
                    assign: ArrayNode(
                        [
                            PrimitiveNode(
                                "1.0",
                                ofType: .double,
                                references: CommonToken(0)
                            ),
                            PrimitiveNode(
                                "2.0",
                                ofType: .double,
                                references: CommonToken(0)
                            )
                        ]
                    )
                )
            ],
            functions: [
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

        XCTAssertNoThrow(try TypeChecker.validate(ast))
    }

    func testDoubleArrayDeclarationWithIntegers() {
        let ast = ObjectDecNode(
            "DoubleArrayTest",
            variables: [
                VarDecNode(
                    IdentifierNode(
                        "foo",
                        references: CommonToken(0)
                    ),
                    datatype: .array(of: .double),
                    assign: ArrayNode(
                        [
                            PrimitiveNode(
                                "1",
                                ofType: .integer,
                                references: CommonToken(0)
                            ),
                            PrimitiveNode(
                                "2",
                                ofType: .integer,
                                references: CommonToken(0)
                            )
                        ]
                    )
                )
            ],
            functions: [
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

        XCTAssertNoThrow(try TypeChecker.validate(ast))
    }

    func testDoubleArrayDeclarationWithIntegersAndDoubles() {
        let ast = ObjectDecNode(
            "DoubleArrayTest",
            variables: [
                VarDecNode(
                    IdentifierNode(
                        "foo",
                        references: CommonToken(0)
                    ),
                    datatype: .array(of: .double),
                    assign: ArrayNode(
                        [
                            PrimitiveNode(
                                "1",
                                ofType: .integer,
                                references: CommonToken(0)
                            ),
                            PrimitiveNode(
                                "2.0",
                                ofType: .double,
                                references: CommonToken(0)
                            ),
                            PrimitiveNode(
                                "3",
                                ofType: .integer,
                                references: CommonToken(0)
                            )
                        ]
                    )
                )
            ],
            functions: [
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

        XCTAssertNoThrow(try TypeChecker.validate(ast))
    }

    func testStringArrayDeclaration() {
        let ast = ObjectDecNode(
            "StringArrayTest",
            variables: [
                VarDecNode(
                    IdentifierNode(
                        "foo",
                        references: CommonToken(0)
                    ),
                    datatype: .array(of: .string),
                    assign: ArrayNode(
                        [
                            PrimitiveNode(
                                "foo",
                                ofType: .string,
                                references: CommonToken(0)
                            ),
                            PrimitiveNode(
                                "bar",
                                ofType: .string,
                                references: CommonToken(0)
                            )
                        ]
                    )
                )
            ],
            functions: [
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

        XCTAssertNoThrow(try TypeChecker.validate(ast))
    }

    func testBooleanArrayDeclaration() {
        let ast = ObjectDecNode(
            "BooleanArrayTest",
            variables: [
                VarDecNode(
                    IdentifierNode(
                        "foo",
                        references: CommonToken(0)
                    ),
                    datatype: .array(of: .boolean),
                    assign: ArrayNode(
                        [
                            PrimitiveNode(
                                "true",
                                ofType: .boolean,
                                references: CommonToken(0)
                            ),
                            PrimitiveNode(
                                "false",
                                ofType: .boolean,
                                references: CommonToken(0)
                            )
                        ]
                    )
                )
            ],
            functions: [
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

        XCTAssertNoThrow(try TypeChecker.validate(ast))
    }

    func testExpressionArrayDeclaration() {
        let ast = ObjectDecNode(
            "ExpressionArrayTest",
            variables: [
                VarDecNode(
                    IdentifierNode(
                        "foo",
                        references: CommonToken(0)
                    ),
                    datatype: .array(of: .boolean),
                    assign: ArrayNode(
                        [
                            PrimitiveNode(
                                "true",
                                ofType: .boolean,
                                references: CommonToken(0)
                            ),
                            PrimitiveNode(
                                "false",
                                ofType: .boolean,
                                references: CommonToken(0)
                            )
                        ]
                    )
                ),
                VarDecNode(
                    IdentifierNode(
                        "bar",
                        references: CommonToken(0)
                    ),
                    datatype: .array(of: .boolean),
                    assign: ArrayNode(
                        [
                            FuncCallNode(
                                IdentifierNode(
                                    "foo",
                                    references: CommonToken(0)
                                ),
                                parameters: [
                                    PrimitiveNode(
                                        "0",
                                        ofType: .integer,
                                        references: CommonToken(0)
                                    )
                                ]
                            )
                        ]
                    )
                )
            ],
            functions: [
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

        XCTAssertNoThrow(try TypeChecker.validate(ast))
    }

    // MARK: - Reference

    func testArrayExpressionReference() {
        let ast = ObjectDecNode(
            "ArrayExpressionReferenceTest",
            variables: [
                VarDecNode(
                    IdentifierNode(
                        "foo",
                        references: CommonToken(0)
                    ),
                    datatype: .array(of: .boolean),
                    assign: ArrayNode(
                        [
                            PrimitiveNode(
                                "true",
                                ofType: .boolean,
                                references: CommonToken(0)
                            ),
                            PrimitiveNode(
                                "false",
                                ofType: .boolean,
                                references: CommonToken(0)
                            )
                        ]
                    )
                )
            ],
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
                                "foo",
                                references: CommonToken(0)
                            ),
                            parameters: [
                                AdditiveNode(
                                    PrimitiveNode(
                                        "0",
                                        ofType: .integer,
                                        references: CommonToken(0)
                                    ),
                                    plus: PrimitiveNode(
                                        "0",
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

    func testArrayReference() {
        let ast = ObjectDecNode(
            "ArrayReferenceTest",
            variables: [
                VarDecNode(
                    IdentifierNode(
                        "foo",
                        references: CommonToken(0)
                    ),
                    datatype: .array(of: .boolean),
                    assign: ArrayNode(
                        [
                            PrimitiveNode(
                                "true",
                                ofType: .boolean,
                                references: CommonToken(0)
                            ),
                            PrimitiveNode(
                                "false",
                                ofType: .boolean,
                                references: CommonToken(0)
                            )
                        ]
                    )
                )
            ],
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
                                "foo",
                                references: CommonToken(0)
                            ),
                            parameters: [
                                PrimitiveNode(
                                    "0",
                                    ofType: .integer,
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

    func testArrayReferenceReturnType() {
        let ast = ObjectDecNode(
            "ArrayReferenceReturnTypeTest",
            variables: [
                VarDecNode(
                    IdentifierNode(
                        "foo",
                        references: CommonToken(0)
                    ),
                    datatype: .array(of: .boolean),
                    assign: ArrayNode(
                        [
                            PrimitiveNode(
                                "true",
                                ofType: .boolean,
                                references: CommonToken(0)
                            ),
                            PrimitiveNode(
                                "false",
                                ofType: .boolean,
                                references: CommonToken(0)
                            )
                        ]
                    )
                ),
                VarDecNode(
                    IdentifierNode(
                        "bar",
                        references: CommonToken(0)
                    ),
                    datatype: .boolean,
                    assign: FuncCallNode(
                        IdentifierNode(
                            "foo",
                            references: CommonToken(0)
                        ),
                        parameters: [
                            PrimitiveNode(
                                "0",
                                ofType: .integer,
                                references: CommonToken(0)
                            )
                        ]
                    )
                )
            ],
            functions: [
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

        XCTAssertNoThrow(try TypeChecker.validate(ast))
    }

    func testInvalidArrayReferenceThrowsError() {
        let noArgumentsAST = ObjectDecNode(
            "InvalidArrayReferenceTest",
            variables: [
                VarDecNode(
                    IdentifierNode(
                        "foo",
                        references: CommonToken(0)
                    ),
                    datatype: .array(of: .boolean),
                    assign: ArrayNode(
                        [
                            PrimitiveNode(
                                "true",
                                ofType: .boolean,
                                references: CommonToken(0)
                            ),
                            PrimitiveNode(
                                "false",
                                ofType: .boolean,
                                references: CommonToken(0)
                            )
                        ]
                    )
                )
            ],
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
                                "foo",
                                references: CommonToken(0)
                            ),
                            parameters: []
                        )
                    ]
                )
            ]
        )

        let multipleArgumentsAST = ObjectDecNode(
            "InvalidArrayReferenceTest",
            variables: [
                VarDecNode(
                    IdentifierNode(
                        "foo",
                        references: CommonToken(0)
                    ),
                    datatype: .array(of: .boolean),
                    assign: ArrayNode(
                        [
                            PrimitiveNode(
                                "true",
                                ofType: .boolean,
                                references: CommonToken(0)
                            ),
                            PrimitiveNode(
                                "false",
                                ofType: .boolean,
                                references: CommonToken(0)
                            )
                        ]
                    )
                )
            ],
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
                                "foo",
                                references: CommonToken(0)
                            ),
                            parameters: [
                                PrimitiveNode(
                                    "0",
                                    ofType: .integer,
                                    references: CommonToken(0)
                                ),
                                PrimitiveNode(
                                    "1",
                                    ofType: .integer,
                                    references: CommonToken(0)
                                )
                            ]
                        )
                    ]
                )
            ]
        )

        let doubleArgumentAST = ObjectDecNode(
            "InvalidArrayReferenceTest",
            variables: [
                VarDecNode(
                    IdentifierNode(
                        "foo",
                        references: CommonToken(0)
                    ),
                    datatype: .array(of: .boolean),
                    assign: ArrayNode(
                        [
                            PrimitiveNode(
                                "true",
                                ofType: .boolean,
                                references: CommonToken(0)
                            ),
                            PrimitiveNode(
                                "false",
                                ofType: .boolean,
                                references: CommonToken(0)
                            )
                        ]
                    )
                )
            ],
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
                                "foo",
                                references: CommonToken(0)
                            ),
                            parameters: [
                                PrimitiveNode(
                                    "0.0",
                                    ofType: .double,
                                    references: CommonToken(0)
                                )
                            ]
                        )
                    ]
                )
            ]
        )

        let stringArgumentAST = ObjectDecNode(
            "InvalidArrayReferenceTest",
            variables: [
                VarDecNode(
                    IdentifierNode(
                        "foo",
                        references: CommonToken(0)
                    ),
                    datatype: .array(of: .boolean),
                    assign: ArrayNode(
                        [
                            PrimitiveNode(
                                "true",
                                ofType: .boolean,
                                references: CommonToken(0)
                            ),
                            PrimitiveNode(
                                "false",
                                ofType: .boolean,
                                references: CommonToken(0)
                            )
                        ]
                    )
                )
            ],
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
                                "foo",
                                references: CommonToken(0)
                            ),
                            parameters: [
                                PrimitiveNode(
                                    "bar",
                                    ofType: .string,
                                    references: CommonToken(0)
                                )
                            ]
                        )
                    ]
                )
            ]
        )

        let booleanArgumentAST = ObjectDecNode(
            "InvalidArrayReferenceTest",
            variables: [
                VarDecNode(
                    IdentifierNode(
                        "foo",
                        references: CommonToken(0)
                    ),
                    datatype: .array(of: .boolean),
                    assign: ArrayNode(
                        [
                            PrimitiveNode(
                                "true",
                                ofType: .boolean,
                                references: CommonToken(0)
                            ),
                            PrimitiveNode(
                                "false",
                                ofType: .boolean,
                                references: CommonToken(0)
                            )
                        ]
                    )
                )
            ],
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
                                "foo",
                                references: CommonToken(0)
                            ),
                            parameters: [
                                PrimitiveNode(
                                    "true",
                                    ofType: .boolean,
                                    references: CommonToken(0)
                                )
                            ]
                        )
                    ]
                )
            ]
        )

        XCTAssertThrowsError(try TypeChecker.validate(noArgumentsAST))
        XCTAssertThrowsError(try TypeChecker.validate(multipleArgumentsAST))
        XCTAssertThrowsError(try TypeChecker.validate(doubleArgumentAST))
        XCTAssertThrowsError(try TypeChecker.validate(stringArgumentAST))
        XCTAssertThrowsError(try TypeChecker.validate(booleanArgumentAST))
    }

    // MARK: - Overloading

    func testOverloading() {
        let ast = ObjectDecNode(
            "OverloadingArrayTest",
            variables: [],
            functions: [
                FuncDecNode(
                    "foo",
                    parameters: [
                        ("bar", .integer)
                    ],
                    returnType: .string,
                    declarations: [],
                    statements: [
                        ReturnNode(
                            PrimitiveNode(
                                "foobar",
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
                    declarations: [
                        VarDecNode(
                            IdentifierNode(
                                "foo",
                                references: CommonToken(0)
                            ),
                            datatype: .array(of: .integer),
                            assign: ArrayNode(
                                [
                                    PrimitiveNode(
                                        "1",
                                        ofType: .integer,
                                        references: CommonToken(0)
                                    ),
                                    PrimitiveNode(
                                        "2",
                                        ofType: .integer,
                                        references: CommonToken(0)
                                    )
                                ]
                            )
                        )
                    ],
                    statements: [
                        VarDecNode(
                            IdentifierNode(
                                "variable",
                                references: CommonToken(0)
                            ),
                            datatype: .integer,
                            assign: FuncCallNode(
                                IdentifierNode(
                                    "foo",
                                    references: CommonToken(0)
                                ),
                                parameters: [
                                    PrimitiveNode(
                                        "0",
                                        ofType: .integer,
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
    }

    func testGlobalArrayAndIntFunctionThrowsError() {
        let ast = ObjectDecNode(
            "GlobalArrayAndIntFunctionTest",
            variables: [
                VarDecNode(
                    IdentifierNode(
                        "foo",
                        references: CommonToken(0)
                    ),
                    datatype: .array(of: .integer),
                    assign: ArrayNode(
                        [
                            PrimitiveNode(
                                "1",
                                ofType: .integer,
                                references: CommonToken(0)
                            ),
                            PrimitiveNode(
                                "2",
                                ofType: .integer,
                                references: CommonToken(0)
                            )
                        ]
                    )
                )
            ],
            functions: [
                FuncDecNode(
                    "foo",
                    parameters: [
                        ("bar", .integer)
                    ],
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
                    statements: [
                        FuncCallNode(
                            IdentifierNode(
                                "foo",
                                references: CommonToken(0)
                            ),
                            parameters: [
                                PrimitiveNode(
                                    "0",
                                    ofType: .integer,
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

    // MARK: - Assignment

    // MARK: Global
    func testAssignToGlobalIntegerArray() {
        let ast = ObjectDecNode(
            "IntegerArrayTest",
            variables: [
                VarDecNode(
                    IdentifierNode(
                        "foo",
                        references: CommonToken(0)
                    ),
                    datatype: .array(of: .integer),
                    assign: ArrayNode(
                        [
                            PrimitiveNode(
                                "1",
                                ofType: .integer,
                                references: CommonToken(0)
                            ),
                            PrimitiveNode(
                                "2",
                                ofType: .integer,
                                references: CommonToken(0)
                            )
                        ]
                    )
                )
            ],
            functions: [
                FuncDecNode(
                    "main",
                    parameters: [
                        ("args", .array(of: .string))
                    ],
                    returnType: nil,
                    declarations: [],
                    statements: [
                        VarAssignNode(
                            IdentifierNode(
                                "foo",
                                references: CommonToken(0)
                            ),
                            index: PrimitiveNode(
                                "1",
                                ofType: .integer,
                                references: CommonToken(0)
                            ),
                            assign: PrimitiveNode(
                                "3",
                                ofType: .integer,
                                references: CommonToken(0)
                            )
                        )
                    ]
                )
            ]
        )

        XCTAssertNoThrow(try TypeChecker.validate(ast))
    }

    func testAssignToGlobalDoubleArray() {
        let ast = ObjectDecNode(
            "DoubleArrayTest",
            variables: [
                VarDecNode(
                    IdentifierNode(
                        "foo",
                        references: CommonToken(0)
                    ),
                    datatype: .array(of: .double),
                    assign: ArrayNode(
                        [
                            PrimitiveNode(
                                "1.0",
                                ofType: .double,
                                references: CommonToken(0)
                            ),
                            PrimitiveNode(
                                "2.0",
                                ofType: .double,
                                references: CommonToken(0)
                            )
                        ]
                    )
                )
            ],
            functions: [
                FuncDecNode(
                    "main",
                    parameters: [
                        ("args", .array(of: .string))
                    ],
                    returnType: nil,
                    declarations: [],
                    statements: [
                        VarAssignNode(
                            IdentifierNode(
                                "foo",
                                references: CommonToken(0)
                            ),
                            index: PrimitiveNode(
                                "1",
                                ofType: .integer,
                                references: CommonToken(0)
                            ),
                            assign: PrimitiveNode(
                                "3.0",
                                ofType: .double,
                                references: CommonToken(0)
                            )
                        )
                    ]
                )
            ]
        )

        XCTAssertNoThrow(try TypeChecker.validate(ast))
    }

    func testAssignIntegerToGlobalDoubleArray() {
        let ast = ObjectDecNode(
            "DoubleArrayTest",
            variables: [
                VarDecNode(
                    IdentifierNode(
                        "foo",
                        references: CommonToken(0)
                    ),
                    datatype: .array(of: .double),
                    assign: ArrayNode(
                        [
                            PrimitiveNode(
                                "1.0",
                                ofType: .double,
                                references: CommonToken(0)
                            ),
                            PrimitiveNode(
                                "2.0",
                                ofType: .double,
                                references: CommonToken(0)
                            )
                        ]
                    )
                )
            ],
            functions: [
                FuncDecNode(
                    "main",
                    parameters: [
                        ("args", .array(of: .string))
                    ],
                    returnType: nil,
                    declarations: [],
                    statements: [
                        VarAssignNode(
                            IdentifierNode(
                                "foo",
                                references: CommonToken(0)
                            ),
                            index: PrimitiveNode(
                                "1",
                                ofType: .integer,
                                references: CommonToken(0)
                            ),
                            assign: PrimitiveNode(
                                "3",
                                ofType: .integer,
                                references: CommonToken(0)
                            )
                        )
                    ]
                )
            ]
        )

        XCTAssertNoThrow(try TypeChecker.validate(ast))
    }


    func testAssignToGlobalStringArray() {
        let ast = ObjectDecNode(
            "StringArrayTest",
            variables: [
                VarDecNode(
                    IdentifierNode(
                        "foo",
                        references: CommonToken(0)
                    ),
                    datatype: .array(of: .string),
                    assign: ArrayNode(
                        [
                            PrimitiveNode(
                                "foo",
                                ofType: .string,
                                references: CommonToken(0)
                            ),
                            PrimitiveNode(
                                "bar",
                                ofType: .string,
                                references: CommonToken(0)
                            )
                        ]
                    )
                )
            ],
            functions: [
                FuncDecNode(
                    "main",
                    parameters: [
                        ("args", .array(of: .string))
                    ],
                    returnType: nil,
                    declarations: [],
                    statements: [
                        VarAssignNode(
                            IdentifierNode(
                                "foo",
                                references: CommonToken(0)
                            ),
                            index: PrimitiveNode(
                                "1",
                                ofType: .integer,
                                references: CommonToken(0)
                            ),
                            assign: PrimitiveNode(
                                "foo",
                                ofType: .string,
                                references: CommonToken(0)
                            )
                        )
                    ]
                )
            ]
        )

        XCTAssertNoThrow(try TypeChecker.validate(ast))
    }

    func testAssignToGlobalBooleanArray() {
        let ast = ObjectDecNode(
            "BooleanArrayTest",
            variables: [
                VarDecNode(
                    IdentifierNode(
                        "foo",
                        references: CommonToken(0)
                    ),
                    datatype: .array(of: .boolean),
                    assign: ArrayNode(
                        [
                            PrimitiveNode(
                                "true",
                                ofType: .boolean,
                                references: CommonToken(0)
                            ),
                            PrimitiveNode(
                                "false",
                                ofType: .boolean,
                                references: CommonToken(0)
                            )
                        ]
                    )
                )
            ],
            functions: [
                FuncDecNode(
                    "main",
                    parameters: [
                        ("args", .array(of: .string))
                    ],
                    returnType: nil,
                    declarations: [],
                    statements: [
                        VarAssignNode(
                            IdentifierNode(
                                "foo",
                                references: CommonToken(0)
                            ),
                            index: PrimitiveNode(
                                "1",
                                ofType: .integer,
                                references: CommonToken(0)
                            ),
                            assign: PrimitiveNode(
                                "true",
                                ofType: .boolean,
                                references: CommonToken(0)
                            )
                        )
                    ]
                )
            ]
        )

        XCTAssertNoThrow(try TypeChecker.validate(ast))
    }

    // MARK: Local
    func testAssignToLocalIntegerArray() {
        let ast = ObjectDecNode(
            "IntegerArrayTest",
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
                                "foo",
                                references: CommonToken(0)
                            ),
                            datatype: .array(of: .integer),
                            assign: ArrayNode(
                                [
                                    PrimitiveNode(
                                        "1",
                                        ofType: .integer,
                                        references: CommonToken(0)
                                    ),
                                    PrimitiveNode(
                                        "2",
                                        ofType: .integer,
                                        references: CommonToken(0)
                                    )
                                ]
                            )
                        )
                    ],
                    statements: [
                        VarAssignNode(
                            IdentifierNode(
                                "foo",
                                references: CommonToken(0)
                            ),
                            index: PrimitiveNode(
                                "1",
                                ofType: .integer,
                                references: CommonToken(0)
                            ),
                            assign: PrimitiveNode(
                                "3",
                                ofType: .integer,
                                references: CommonToken(0)
                            )
                        )
                    ]
                )
            ]
        )

        XCTAssertNoThrow(try TypeChecker.validate(ast))
    }

    func testAssignToLocalDoubleArray() {
        let ast = ObjectDecNode(
            "DoubleArrayTest",
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
                                "foo",
                                references: CommonToken(0)
                            ),
                            datatype: .array(of: .double),
                            assign: ArrayNode(
                                [
                                    PrimitiveNode(
                                        "1.0",
                                        ofType: .double,
                                        references: CommonToken(0)
                                    ),
                                    PrimitiveNode(
                                        "2.0",
                                        ofType: .double,
                                        references: CommonToken(0)
                                    )
                                ]
                            )
                        )
                    ],
                    statements: [
                        VarAssignNode(
                            IdentifierNode(
                                "foo",
                                references: CommonToken(0)
                            ),
                            index: PrimitiveNode(
                                "1",
                                ofType: .integer,
                                references: CommonToken(0)
                            ),
                            assign: PrimitiveNode(
                                "3.0",
                                ofType: .double,
                                references: CommonToken(0)
                            )
                        )
                    ]
                )
            ]
        )

        XCTAssertNoThrow(try TypeChecker.validate(ast))
    }

    func testAssignIntegerToLocalDoubleArray() {
        let ast = ObjectDecNode(
            "DoubleArrayTest",
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
                                "foo",
                                references: CommonToken(0)
                            ),
                            datatype: .array(of: .double),
                            assign: ArrayNode(
                                [
                                    PrimitiveNode(
                                        "1.0",
                                        ofType: .double,
                                        references: CommonToken(0)
                                    ),
                                    PrimitiveNode(
                                        "2.0",
                                        ofType: .double,
                                        references: CommonToken(0)
                                    )
                                ]
                            )
                        )
                    ],
                    statements: [
                        VarAssignNode(
                            IdentifierNode(
                                "foo",
                                references: CommonToken(0)
                            ),
                            index: PrimitiveNode(
                                "1",
                                ofType: .integer,
                                references: CommonToken(0)
                            ),
                            assign: PrimitiveNode(
                                "3",
                                ofType: .integer,
                                references: CommonToken(0)
                            )
                        )
                    ]
                )
            ]
        )

        XCTAssertNoThrow(try TypeChecker.validate(ast))
    }

    func testAssignToLocalStringArray() {
        let ast = ObjectDecNode(
            "StringArrayTest",
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
                                "foo",
                                references: CommonToken(0)
                            ),
                            datatype: .array(of: .string),
                            assign: ArrayNode(
                                [
                                    PrimitiveNode(
                                        "foo",
                                        ofType: .string,
                                        references: CommonToken(0)
                                    ),
                                    PrimitiveNode(
                                        "bar",
                                        ofType: .string,
                                        references: CommonToken(0)
                                    )
                                ]
                            )
                        )
                    ],
                    statements: [
                        VarAssignNode(
                            IdentifierNode(
                                "foo",
                                references: CommonToken(0)
                            ),
                            index: PrimitiveNode(
                                "1",
                                ofType: .integer,
                                references: CommonToken(0)
                            ),
                            assign: PrimitiveNode(
                                "foo",
                                ofType: .string,
                                references: CommonToken(0)
                            )
                        )
                    ]
                )
            ]
        )

        XCTAssertNoThrow(try TypeChecker.validate(ast))
    }

    func testAssignToLocalBooleanArray() {
        let ast = ObjectDecNode(
            "BooleanArrayTest",
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
                                "foo",
                                references: CommonToken(0)
                            ),
                            datatype: .array(of: .boolean),
                            assign: ArrayNode(
                                [
                                    PrimitiveNode(
                                        "true",
                                        ofType: .boolean,
                                        references: CommonToken(0)
                                    ),
                                    PrimitiveNode(
                                        "false",
                                        ofType: .boolean,
                                        references: CommonToken(0)
                                    )
                                ]
                            )
                        )
                    ],
                    statements: [
                        VarAssignNode(
                            IdentifierNode(
                                "foo",
                                references: CommonToken(0)
                            ),
                            index: PrimitiveNode(
                                "1",
                                ofType: .integer,
                                references: CommonToken(0)
                            ),
                            assign: PrimitiveNode(
                                "true",
                                ofType: .boolean,
                                references: CommonToken(0)
                            )
                        )
                    ]
                )
            ]
        )

        XCTAssertNoThrow(try TypeChecker.validate(ast))
    }

    // MARK: Index
    func testDoubleIndexInAssignmentThrowsError() {
        let ast = ObjectDecNode(
            "DoubleIndexArrayTest",
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
                                "foo",
                                references: CommonToken(0)
                            ),
                            datatype: .array(of: .boolean),
                            assign: ArrayNode(
                                [
                                    PrimitiveNode(
                                        "true",
                                        ofType: .boolean,
                                        references: CommonToken(0)
                                    ),
                                    PrimitiveNode(
                                        "false",
                                        ofType: .boolean,
                                        references: CommonToken(0)
                                    )
                                ]
                            )
                        )
                    ],
                    statements: [
                        VarAssignNode(
                            IdentifierNode(
                                "foo",
                                references: CommonToken(0)
                            ),
                            index: PrimitiveNode(
                                "1.0",
                                ofType: .double,
                                references: CommonToken(0)
                            ),
                            assign: PrimitiveNode(
                                "true",
                                ofType: .boolean,
                                references: CommonToken(0)
                            )
                        )
                    ]
                )
            ]
        )

        XCTAssertThrowsError(try TypeChecker.validate(ast))
    }

    func testBooleanIndexInAssignmentThrowsError() {
        let ast = ObjectDecNode(
            "BooleanIndexArrayTest",
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
                                "foo",
                                references: CommonToken(0)
                            ),
                            datatype: .array(of: .boolean),
                            assign: ArrayNode(
                                [
                                    PrimitiveNode(
                                        "true",
                                        ofType: .boolean,
                                        references: CommonToken(0)
                                    ),
                                    PrimitiveNode(
                                        "false",
                                        ofType: .boolean,
                                        references: CommonToken(0)
                                    )
                                ]
                            )
                        )
                    ],
                    statements: [
                        VarAssignNode(
                            IdentifierNode(
                                "foo",
                                references: CommonToken(0)
                            ),
                            index: PrimitiveNode(
                                "true",
                                ofType: .boolean,
                                references: CommonToken(0)
                            ),
                            assign: PrimitiveNode(
                                "true",
                                ofType: .boolean,
                                references: CommonToken(0)
                            )
                        )
                    ]
                )
            ]
        )

        XCTAssertThrowsError(try TypeChecker.validate(ast))
    }

    func testStringIndexInAssignmentThrowsError() {
        let ast = ObjectDecNode(
            "StringIndexArrayTest",
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
                                "foo",
                                references: CommonToken(0)
                            ),
                            datatype: .array(of: .boolean),
                            assign: ArrayNode(
                                [
                                    PrimitiveNode(
                                        "true",
                                        ofType: .boolean,
                                        references: CommonToken(0)
                                    ),
                                    PrimitiveNode(
                                        "false",
                                        ofType: .boolean,
                                        references: CommonToken(0)
                                    )
                                ]
                            )
                        )
                    ],
                    statements: [
                        VarAssignNode(
                            IdentifierNode(
                                "foo",
                                references: CommonToken(0)
                            ),
                            index: PrimitiveNode(
                                "1",
                                ofType: .string,
                                references: CommonToken(0)
                            ),
                            assign: PrimitiveNode(
                                "true",
                                ofType: .boolean,
                                references: CommonToken(0)
                            )
                        )
                    ]
                )
            ]
        )

        XCTAssertThrowsError(try TypeChecker.validate(ast))
    }
}
