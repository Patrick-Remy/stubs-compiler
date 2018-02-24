//
//  AddTests.swift
//  StubsTypeCheckerTests
//
//  Created by Patrick Remy on 09.01.18.
//

import XCTest
import Antlr4
@testable import StubsAST
import StubsTypeChecker

class AddTests: XCTestCase {
    
    func testIntegerPlusInteger() {
        let ast = ObjectDecNode(
            "IntegerPlusIntegerTest",
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
                        AdditiveNode(
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
                    ]
                )
            ]
        )

        XCTAssertNoThrow(try TypeChecker.validate(ast))
    }

    func testIntegerAndDouble() {
        let integerPlusDoubleAST = ObjectDecNode(
            "IntegerPlusDoubleTest",
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
                        AdditiveNode(
                            PrimitiveNode(
                                "1",
                                ofType: .integer,
                                references: CommonToken(0)
                            ),
                            plus: PrimitiveNode(
                                "2.0",
                                ofType: .double,
                                references: CommonToken(0)
                            ),
                            references: CommonToken(0)
                        )
                    ]
                )
            ]
        )

        let doublePlusIntegerAST = ObjectDecNode(
            "DoublePlusIntegerTest",
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
                        AdditiveNode(
                            PrimitiveNode(
                                "1.0",
                                ofType: .double,
                                references: CommonToken(0)
                            ),
                            plus: PrimitiveNode(
                                "2",
                                ofType: .integer,
                                references: CommonToken(0)
                            ),
                            references: CommonToken(0)
                        )
                    ]
                )
            ]
        )

        XCTAssertNoThrow(try TypeChecker.validate(integerPlusDoubleAST))
        XCTAssertNoThrow(try TypeChecker.validate(doublePlusIntegerAST))
    }
    
}
