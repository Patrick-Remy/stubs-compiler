//
//  FunctionCallTests.swift
//  StubsTypeCheckerTests
//
//  Created by Patrick Remy on 31.12.17.
//

import XCTest
import Antlr4
@testable import StubsAST
import StubsTypeChecker

class FunctionCallTests: XCTestCase {

    func testUndeclaredFunctionThrowsError() {
        let ast = ObjectDecNode(
            "UndeclaredFunctionTest",
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
                                "foo",
                                references: CommonToken(0)
                            ),
                            parameters: []
                        )
                    ]
                )
            ]
        )

        XCTAssertThrowsError(try TypeChecker.validate(ast))
    }

    func testFunctionCallBeforeDeclaration() {
        let ast = ObjectDecNode(
            "FunctionCallBeforeDeclarationTest",
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
                                "foo",
                                references: CommonToken(0)
                            ),
                            parameters: []
                        )
                    ]
                ),
                FuncDecNode(
                    "foo",
                    parameters: [],
                    returnType: nil,
                    declarations: [],
                    statements: []
                )
            ]
        )

        XCTAssertNoThrow(try TypeChecker.validate(ast))
    }

    func testFunctionCallWithoutParameters() {
        let ast = ObjectDecNode(
            "FunctionCallTest",
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

        XCTAssertNoThrow(try TypeChecker.validate(ast))
    }

    func testFunctionCallWithParameters() {
        let ast = ObjectDecNode(
            "FunctionCallTest",
            variables: [],
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

        XCTAssertNoThrow(try TypeChecker.validate(ast))
    }

    func testFunctionCallWithWrongParametersThrowsError() {
        let ast = ObjectDecNode(
            "FunctionCallTest",
            variables: [],
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

        XCTAssertThrowsError(try TypeChecker.validate(ast))
    }

    func testNestedFunctionCalls() {
        let ast = ObjectDecNode(
            "NestedFunctionCallTest",
            variables: [],
            functions: [
                FuncDecNode(
                    "foo",
                    parameters: [
                        ("bar", .integer)
                    ],
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
                    statements: [
                        FuncCallNode(
                            IdentifierNode(
                                "foo",
                                references: CommonToken(0)
                            ),
                            parameters: [
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
            ]
        )

        XCTAssertNoThrow(try TypeChecker.validate(ast))
    }

    func testRecursiveFunctionCalls() {
        let ast = ObjectDecNode(
            "RecursiveFunctionCallTest",
            variables: [],
            functions: [
                FuncDecNode(
                    "foo",
                    parameters: [],
                    returnType: .integer,
                    declarations: [],
                    statements: [
                        FuncCallNode(
                            IdentifierNode(
                                "foo",
                                references: CommonToken(0)
                            ),
                            parameters: []
                        ),
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

        XCTAssertNoThrow(try TypeChecker.validate(ast))
    }

    // MARK: - Function overloading

    func testFunctionOverloadingSameName() {
        let ast = ObjectDecNode(
            "FunctionOverloadingSameNameTest",
            variables: [],
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
                    "foo",
                    parameters: [
                        ("bar1", .integer),
                        ("bar2", .integer)
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
                        ),
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
                                ),
                                PrimitiveNode(
                                    "2",
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

    func testFunctionOverloadingSameNameAndNumberOfArguments() {
        let ast = ObjectDecNode(
            "FunctionOverloadingSameNameAndNumberOfArgumentsTest",
            variables: [],
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
                    "foo",
                    parameters: [
                        ("bar", .string)
                    ],
                    returnType: nil,
                    declarations: [],
                    statements: []
                ),
                FuncDecNode(
                    "foo",
                    parameters: [
                        ("bar", .boolean)
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
                        ),
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
                        ),
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

        XCTAssertNoThrow(try TypeChecker.validate(ast))
    }

    // MARK: - Call in blocks

    func testFunctionCallInWhile() {
        let ast = ObjectDecNode(
            "FunctionCallTest",
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
                    statements: [
                        WhileNode(
                            PrimitiveNode(
                                "true",
                                ofType: .boolean,
                                references: CommonToken(0)
                            ),
                            do: BlockNode(
                                [
                                    FuncCallNode(
                                        IdentifierNode(
                                            "foo",
                                            references: CommonToken(0)
                                        ),
                                        parameters: []
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

    func testFunctionCallInIf() {
        let ast = ObjectDecNode(
            "FunctionCallTest",
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
                    statements: [
                        IfNode(
                            PrimitiveNode(
                                "true",
                                ofType: .boolean,
                                references: CommonToken(0)
                            ),
                            then: BlockNode(
                                [
                                    FuncCallNode(
                                        IdentifierNode(
                                            "foo",
                                            references: CommonToken(0)
                                        ),
                                        parameters: []
                                    )
                                ]
                            ),
                            else: BlockNode(
                                [
                                    FuncCallNode(
                                        IdentifierNode(
                                            "foo",
                                            references: CommonToken(0)
                                        ),
                                        parameters: []
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

    // MARK: - println

    func testPrintlnString() {
        let ast = ObjectDecNode(
            "PrintlnStringTest",
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
                                PrimitiveNode(
                                    "foobar",
                                    ofType: .string,
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

    func testPrintlnInteger() {
        let ast = ObjectDecNode(
            "PrintlnStringTest",
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

        XCTAssertNoThrow(try TypeChecker.validate(ast))
    }

    func testPrintlnDouble() {
        let ast = ObjectDecNode(
            "PrintlnStringTest",
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
                                PrimitiveNode(
                                    "1.0",
                                    ofType: .double,
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

}
