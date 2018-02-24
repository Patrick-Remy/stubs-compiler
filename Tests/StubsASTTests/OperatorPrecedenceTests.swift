//
//  OperatorPrecedenceTests.swift
//  StubsASTTests
//
//  Created by Patrick Remy on 17.02.18.
//

import XCTest
import Antlr4
import StubsLexer
import StubsParser
@testable import StubsAST

class OperatorPrecedenceTests: XCTestCase {

    func testLeftAssociative() {
        let code =
            """
            object LeftAssociativeTest {
                def main(args: Array[String]) = {
                    println(1 - 2 - 3);
                }
            }
            """
        let inputStream = ANTLRInputStream(code)
        let lexer = StubsLexer(inputStream)
        let tokenStream = CommonTokenStream(lexer)

        let parser: StubsParser! = try? StubsParser(tokenStream)
        XCTAssertNotNil(parser)
        parser!.setErrorHandler(BailErrorStrategy())
        let parseTree: StubsParser.ProgramContext! = try? parser.program()
        XCTAssertNotNil(parseTree)

        let generatedAST: Node! = ASTGenerator.generate(from: parseTree)
        XCTAssertNotNil(generatedAST)

        let expectedAST = ObjectDecNode(
            "LeftAssociativeTest",
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
                                AdditiveNode(
                                    AdditiveNode(
                                        PrimitiveNode(
                                            "1",
                                            ofType: .integer,
                                            references: CommonToken(0)
                                        ),
                                        minus: PrimitiveNode(
                                            "2",
                                            ofType: .integer,
                                            references: CommonToken(0)
                                        ),
                                        references: CommonToken(0)
                                    ),
                                    minus: PrimitiveNode(
                                        "3",
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

        XCTAssertEqual(generatedAST, expectedAST)
    }

    func testIntExpression() {
        let code =
            """
            object IntExpression {
                def main(args: Array[String]) = {
                    println(1 * -((9 - 2 / 5) + 4) - 15);
                }
            }
            """
        let inputStream = ANTLRInputStream(code)
        let lexer = StubsLexer(inputStream)
        let tokenStream = CommonTokenStream(lexer)

        let parser: StubsParser! = try? StubsParser(tokenStream)
        XCTAssertNotNil(parser)
        parser!.setErrorHandler(BailErrorStrategy())
        let parseTree: StubsParser.ProgramContext! = try? parser.program()
        XCTAssertNotNil(parseTree)

        let generatedAST: Node! = ASTGenerator.generate(from: parseTree)
        XCTAssertNotNil(generatedAST)

        let expectedAST = ObjectDecNode(
            "IntExpression",
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
                                AdditiveNode(
                                    MultNode(
                                        PrimitiveNode(
                                            "1",
                                            ofType: .integer,
                                            references: CommonToken(0)
                                        ),
                                        mult: UnaryNode(
                                            minus: AdditiveNode(
                                                AdditiveNode(
                                                    PrimitiveNode(
                                                        "9",
                                                        ofType: .integer,
                                                        references: CommonToken(0)
                                                    ),
                                                    minus: MultNode(
                                                        PrimitiveNode(
                                                            "2",
                                                            ofType: .integer,
                                                            references: CommonToken(0)
                                                        ),
                                                        divide: PrimitiveNode(
                                                            "5",
                                                            ofType: .integer,
                                                            references: CommonToken(0)
                                                        ),
                                                        references: CommonToken(0)
                                                    ),
                                                    references: CommonToken(0)
                                                ),
                                                plus: PrimitiveNode(
                                                    "4",
                                                    ofType: .integer,
                                                    references: CommonToken(0)
                                                ),
                                                references: CommonToken(0)
                                            ),
                                            references: CommonToken(0)
                                        ),
                                        references: CommonToken(0)
                                    ),
                                    minus: PrimitiveNode(
                                        "15",
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

        XCTAssertEqual(generatedAST, expectedAST)
    }

}
