//
//  ObjectTests.swift
//  StubsTypeCheckerTests
//
//  Created by Patrick Remy on 07.01.18.
//

import XCTest
import Antlr4
@testable import StubsAST
import StubsTypeChecker

class ObjectTests: XCTestCase {

    /*
    func testNoMainThrowsError() {
        let ast = ObjectDecNode(
            "NoMainFunctionTest",
            variables: [],
            functions: [
                FuncDecNode(
                    "foo",
                    parameters: [
                        ("args", .array(of: .string))
                    ],
                    returnType: nil,
                    declarations: [],
                    statements: []
                )
            ]
        )

        XCTAssertThrowsError(try TypeChecker.validate(ast))
    }

    func testMainInvalidParametersThrowsError() {
        let ast = ObjectDecNode(
            "NoMainFunctionTest",
            variables: [],
            functions: [
                FuncDecNode(
                    "main",
                    parameters: [
                        ("args", .integer)
                    ],
                    returnType: nil,
                    declarations: [],
                    statements: []
                )
            ]
        )

        XCTAssertThrowsError(try TypeChecker.validate(ast))
    }*/

    func testMainFunction() {
        let ast = ObjectDecNode(
            "MainFunctionTest",
            variables: [],
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

        XCTAssertNoThrow(try TypeChecker.validate(ast))
    }
}


