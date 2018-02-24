//
//  BooleanExpressionTests.swift
//  StubsCodeGeneratorTests
//
//  Created by Patrick Remy on 16.02.18.
//

import XCTest
import Antlr4
@testable import StubsAST
import StubsTypeChecker


class BooleanExpressionTests: XCTestCase {

    override func setUp() {
        continueAfterFailure = false
    }

    func testComplexExpression() {
        let ast = ObjectDecNode(
            "BooleanExpressionComplexExpressionTest",
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
                                OrNode(
                                    PrimitiveNode(
                                        "true",
                                        ofType: .boolean,
                                        references: CommonToken(0)
                                    ),
                                    or: OrNode(
                                        EqualNode(
                                            PrimitiveNode(
                                                "0",
                                                ofType: .integer,
                                                references: CommonToken(0)
                                            ),
                                            equals: AdditiveNode(
                                                PrimitiveNode(
                                                    "-1.2",
                                                    ofType: .double,
                                                    references: CommonToken(0)
                                                ),
                                                minus: AdditiveNode(
                                                    PrimitiveNode(
                                                        "-1.2",
                                                        ofType: .double,
                                                        references: CommonToken(0)
                                                    ),
                                                    plus: MultNode(
                                                        PrimitiveNode(
                                                            "2.2",
                                                            ofType: .double,
                                                            references: CommonToken(0)
                                                        ),
                                                        mult: PrimitiveNode(
                                                            "-3",
                                                            ofType: .integer,
                                                            references: CommonToken(0)
                                                        ),
                                                        references: CommonToken(0)
                                                    ),
                                                    references: CommonToken(0)
                                                ),
                                                references: CommonToken(0)
                                            ),
                                            references: CommonToken(0)
                                        ),
                                        or: RelationalNode(
                                            PrimitiveNode(
                                                "-2",
                                                ofType: .integer,
                                                references: CommonToken(0)
                                            ),
                                            greaterThan: PrimitiveNode(
                                                "1",
                                                ofType: .integer,
                                                references: CommonToken(0)
                                            ),
                                            references: CommonToken(0)
                                        ),
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
        XCTAssertNoThrow(try TestSuite.generateClassFile(ast))
        let url = try! TestSuite.generateClassFile(ast)
        XCTAssertNoThrow(try TestSuite.runProgram(url, className: "BooleanExpressionComplexExpressionTest"))
        let output = try! TestSuite.runProgram(url, className: "BooleanExpressionComplexExpressionTest")
        XCTAssertEqual(output, "true\n")
    }

}
