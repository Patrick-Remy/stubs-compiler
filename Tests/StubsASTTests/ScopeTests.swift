//
//  ScopeTests.swift
//  StubsASTTests
//
//  Created by Patrick Remy on 09.01.18.
//

import XCTest
import Antlr4
@testable import StubsAST

class ScopeTests: XCTestCase {

    // MARK: - Variables

    func testUndeclaredIdentifierThrowsError() {
        let identifierNode = IdentifierNode("a", references: CommonToken(0))

        let scope = Scope()
        XCTAssertThrowsError(try scope.declarationNode(forVariable: identifierNode))
    }

    func testVariableDeclaration() {
        let variableDeclaration = VarDecNode(
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

        let scope = Scope()
        XCTAssertNoThrow(try scope.register(variable: variableDeclaration))
        XCTAssertNoThrow(try scope.declarationNode(forVariable: variableDeclaration.identifier))
    }

    func testDuplicateDeclarationThrowsError() {
        let variableDeclaration = VarDecNode(
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

        let scope = Scope()
        XCTAssertNoThrow(try scope.register(variable: variableDeclaration))
        XCTAssertThrowsError(try scope.register(variable: variableDeclaration))
    }

    func testDeclarationInDifferentScope() {
        let variableDeclaration = VarDecNode(
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

        let scope = Scope()
        XCTAssertNoThrow(try scope.register(variable: variableDeclaration))
        let childScope = Scope(ofParent: scope)
        XCTAssertNoThrow(try childScope.register(variable: variableDeclaration))
    }

    // MARK: - Function declarations

    func testUndeclaredFunctionThrowsError() {
        let functionCall = FuncCallNode(
            IdentifierNode("a", references: CommonToken(0)),
            parameters: []
        )

        let scope = Scope()
        XCTAssertThrowsError(try scope.declarationNode(forFunction: functionCall))
    }

    func testRegisterFunctionsWithDifferentNames() {
        let functionDeclarations = [
            FuncDecNode(
                "foo",
                parameters: [],
                returnType: nil,
                declarations: [],
                statements: []
            ),
            FuncDecNode(
                "bar",
                parameters: [],
                returnType: nil,
                declarations: [],
                statements: []
            )
        ]

        let scope = Scope()
        try! functionDeclarations.forEach {
            XCTAssertNoThrow(try scope.register(function: $0))
        }
    }

    func testRegisterFunctionsWithDuplicateIdentifiersThrowsError() {
        let functionDeclaration = FuncDecNode(
            "foo",
            parameters: [
                ("bar", .integer),
                ("bar", .integer)
            ],
            returnType: nil,
            declarations: [],
            statements: []
        )

        let scope = Scope()
        XCTAssertThrowsError(try scope.register(function: functionDeclaration))
    }

    // MARK: - Function calls

    func testFunctionCallWithoutParameters() {
        let functionDeclaration = FuncDecNode(
            "foo",
            parameters: [],
            returnType: nil,
            declarations: [],
            statements: []
        )
        let functionCall = FuncCallNode(
            IdentifierNode(
                "foo",
                references: CommonToken(0)
            ),
            parameters: []
        )

        let scope = Scope()
        XCTAssertNoThrow(try scope.register(function: functionDeclaration))
        XCTAssertNoThrow(try scope.declarationNode(forFunction: functionCall))
    }

    func testFunctionCallWithParameters() {
        let functionDeclaration = FuncDecNode(
            "foo",
            parameters: [
                ("bar", .integer)
            ],
            returnType: nil,
            declarations: [],
            statements: []
        )
        let functionCall = FuncCallNode(
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

        let scope = Scope()
        XCTAssertNoThrow(try scope.register(function: functionDeclaration))
        XCTAssertNoThrow(try scope.declarationNode(forFunction: functionCall))
    }

    // MARK: - Function overloading

    func testRegisterFunctionOverloadingSameName() {
        let functionDeclarations = [
            FuncDecNode(
                "foo",
                parameters: [
                    ("bar1", .integer)
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
                "foo",
                parameters: [
                    ("bar1", .string),
                    ("bar2", .integer),
                    ("bar3", .double)
                ],
                returnType: nil,
                declarations: [],
                statements: []
            )
        ]

        let scope = Scope()
        try! functionDeclarations.forEach {
            XCTAssertNoThrow(try scope.register(function: $0))
        }
    }

    func testRegisterFunctionOverloadingSameNameAndSameParametersCount() {
        let functionDeclarations = [
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
            )
        ]

        let scope = Scope()
        try! functionDeclarations.forEach {
            XCTAssertNoThrow(try scope.register(function: $0))
        }
    }

    func testRegisterFunctionsSameNameAndNoParametersThrowsError() {
        let functions = [
            FuncDecNode(
                "foo",
                parameters: [],
                returnType: nil,
                declarations: [],
                statements: []
            ),
            FuncDecNode(
                "foo",
                parameters: [],
                returnType: nil,
                declarations: [],
                statements: []
            )
        ]

        let scope = Scope()
        XCTAssertNoThrow(try scope.register(function: functions[0]))
        XCTAssertThrowsError(try scope.register(function: functions[1]))
    }

    func testRegisterFunctionsSameNameAndSameParametersThrowsError() {
        let functions = [
            FuncDecNode(
                "foo",
                parameters: [
                    ("bar1", .integer)
                ],
                returnType: nil,
                declarations: [],
                statements: []
            ),
            FuncDecNode(
                "foo",
                parameters: [
                    ("bar2", .integer)
                ],
                returnType: nil,
                declarations: [],
                statements: []
            )
        ]

        let scope = Scope()
        XCTAssertNoThrow(try scope.register(function: functions[0]))
        XCTAssertThrowsError(try scope.register(function: functions[1]))
    }

    func testRegisterFunctionsSameNameAndDoubleIntegerParametersThrowsError() {
        let functions = [
            FuncDecNode(
                "foo",
                parameters: [
                    ("bar1", .integer)
                ],
                returnType: nil,
                declarations: [],
                statements: []
            ),
            FuncDecNode(
                "foo",
                parameters: [
                    ("bar2", .double)
                ],
                returnType: nil,
                declarations: [],
                statements: []
            )
        ]

        let scope = Scope()
        XCTAssertNoThrow(try scope.register(function: functions[0]))
        XCTAssertThrowsError(try scope.register(function: functions[1]))
    }

    func testRegisterFunctionsSameNameSameParametersDifferentReturnTypesThrowsError() {
        let functions = [
            FuncDecNode(
                "foo",
                parameters: [
                    ("bar1", .integer)
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
                "foo",
                parameters: [
                    ("bar2", .integer)
                ],
                returnType: nil,
                declarations: [],
                statements: []
            )
        ]

        let scope = Scope()
        XCTAssertNoThrow(try scope.register(function: functions[0]))
        XCTAssertThrowsError(try scope.register(function: functions[1]))
    }
    
}
