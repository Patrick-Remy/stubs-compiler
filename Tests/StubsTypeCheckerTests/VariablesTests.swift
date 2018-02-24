//
//  VariablesTests.swift
//  StubsTypeCheckerTests
//
//  Created by Patrick Remy on 31.12.17.
//

import XCTest
import Antlr4
@testable import StubsAST
import StubsTypeChecker

class VariablesTests: XCTestCase {

    func testAssignToUndeclaredVariableThrowsError() {
        let ast = ObjectDecNode(
            "AssignToUndeclaredVariableTest",
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
                        VarAssignNode(
                            IdentifierNode(
                                "a",
                                references: CommonToken(0)
                            ),
                            assign: PrimitiveNode(
                                "bar",
                                ofType: .string,
                                references: CommonToken(0)
                            )
                        )
                    ]
                )
            ]
        )

        XCTAssertThrowsError(try TypeChecker.validate(ast))
    }

    // MARK: - Scope

    func testAssignToObjectVariable() {
        let ast = ObjectDecNode(
            "ObjectVariablesTest",
            variables: [
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
                                "a",
                                references: CommonToken(0)
                            ),
                            assign: PrimitiveNode(
                                "2",
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

    func testAssignToFunctionVariable() {
        let ast = ObjectDecNode(
            "FunctionVariablesTest",
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
                        )
                    ],
                    statements: [
                        VarAssignNode(
                            IdentifierNode(
                                "a",
                                references: CommonToken(0)
                            ),
                            assign: PrimitiveNode(
                                "2",
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

    func testFunctionVariablesOverrideObjectsVariables() {
        let ast = ObjectDecNode(
            "FunctionVariablesOverrideObjectsVariablesTest",
            variables: [
                VarDecNode(
                    IdentifierNode(
                        "a",
                        references: CommonToken(0)
                    ),
                    datatype: .string,
                    assign: PrimitiveNode(
                        "foo",
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
                        )
                    ],
                    statements: [
                        VarAssignNode(
                            IdentifierNode(
                                "a",
                                references: CommonToken(0)
                            ),
                            assign: PrimitiveNode(
                                "2",
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

    func testAssignToWrongScopeVariableThrowsError() {
        let ast = ObjectDecNode(
            "AssignToWrongScopeVariableTest",
            variables: [
                VarDecNode(
                    IdentifierNode(
                        "a",
                        references: CommonToken(0)
                    ),
                    datatype: .string,
                    assign: PrimitiveNode(
                        "foo",
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
                        )
                    ],
                    statements: [
                        VarAssignNode(
                            IdentifierNode(
                                "a",
                                references: CommonToken(0)
                            ),
                            assign: PrimitiveNode(
                                "bar",
                                ofType: .string,
                                references: CommonToken(0)
                            )
                        )
                    ]
                )
            ]
        )

        XCTAssertThrowsError(try TypeChecker.validate(ast))
    }

    func testReferenceFunctionParameter() {
        let ast = ObjectDecNode(
            "ReferenceFunctionParameterTest",
            variables: [],
            functions: [
                FuncDecNode(
                    "foo",
                    parameters: [
                        ("bar", .integer)
                    ],
                    returnType: nil,
                    declarations: [
                        VarDecNode(
                            IdentifierNode(
                                "a",
                                references: CommonToken(0)
                            ),
                            datatype: .integer,
                            assign: IdentifierNode(
                                "bar",
                                references: CommonToken(0)
                            )
                        )
                    ],
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

        XCTAssertNoThrow(try TypeChecker.validate(ast))
    }

    // MARK: - Assignments expressions

    func testAssignExpressionToBoolean() {
        let relationalExpressionAST = ObjectDecNode(
            "AssignExpressionToBooleanTest",
            variables: [
                VarDecNode(
                    IdentifierNode(
                        "foo",
                        references: CommonToken(0)
                    ),
                    datatype: .boolean,
                    assign: RelationalNode(
                        PrimitiveNode(
                            "1",
                            ofType: .integer,
                            references: CommonToken(0)
                        ),
                        greaterOrEqualThan: PrimitiveNode(
                            "1",
                            ofType: .integer,
                            references: CommonToken(0)
                        ),
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
                    declarations: [

                    ],
                    statements: []
                )
            ]
        )
        let equalExpressionAST = ObjectDecNode(
            "AssignExpressionToBooleanTest",
            variables: [
                VarDecNode(
                    IdentifierNode(
                        "foo",
                        references: CommonToken(0)
                    ),
                    datatype: .boolean,
                    assign: EqualNode(
                        PrimitiveNode(
                            "1",
                            ofType: .integer,
                            references: CommonToken(0)
                        ),
                        equals: PrimitiveNode(
                            "1",
                            ofType: .integer,
                            references: CommonToken(0)
                        ),
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
                    declarations: [

                    ],
                    statements: []
                )
            ]
        )
        let orExpressionAST = ObjectDecNode(
            "AssignExpressionToBooleanTest",
            variables: [
                VarDecNode(
                    IdentifierNode(
                        "foo",
                        references: CommonToken(0)
                    ),
                    datatype: .boolean,
                    assign: OrNode(
                        PrimitiveNode(
                            "true",
                            ofType: .boolean,
                            references: CommonToken(0)
                        ),
                        or: PrimitiveNode(
                            "false",
                            ofType: .boolean,
                            references: CommonToken(0)
                        ),
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
                    declarations: [

                    ],
                    statements: []
                )
            ]
        )
        let notExpressionAST = ObjectDecNode(
            "AssignExpressionToBooleanTest",
            variables: [
                VarDecNode(
                    IdentifierNode(
                        "foo",
                        references: CommonToken(0)
                    ),
                    datatype: .boolean,
                    assign: UnaryNode(
                        not: PrimitiveNode(
                            "true",
                            ofType: .boolean,
                            references: CommonToken(0)
                        ),
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
                    declarations: [

                    ],
                    statements: []
                )
            ]
        )

        XCTAssertNoThrow(try TypeChecker.validate(relationalExpressionAST))
        XCTAssertNoThrow(try TypeChecker.validate(equalExpressionAST))
        XCTAssertNoThrow(try TypeChecker.validate(orExpressionAST))
        XCTAssertNoThrow(try TypeChecker.validate(notExpressionAST))
    }

    func testAssignExpressionToInteger() {
        let addExpressionAST = ObjectDecNode(
            "AssignExpressionToIntegerTest",
            variables: [
                VarDecNode(
                    IdentifierNode(
                        "foo",
                        references: CommonToken(0)
                    ),
                    datatype: .integer,
                    assign: AdditiveNode(
                        PrimitiveNode(
                            "1",
                            ofType: .integer,
                            references: CommonToken(0)
                        ),
                        plus: PrimitiveNode(
                            "2",
                            ofType: .integer,
                            references: CommonToken(0)
                        ),
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
                    declarations: [

                    ],
                    statements: []
                )
            ]
        )
        let multExpressionAST = ObjectDecNode(
            "AssignExpressionToIntegerTest",
            variables: [
                VarDecNode(
                    IdentifierNode(
                        "foo",
                        references: CommonToken(0)
                    ),
                    datatype: .integer,
                    assign: MultNode(
                        PrimitiveNode(
                            "1",
                            ofType: .integer,
                            references: CommonToken(0)
                        ),
                        mult: PrimitiveNode(
                            "2",
                            ofType: .integer,
                            references: CommonToken(0)
                        ),
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
                    declarations: [

                    ],
                    statements: []
                )
            ]
        )
        let unaryExpressionAST = ObjectDecNode(
            "AssignExpressionToBooleanTest",
            variables: [
                VarDecNode(
                    IdentifierNode(
                        "foo",
                        references: CommonToken(0)
                    ),
                    datatype: .integer,
                    assign: UnaryNode(
                        minus: PrimitiveNode(
                            "3",
                            ofType: .integer,
                            references: CommonToken(0)
                        ),
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
                    declarations: [

                    ],
                    statements: []
                )
            ]
        )

        XCTAssertNoThrow(try TypeChecker.validate(addExpressionAST))
        XCTAssertNoThrow(try TypeChecker.validate(multExpressionAST))
        XCTAssertNoThrow(try TypeChecker.validate(unaryExpressionAST))
    }

}
