//
//  IfTests.swift
//  StubsCodeGeneratorTests
//
//  Created by Patrick Remy on 27.01.18.
//

import XCTest
import Antlr4
@testable import StubsAST
import StubsTypeChecker


class IfTests: XCTestCase {

    override func setUp() {
        continueAfterFailure = false
    }

    func testNoBlock() {
        let ast = ObjectDecNode(
            "IfBooleanExpressionElseTest",
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
                        IfNode(
                            PrimitiveNode(
                                "true",
                                ofType: .boolean,
                                references: CommonToken(0)
                            ),
                            then: FuncCallNode(
                                IdentifierNode(
                                    "println",
                                    references: CommonToken(0)
                                ),
                                parameters: [
                                    PrimitiveNode(
                                        "true",
                                        ofType: .string,
                                        references: CommonToken(0)
                                    )
                                ]
                            ),
                            else: FuncCallNode(
                                IdentifierNode(
                                    "println",
                                    references: CommonToken(0)
                                ),
                                parameters: [
                                    PrimitiveNode(
                                        "false",
                                        ofType: .string,
                                        references: CommonToken(0)
                                    )
                                ]
                            )
                        ),
                        IfNode(
                            PrimitiveNode(
                                "false",
                                ofType: .boolean,
                                references: CommonToken(0)
                            ),
                            then: FuncCallNode(
                                IdentifierNode(
                                    "println",
                                    references: CommonToken(0)
                                ),
                                parameters: [
                                    PrimitiveNode(
                                        "true",
                                        ofType: .string,
                                        references: CommonToken(0)
                                    )
                                ]
                            ),
                            else: FuncCallNode(
                                IdentifierNode(
                                    "println",
                                    references: CommonToken(0)
                                ),
                                parameters: [
                                    PrimitiveNode(
                                        "false",
                                        ofType: .string,
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
        XCTAssertNoThrow(try TestSuite.generateClassFile(ast))
        let url = try! TestSuite.generateClassFile(ast)
        XCTAssertNoThrow(try TestSuite.runProgram(url, className: "IfBooleanExpressionElseTest"))
        let output = try! TestSuite.runProgram(url, className: "IfBooleanExpressionElseTest")
        XCTAssertEqual(output, "true\nfalse\n")
    }
    
    func testBooleanExpression() {
        let ast = ObjectDecNode(
            "IfBooleanExpressionTest",
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
                                            "println",
                                            references: CommonToken(0)
                                        ),
                                        parameters: [
                                            PrimitiveNode(
                                                "true",
                                                ofType: .string,
                                                references: CommonToken(0)
                                            )
                                        ]
                                    )
                                ]
                            ),
                            else: BlockNode(
                                [
                                    FuncCallNode(
                                        IdentifierNode(
                                            "println",
                                            references: CommonToken(0)
                                        ),
                                        parameters: [
                                            PrimitiveNode(
                                                "false",
                                                ofType: .string,
                                                references: CommonToken(0)
                                            )
                                        ]
                                    )
                                ]
                            )
                        ),
                        IfNode(
                            PrimitiveNode(
                                "false",
                                ofType: .boolean,
                                references: CommonToken(0)
                            ),
                            then: BlockNode(
                                [
                                    FuncCallNode(
                                        IdentifierNode(
                                            "println",
                                            references: CommonToken(0)
                                        ),
                                        parameters: [
                                            PrimitiveNode(
                                                "true",
                                                ofType: .string,
                                                references: CommonToken(0)
                                            )
                                        ]
                                    )
                                ]
                            ),
                            else: FuncCallNode(
                                IdentifierNode(
                                    "println",
                                    references: CommonToken(0)
                                ),
                                parameters: [
                                    PrimitiveNode(
                                        "false",
                                        ofType: .string,
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
        XCTAssertNoThrow(try TestSuite.generateClassFile(ast))
        let url = try! TestSuite.generateClassFile(ast)
        XCTAssertNoThrow(try TestSuite.runProgram(url, className: "IfBooleanExpressionTest"))
        let output = try! TestSuite.runProgram(url, className: "IfBooleanExpressionTest")
        XCTAssertEqual(output, "true\nfalse\n")
    }

    func testBooleanExpressionMultipleAnd() {
        let ast = ObjectDecNode(
            "IfBooleanExpressionMultipleAndTest",
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
                        IfNode(
                            AndNode(
                                PrimitiveNode(
                                    "true",
                                    ofType: .boolean,
                                    references: CommonToken(0)
                                ),
                                and: AndNode(
                                    PrimitiveNode(
                                        "true",
                                        ofType: .boolean,
                                        references: CommonToken(0)
                                    ),
                                    and: AndNode(
                                        PrimitiveNode(
                                            "true",
                                            ofType: .boolean,
                                            references: CommonToken(0)
                                        ),
                                        and: AndNode(
                                            PrimitiveNode(
                                                "true",
                                                ofType: .boolean,
                                                references: CommonToken(0)
                                            ),
                                            and: PrimitiveNode(
                                                "true",
                                                ofType: .boolean,
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
                            then: BlockNode(
                                [
                                    FuncCallNode(
                                        IdentifierNode(
                                            "println",
                                            references: CommonToken(0)
                                        ),
                                        parameters: [
                                            PrimitiveNode(
                                                "true",
                                                ofType: .string,
                                                references: CommonToken(0)
                                            )
                                        ]
                                    )
                                ]
                            )
                        ),
                        IfNode(
                            AndNode(
                                PrimitiveNode(
                                    "true",
                                    ofType: .boolean,
                                    references: CommonToken(0)
                                ),
                                and: AndNode(
                                    PrimitiveNode(
                                        "true",
                                        ofType: .boolean,
                                        references: CommonToken(0)
                                    ),
                                    and: AndNode(
                                        PrimitiveNode(
                                            "true",
                                            ofType: .boolean,
                                            references: CommonToken(0)
                                        ),
                                        and: AndNode(
                                            PrimitiveNode(
                                                "true",
                                                ofType: .boolean,
                                                references: CommonToken(0)
                                            ),
                                            and: PrimitiveNode(
                                                "false",
                                                ofType: .boolean,
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
                            then: BlockNode([]),
                            else: BlockNode(
                                [
                                    FuncCallNode(
                                        IdentifierNode(
                                            "println",
                                            references: CommonToken(0)
                                        ),
                                        parameters: [
                                            PrimitiveNode(
                                                "false",
                                                ofType: .string,
                                                references: CommonToken(0)
                                            )
                                        ]
                                    )
                                ]
                            )
                        )
                    ]
                )
            ]
        )

        XCTAssertNoThrow(try TypeChecker.validate(ast))
        XCTAssertNoThrow(try TestSuite.generateClassFile(ast))
        let url = try! TestSuite.generateClassFile(ast)
        XCTAssertNoThrow(try TestSuite.runProgram(url, className: "IfBooleanExpressionMultipleAndTest"))
        let output = try! TestSuite.runProgram(url, className: "IfBooleanExpressionMultipleAndTest")
        XCTAssertEqual(output, "true\nfalse\n")
    }

    func testBooleanExpressionMultipleOr() {
        let ast = ObjectDecNode(
            "IfBooleanExpressionMultipleOrTest",
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
                        IfNode(
                            OrNode(
                                PrimitiveNode(
                                    "false",
                                    ofType: .boolean,
                                    references: CommonToken(0)
                                ),
                                or: OrNode(
                                    PrimitiveNode(
                                        "false",
                                        ofType: .boolean,
                                        references: CommonToken(0)
                                    ),
                                    or: OrNode(
                                        PrimitiveNode(
                                            "false",
                                            ofType: .boolean,
                                            references: CommonToken(0)
                                        ),
                                        or: OrNode(
                                            PrimitiveNode(
                                                "false",
                                                ofType: .boolean,
                                                references: CommonToken(0)
                                            ),
                                            or: PrimitiveNode(
                                                "true",
                                                ofType: .boolean,
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
                            then: BlockNode(
                                [
                                    FuncCallNode(
                                        IdentifierNode(
                                            "println",
                                            references: CommonToken(0)
                                        ),
                                        parameters: [
                                            PrimitiveNode(
                                                "true",
                                                ofType: .string,
                                                references: CommonToken(0)
                                            )
                                        ]
                                    )
                                ]
                            )
                        ),
                        IfNode(
                            OrNode(
                                PrimitiveNode(
                                    "false",
                                    ofType: .boolean,
                                    references: CommonToken(0)
                                ),
                                or: OrNode(
                                    PrimitiveNode(
                                        "false",
                                        ofType: .boolean,
                                        references: CommonToken(0)
                                    ),
                                    or: OrNode(
                                        PrimitiveNode(
                                            "false",
                                            ofType: .boolean,
                                            references: CommonToken(0)
                                        ),
                                        or: OrNode(
                                            PrimitiveNode(
                                                "false",
                                                ofType: .boolean,
                                                references: CommonToken(0)
                                            ),
                                            or: PrimitiveNode(
                                                "false",
                                                ofType: .boolean,
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
                            then: BlockNode([]),
                            else: BlockNode(
                                [
                                    FuncCallNode(
                                        IdentifierNode(
                                            "println",
                                            references: CommonToken(0)
                                        ),
                                        parameters: [
                                            PrimitiveNode(
                                                "false",
                                                ofType: .string,
                                                references: CommonToken(0)
                                            )
                                        ]
                                    )
                                ]
                            )
                        )
                    ]
                )
            ]
        )

        XCTAssertNoThrow(try TypeChecker.validate(ast))
        XCTAssertNoThrow(try TestSuite.generateClassFile(ast))
        let url = try! TestSuite.generateClassFile(ast)
        XCTAssertNoThrow(try TestSuite.runProgram(url, className: "IfBooleanExpressionMultipleOrTest"))
        let output = try! TestSuite.runProgram(url, className: "IfBooleanExpressionMultipleOrTest")
        XCTAssertEqual(output, "true\nfalse\n")
    }
    
}
