//
//  ArrayTests.swift
//  StubsASTTests
//
//  Created by Patrick Remy on 18.02.18.
//

import XCTest
import Antlr4
import StubsLexer
import StubsParser
@testable import StubsAST

class ArrayTests: XCTestCase {

    func testArrayAssignment() {
        let code =
            """
            object ArrayAssignmentTest {
                def main(args: Array[String]) = {
                    var helloWorld: Array[String] = Array("Bye", "World");
                    helloWorld(0) = "Hello";
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
            "ArrayAssignmentTest",
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
                                "helloWorld",
                                references: CommonToken(0)
                            ),
                            datatype: .array(of: .string),
                            assign: ArrayNode(
                                [
                                    PrimitiveNode(
                                        "Bye",
                                        ofType: .string,
                                        references: CommonToken(0)
                                    ),
                                    PrimitiveNode(
                                        "World",
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
                                "helloWorld",
                                references: CommonToken(0)
                            ),
                            index: PrimitiveNode(
                                "0",
                                ofType: .integer,
                                references: CommonToken(0)
                            ),
                            assign: PrimitiveNode(
                                "Hello",
                                ofType: .string,
                                references: CommonToken(0)
                            )
                        )
                    ]
                )
            ]
        )

        XCTAssertEqual(generatedAST, expectedAST)
    }

}
