//
//  VariableTests.swift
//  StubsCodeGeneratorTests
//
//  Created by Patrick Remy on 27.01.18.
//

import XCTest
import Antlr4
@testable import StubsAST
import StubsTypeChecker
@testable import StubsCodeGenerator


class VariableTests: XCTestCase {

    override func setUp() {
        continueAfterFailure = false
    }

    func testGenerateUniqueVariableIdentifier() {
        let codeGenerator = CodeGenerator()
        let variableId1 = codeGenerator.generateIdForLocalVariable("a", ofType: .integer)
        XCTAssertEqual(codeGenerator.localVariableForIdentifier("a")?.0, variableId1)
        let variableId2 = codeGenerator.generateIdForLocalVariable("b", ofType: .integer)
        XCTAssertEqual(codeGenerator.localVariableForIdentifier("b")?.0, variableId2)
        XCTAssertNotEqual(variableId1, variableId2)
    }

    // MARK: - Declaration

    // MARK: Local

    /// Doubles need 2 local variables, so ensure further declaration doesn't override it
    func testDeclareLocalDouble() {
        let ast = ObjectDecNode(
            "VariableDeclareLocalDoubleTest",
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
                            datatype: .double,
                            assign: PrimitiveNode(
                                "1.0",
                                ofType: .double,
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
                                "2",
                                ofType: .integer,
                                references: CommonToken(0)
                            )
                        )
                    ],
                    statements: [
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
            ]
        )

        XCTAssertNoThrow(try TypeChecker.validate(ast))
        XCTAssertNoThrow(try TestSuite.generateClassFile(ast))
        let url = try! TestSuite.generateClassFile(ast)
        XCTAssertNoThrow(try TestSuite.runProgram(url, className: "VariableDeclareLocalDoubleTest"))
        let output: String! = try! TestSuite.runProgram(url, className: "VariableDeclareLocalDoubleTest")
        XCTAssertNotNil(output)
        let outputNumber: Double! = Double(output.trimmingCharacters(in: .whitespacesAndNewlines))
        XCTAssertNotNil(outputNumber)
        XCTAssertEqual((outputNumber * 10).rounded() / 10, 1.0)
    }

    /// Strings are handled via address
    func testDeclareLocalString() {
        let ast = ObjectDecNode(
            "VariableDeclareLocalStringTest",
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
                            datatype: .string,
                            assign: PrimitiveNode(
                                "Hello World",
                                ofType: .string,
                                references: CommonToken(0)
                            )
                        )
                    ],
                    statements: [
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
            ]
        )

        XCTAssertNoThrow(try TypeChecker.validate(ast))
        XCTAssertNoThrow(try TestSuite.generateClassFile(ast))
        let url = try! TestSuite.generateClassFile(ast)
        XCTAssertNoThrow(try TestSuite.runProgram(url, className: "VariableDeclareLocalStringTest"))
        let output = try! TestSuite.runProgram(url, className: "VariableDeclareLocalStringTest")
        XCTAssertEqual(output, "Hello World\n")
    }

    /// Boolean is handled as integer
    func testDeclareLocalBoolean() {
        let ast = ObjectDecNode(
            "VariableDeclareLocalBooleanTest",
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
                            datatype: .boolean,
                            assign: PrimitiveNode(
                                "true",
                                ofType: .boolean,
                                references: CommonToken(0)
                            )
                        )
                    ],
                    statements: [
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
            ]
        )

        XCTAssertNoThrow(try TypeChecker.validate(ast))
        XCTAssertNoThrow(try TestSuite.generateClassFile(ast))
        let url = try! TestSuite.generateClassFile(ast)
        XCTAssertNoThrow(try TestSuite.runProgram(url, className: "VariableDeclareLocalBooleanTest"))
        let output = try! TestSuite.runProgram(url, className: "VariableDeclareLocalBooleanTest")
        XCTAssertEqual(output, "true\n")
    }

    // MARK: Global

    /// Doubles need 2 local variables, so ensure further declaration doesn't override it
    func testDeclareGlobalDouble() {
        let ast = ObjectDecNode(
            "VariableDeclareGlobalDoubleTest",
            variables: [
                VarDecNode(
                    IdentifierNode(
                        "a",
                        references: CommonToken(0)
                    ),
                    datatype: .double,
                    assign: PrimitiveNode(
                        "1.0",
                        ofType: .double,
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
                        "2",
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
            ]
        )

        XCTAssertNoThrow(try TypeChecker.validate(ast))
        XCTAssertNoThrow(try TestSuite.generateClassFile(ast))
        let url = try! TestSuite.generateClassFile(ast)
        XCTAssertNoThrow(try TestSuite.runProgram(url, className: "VariableDeclareGlobalDoubleTest"))
        let output: String! = try! TestSuite.runProgram(url, className: "VariableDeclareGlobalDoubleTest")
        XCTAssertNotNil(output)
        let outputNumber: Double! = Double(output.trimmingCharacters(in: .whitespacesAndNewlines))
        XCTAssertNotNil(outputNumber)
        XCTAssertEqual((outputNumber * 10).rounded() / 10, 1.0)
    }

    /// Strings are handled via address
    func testDeclareGlobalString() {
        let ast = ObjectDecNode(
            "VariableDeclareGlobalStringTest",
            variables: [
                VarDecNode(
                    IdentifierNode(
                        "a",
                        references: CommonToken(0)
                    ),
                    datatype: .string,
                    assign: PrimitiveNode(
                        "Hello World",
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
                    statements: [
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
            ]
        )

        XCTAssertNoThrow(try TypeChecker.validate(ast))
        XCTAssertNoThrow(try TestSuite.generateClassFile(ast))
        let url = try! TestSuite.generateClassFile(ast)
        XCTAssertNoThrow(try TestSuite.runProgram(url, className: "VariableDeclareGlobalStringTest"))
        let output = try! TestSuite.runProgram(url, className: "VariableDeclareGlobalStringTest")
        XCTAssertEqual(output, "Hello World\n")
    }

    /// Boolean is handled as integer
    func testDeclareGlobalBoolean() {
        let ast = ObjectDecNode(
            "VariableDeclareGlobalBooleanTest",
            variables: [
                VarDecNode(
                    IdentifierNode(
                        "a",
                        references: CommonToken(0)
                    ),
                    datatype: .boolean,
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
                    statements: [
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
            ]
        )

        XCTAssertNoThrow(try TypeChecker.validate(ast))
        XCTAssertNoThrow(try TestSuite.generateClassFile(ast))
        let url = try! TestSuite.generateClassFile(ast)
        XCTAssertNoThrow(try TestSuite.runProgram(url, className: "VariableDeclareGlobalBooleanTest"))
        let output = try! TestSuite.runProgram(url, className: "VariableDeclareGlobalBooleanTest")
        XCTAssertEqual(output, "true\n")
    }

    // MARK: - Assignment
    
    func testAssignToObjectVariable() {
        let ast = ObjectDecNode(
            "VariableAssignToObjectVariableTest",
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
            ]
        )

        XCTAssertNoThrow(try TypeChecker.validate(ast))
        XCTAssertNoThrow(try TestSuite.generateClassFile(ast))
        let url = try! TestSuite.generateClassFile(ast)
        XCTAssertNoThrow(try TestSuite.runProgram(url, className: "VariableAssignToObjectVariableTest"))
        let output = try! TestSuite.runProgram(url, className: "VariableAssignToObjectVariableTest")
        XCTAssertEqual(output, "2\n")
    }

    func testAssignToFunctionVariable() {
        let ast = ObjectDecNode(
            "VariableAssignToFunctionVariableTest",
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
            ]
        )

        XCTAssertNoThrow(try TypeChecker.validate(ast))
        XCTAssertNoThrow(try TestSuite.generateClassFile(ast))
        let url = try! TestSuite.generateClassFile(ast)
        XCTAssertNoThrow(try TestSuite.runProgram(url, className: "VariableAssignToFunctionVariableTest"))
        let output = try! TestSuite.runProgram(url, className: "VariableAssignToFunctionVariableTest")
        XCTAssertEqual(output, "2\n")
    }

    func testAssignVariableRecursive() {
        let ast = ObjectDecNode(
            "VariableAssignVariableRecursiveTest",
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
                            datatype: .double,
                            assign: PrimitiveNode(
                                "1.0",
                                ofType: .double,
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
                            assign: IdentifierNode(
                                "a",
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
            ]
        )

        XCTAssertNoThrow(try TypeChecker.validate(ast))
        XCTAssertNoThrow(try TestSuite.generateClassFile(ast))
        let url = try! TestSuite.generateClassFile(ast)
        XCTAssertNoThrow(try TestSuite.runProgram(url, className: "VariableAssignVariableRecursiveTest"))
        let output = try! TestSuite.runProgram(url, className: "VariableAssignVariableRecursiveTest")
        XCTAssertEqual(output, "1.0\n")
    }

    func testAssignExpression() {
        let ast = ObjectDecNode(
            "VariableAssignExpressionTest",
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
                                "2",
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
            ]
        )

        XCTAssertNoThrow(try TypeChecker.validate(ast))
        XCTAssertNoThrow(try TestSuite.generateClassFile(ast))
        let url = try! TestSuite.generateClassFile(ast)
        XCTAssertNoThrow(try TestSuite.runProgram(url, className: "VariableAssignExpressionTest"))
        let output = try! TestSuite.runProgram(url, className: "VariableAssignExpressionTest")
        XCTAssertEqual(output, "3\n")
    }

    func testAssignIntToDouble() {
        let ast = ObjectDecNode(
            "VariableAssignExpressionTest",
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
                            datatype: .double,
                            assign: PrimitiveNode(
                                "1.0",
                                ofType: .double,
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
                                "2",
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
                            assign: IdentifierNode(
                                "b",
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
            ]
        )

        XCTAssertNoThrow(try TypeChecker.validate(ast))
        XCTAssertNoThrow(try TestSuite.generateClassFile(ast))
        let url = try! TestSuite.generateClassFile(ast)
        XCTAssertNoThrow(try TestSuite.runProgram(url, className: "VariableAssignExpressionTest"))
        let output: String! = try! TestSuite.runProgram(url, className: "VariableAssignExpressionTest")
        XCTAssertNotNil(output)
        let outputNumber: Double! = Double(output.trimmingCharacters(in: .whitespacesAndNewlines))
        XCTAssertNotNil(outputNumber)
        XCTAssertEqual((outputNumber * 10).rounded() / 10, 2.0)
    }
    
}
