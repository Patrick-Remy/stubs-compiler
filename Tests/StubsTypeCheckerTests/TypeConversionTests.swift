//
//  TypeConversionTests.swift
//  StubsTypeCheckerTests
//
//  Created by Patrick Remy on 01.01.18.
//

import XCTest
import Antlr4
@testable import StubsAST
import StubsTypeChecker

class TypeConversionTests: XCTestCase {

    func testAssignWrongTypeThrowsError() {
        let integerStringAST = ObjectDecNode(
            "AssignWrongTypeTest",
            variables: [
                VarDecNode(
                    IdentifierNode(
                        "foo",
                        references: CommonToken(0)
                    ),
                    datatype: .integer,
                    assign: PrimitiveNode(
                        "bar",
                        ofType: .string,
                        references: CommonToken(0)
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
        let integerDoubleAST = ObjectDecNode(
            "AssignWrongTypeTest",
            variables: [
                VarDecNode(
                    IdentifierNode(
                        "foo",
                        references: CommonToken(0)
                    ),
                    datatype: .integer,
                    assign: PrimitiveNode(
                        "1.0",
                        ofType: .double,
                        references: CommonToken(0)
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
        let integerBooleanAST = ObjectDecNode(
            "AssignWrongTypeTest",
            variables: [
                VarDecNode(
                    IdentifierNode(
                        "foo",
                        references: CommonToken(0)
                    ),
                    datatype: .integer,
                    assign: PrimitiveNode(
                        "true",
                        ofType: .boolean,
                        references: CommonToken(0)
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
        let integerArrayAST = ObjectDecNode(
            "AssignWrongTypeTest",
            variables: [
                VarDecNode(
                    IdentifierNode(
                        "foo",
                        references: CommonToken(0)
                    ),
                    datatype: .integer,
                    assign: ArrayNode(
                        [
                            PrimitiveNode(
                                "1",
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
        let stringIntegerAST = ObjectDecNode(
            "AssignWrongTypeTest",
            variables: [
                VarDecNode(
                    IdentifierNode(
                        "foo",
                        references: CommonToken(0)
                    ),
                    datatype: .string,
                    assign: PrimitiveNode(
                        "1",
                        ofType: .integer,
                        references: CommonToken(0)
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
        let stringDoubleAST = ObjectDecNode(
            "AssignWrongTypeTest",
            variables: [
                VarDecNode(
                    IdentifierNode(
                        "foo",
                        references: CommonToken(0)
                    ),
                    datatype: .string,
                    assign: PrimitiveNode(
                        "1.0",
                        ofType: .double,
                        references: CommonToken(0)
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
        let stringBooleanAST = ObjectDecNode(
            "AssignWrongTypeTest",
            variables: [
                VarDecNode(
                    IdentifierNode(
                        "foo",
                        references: CommonToken(0)
                    ),
                    datatype: .string,
                    assign: PrimitiveNode(
                        "true",
                        ofType: .boolean,
                        references: CommonToken(0)
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
        let stringArrayAST = ObjectDecNode(
            "AssignWrongTypeTest",
            variables: [
                VarDecNode(
                    IdentifierNode(
                        "foo",
                        references: CommonToken(0)
                    ),
                    datatype: .string,
                    assign: ArrayNode(
                        [
                            PrimitiveNode(
                                "foobar",
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
        let doubleStringAST = ObjectDecNode(
            "AssignWrongTypeTest",
            variables: [
                VarDecNode(
                    IdentifierNode(
                        "foo",
                        references: CommonToken(0)
                    ),
                    datatype: .double,
                    assign: PrimitiveNode(
                        "bar",
                        ofType: .string,
                        references: CommonToken(0)
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
        let doubleBooleanAST = ObjectDecNode(
            "AssignWrongTypeTest",
            variables: [
                VarDecNode(
                    IdentifierNode(
                        "foo",
                        references: CommonToken(0)
                    ),
                    datatype: .double,
                    assign: PrimitiveNode(
                        "true",
                        ofType: .boolean,
                        references: CommonToken(0)
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
        let doubleArrayAST = ObjectDecNode(
            "AssignWrongTypeTest",
            variables: [
                VarDecNode(
                    IdentifierNode(
                        "foo",
                        references: CommonToken(0)
                    ),
                    datatype: .double,
                    assign: ArrayNode(
                        [
                            PrimitiveNode(
                                "1.0",
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
        let booleanStringAST = ObjectDecNode(
            "AssignWrongTypeTest",
            variables: [
                VarDecNode(
                    IdentifierNode(
                        "foo",
                        references: CommonToken(0)
                    ),
                    datatype: .boolean,
                    assign: PrimitiveNode(
                        "bar",
                        ofType: .string,
                        references: CommonToken(0)
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
        let booleanIntegerAST = ObjectDecNode(
            "AssignWrongTypeTest",
            variables: [
                VarDecNode(
                    IdentifierNode(
                        "foo",
                        references: CommonToken(0)
                    ),
                    datatype: .boolean,
                    assign: PrimitiveNode(
                        "1",
                        ofType: .integer,
                        references: CommonToken(0)
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
        let booleanDoubleAST = ObjectDecNode(
            "AssignWrongTypeTest",
            variables: [
                VarDecNode(
                    IdentifierNode(
                        "foo",
                        references: CommonToken(0)
                    ),
                    datatype: .boolean,
                    assign: PrimitiveNode(
                        "1.0",
                        ofType: .double,
                        references: CommonToken(0)
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
        let booleanArrayAST = ObjectDecNode(
            "AssignWrongTypeTest",
            variables: [
                VarDecNode(
                    IdentifierNode(
                        "foo",
                        references: CommonToken(0)
                    ),
                    datatype: .boolean,
                    assign: ArrayNode(
                        [
                            PrimitiveNode(
                                "true",
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
        let arrayStringAST = ObjectDecNode(
            "AssignWrongTypeTest",
            variables: [
                VarDecNode(
                    IdentifierNode(
                        "foo",
                        references: CommonToken(0)
                    ),
                    datatype: .array(of: .string),
                    assign: PrimitiveNode(
                        "bar",
                        ofType: .string,
                        references: CommonToken(0)
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
        let arrayIntegerAST = ObjectDecNode(
            "AssignWrongTypeTest",
            variables: [
                VarDecNode(
                    IdentifierNode(
                        "foo",
                        references: CommonToken(0)
                    ),
                    datatype: .array(of: .integer),
                    assign: PrimitiveNode(
                        "bar",
                        ofType: .integer,
                        references: CommonToken(0)
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
        let arrayDoubleAST = ObjectDecNode(
            "AssignWrongTypeTest",
            variables: [
                VarDecNode(
                    IdentifierNode(
                        "foo",
                        references: CommonToken(0)
                    ),
                    datatype: .array(of: .double),
                    assign: PrimitiveNode(
                        "bar",
                        ofType: .double,
                        references: CommonToken(0)
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
        let arrayBooleanAST = ObjectDecNode(
            "AssignWrongTypeTest",
            variables: [
                VarDecNode(
                    IdentifierNode(
                        "foo",
                        references: CommonToken(0)
                    ),
                    datatype: .array(of: .boolean),
                    assign: PrimitiveNode(
                        "bar",
                        ofType: .boolean,
                        references: CommonToken(0)
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

        XCTAssertThrowsError(try TypeChecker.validate(integerStringAST))
        XCTAssertThrowsError(try TypeChecker.validate(integerDoubleAST))
        XCTAssertThrowsError(try TypeChecker.validate(integerBooleanAST))
        XCTAssertThrowsError(try TypeChecker.validate(integerArrayAST))
        XCTAssertThrowsError(try TypeChecker.validate(stringIntegerAST))
        XCTAssertThrowsError(try TypeChecker.validate(stringDoubleAST))
        XCTAssertThrowsError(try TypeChecker.validate(stringBooleanAST))
        XCTAssertThrowsError(try TypeChecker.validate(stringArrayAST))
        XCTAssertThrowsError(try TypeChecker.validate(doubleStringAST))
        XCTAssertThrowsError(try TypeChecker.validate(doubleBooleanAST))
        XCTAssertThrowsError(try TypeChecker.validate(doubleArrayAST))
        XCTAssertThrowsError(try TypeChecker.validate(booleanIntegerAST))
        XCTAssertThrowsError(try TypeChecker.validate(booleanDoubleAST))
        XCTAssertThrowsError(try TypeChecker.validate(booleanStringAST))
        XCTAssertThrowsError(try TypeChecker.validate(booleanArrayAST))
        XCTAssertThrowsError(try TypeChecker.validate(arrayStringAST))
        XCTAssertThrowsError(try TypeChecker.validate(arrayIntegerAST))
        XCTAssertThrowsError(try TypeChecker.validate(arrayDoubleAST))
        XCTAssertThrowsError(try TypeChecker.validate(arrayBooleanAST))
    }

    func testConvertIntegerToDouble() {
        let variableAssignmentAST = ObjectDecNode(
            "ConvertIntegerToDoubleTest",
            variables: [
                VarDecNode(
                    IdentifierNode(
                        "foo",
                        references: CommonToken(0)
                    ),
                    datatype: .double,
                    assign: PrimitiveNode(
                        "1",
                        ofType: .integer,
                        references: CommonToken(0)
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
        let functionCallAST = ObjectDecNode(
            "ConvertIntegerToDoubleTest",
            variables: [],
            functions: [
                FuncDecNode(
                    "foo",
                    parameters: [
                        ("bar", .double)
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

        XCTAssertNoThrow(try TypeChecker.validate(variableAssignmentAST))
        XCTAssertNoThrow(try TypeChecker.validate(functionCallAST))
    }

}
