//
//  MultTests.swift
//  StubsCodeGeneratorTests
//
//  Created by Patrick Remy on 28.01.17.
//

import XCTest
import Antlr4
@testable import StubsAST
import StubsTypeChecker


class MultTests: XCTestCase {

    override func setUp() {
        continueAfterFailure = false
    }

    // MARK: - Mult

    func testIntegerMultInteger() {
        let ast = ObjectDecNode(
            "MultIntegerMultIntegerTest",
            variables: [],
            functions: [
                FuncDecNode(
                    "main",
                    parameters: [
                        ("args", .array(of: .string))
                    ],
                    returnType: nil,
                    declarations: [

                    ],
                    statements: [
                        FuncCallNode(
                            IdentifierNode(
                                "println",
                                references: CommonToken(0)
                            ),
                            parameters: [
                                MultNode(
                                    PrimitiveNode(
                                        "-2",
                                        ofType: .integer,
                                        references: CommonToken(0)
                                    ),
                                    mult: PrimitiveNode(
                                        "-3",
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


        XCTAssertNoThrow(try TypeChecker.validate(ast))
        XCTAssertNoThrow(try TestSuite.generateClassFile(ast))
        let url = try! TestSuite.generateClassFile(ast)
        XCTAssertNoThrow(try TestSuite.runProgram(url, className: "MultIntegerMultIntegerTest"))
        let output = try! TestSuite.runProgram(url, className: "MultIntegerMultIntegerTest")
        XCTAssertEqual(output, "6\n")
    }

    func testIntegerArrayValueMultInteger() {
        let ast = ObjectDecNode(
            "MultIntegerArrayValueMultIntegerTest",
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
                                "foo",
                                references: CommonToken(0)
                            ),
                            datatype: .array(of: .integer),
                            assign: ArrayNode(
                                [
                                    PrimitiveNode(
                                        "-1",
                                        ofType: .integer,
                                        references: CommonToken(0)
                                    ),
                                    PrimitiveNode(
                                        "-2",
                                        ofType: .integer,
                                        references: CommonToken(0)
                                    ),
                                    PrimitiveNode(
                                        "-3",
                                        ofType: .integer,
                                        references: CommonToken(0)
                                    )
                                ]
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
                                MultNode(
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
                                    mult: PrimitiveNode(
                                        "-3",
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


        XCTAssertNoThrow(try TypeChecker.validate(ast))
        XCTAssertNoThrow(try TestSuite.generateClassFile(ast))
        let url = try! TestSuite.generateClassFile(ast)
        XCTAssertNoThrow(try TestSuite.runProgram(url, className: "MultIntegerArrayValueMultIntegerTest"))
        let output = try! TestSuite.runProgram(url, className: "MultIntegerArrayValueMultIntegerTest")
        XCTAssertEqual(output, "6\n")
    }

    func testIntegerMultDouble() {
        let ast = ObjectDecNode(
            "MultIntegerMultDoubleTest",
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
                                MultNode(
                                    PrimitiveNode(
                                        "2",
                                        ofType: .integer,
                                        references: CommonToken(0)
                                    ),
                                    mult: PrimitiveNode(
                                        "3.2",
                                        ofType: .double,
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
        XCTAssertNoThrow(try TestSuite.runProgram(url, className: "MultIntegerMultDoubleTest"))
        let output: String! = try! TestSuite.runProgram(url, className: "MultIntegerMultDoubleTest")
        XCTAssertNotNil(output)
        let outputNumber: Double! = Double(output.trimmingCharacters(in: .whitespacesAndNewlines))
        XCTAssertNotNil(outputNumber)
        XCTAssertEqual((outputNumber * 10).rounded() / 10, 6.4)
    }

    func testDoubleMultInteger() {
        let ast = ObjectDecNode(
            "MultDoubleMultIntegerTest",
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
                                MultNode(
                                    PrimitiveNode(
                                        "1.2",
                                        ofType: .double,
                                        references: CommonToken(0)
                                    ),
                                    mult: PrimitiveNode(
                                        "-3",
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

        XCTAssertNoThrow(try TypeChecker.validate(ast))
        XCTAssertNoThrow(try TestSuite.generateClassFile(ast))
        let url = try! TestSuite.generateClassFile(ast)
        XCTAssertNoThrow(try TestSuite.runProgram(url, className: "MultDoubleMultIntegerTest"))
        let output: String! = try! TestSuite.runProgram(url, className: "MultDoubleMultIntegerTest")
        XCTAssertNotNil(output)
        let outputNumber: Double! = Double(output.trimmingCharacters(in: .whitespacesAndNewlines))
        XCTAssertNotNil(outputNumber)
        XCTAssertEqual((outputNumber * 10).rounded() / 10, -3.6)
    }

    func testDoubleMultDouble() {
        let ast = ObjectDecNode(
            "MultDoubleMultDoubleTest",
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
                                MultNode(
                                    PrimitiveNode(
                                        "1.1",
                                        ofType: .double,
                                        references: CommonToken(0)
                                    ),
                                    mult: PrimitiveNode(
                                        "3.1",
                                        ofType: .double,
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
        XCTAssertNoThrow(try TestSuite.runProgram(url, className: "MultDoubleMultDoubleTest"))
        let output: String! = try! TestSuite.runProgram(url, className: "MultDoubleMultDoubleTest")
        XCTAssertNotNil(output)
        let outputNumber: Double! = Double(output.trimmingCharacters(in: .whitespacesAndNewlines))
        XCTAssertNotNil(outputNumber)
        XCTAssertEqual((outputNumber * 10).rounded() / 10, 3.4)
    }

    // MARK: - Divide

    func testIntegerDivideInteger() {
        let ast = ObjectDecNode(
            "MultIntegerDivideIntegerTest",
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
                                MultNode(
                                    PrimitiveNode(
                                        "-6",
                                        ofType: .integer,
                                        references: CommonToken(0)
                                    ),
                                    divide: PrimitiveNode(
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


        XCTAssertNoThrow(try TypeChecker.validate(ast))
        XCTAssertNoThrow(try TestSuite.generateClassFile(ast))
        let url = try! TestSuite.generateClassFile(ast)
        XCTAssertNoThrow(try TestSuite.runProgram(url, className: "MultIntegerDivideIntegerTest"))
        let output = try! TestSuite.runProgram(url, className: "MultIntegerDivideIntegerTest")
        XCTAssertEqual(output, "-2\n")
    }

    func testIntegerDivideDouble() {
        let ast = ObjectDecNode(
            "MultIntegerDivideDoubleTest",
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
                                MultNode(
                                    PrimitiveNode(
                                        "4",
                                        ofType: .integer,
                                        references: CommonToken(0)
                                    ),
                                    divide: PrimitiveNode(
                                        "-3.6",
                                        ofType: .double,
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
        XCTAssertNoThrow(try TestSuite.runProgram(url, className: "MultIntegerDivideDoubleTest"))
        let output: String! = try! TestSuite.runProgram(url, className: "MultIntegerDivideDoubleTest")
        XCTAssertNotNil(output)
        let outputNumber: Double! = Double(output.trimmingCharacters(in: .whitespacesAndNewlines))
        XCTAssertNotNil(outputNumber)
        XCTAssertEqual((outputNumber * 10).rounded() / 10, -1.1)
    }

    func testDoubleDivideInteger() {
        let ast = ObjectDecNode(
            "MultDoubleDivideIntegerTest",
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
                                MultNode(
                                    PrimitiveNode(
                                        "-1.8",
                                        ofType: .double,
                                        references: CommonToken(0)
                                    ),
                                    divide: PrimitiveNode(
                                        "-4",
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

        XCTAssertNoThrow(try TypeChecker.validate(ast))
        XCTAssertNoThrow(try TestSuite.generateClassFile(ast))
        let url = try! TestSuite.generateClassFile(ast)
        XCTAssertNoThrow(try TestSuite.runProgram(url, className: "MultDoubleDivideIntegerTest"))
        let output: String! = try! TestSuite.runProgram(url, className: "MultDoubleDivideIntegerTest")
        XCTAssertNotNil(output)
        let outputNumber: Double! = Double(output.trimmingCharacters(in: .whitespacesAndNewlines))
        XCTAssertNotNil(outputNumber)
        XCTAssertEqual((outputNumber * 100).rounded() / 100, 0.45)
    }

    func testDoubleDivideDouble() {
        let ast = ObjectDecNode(
            "MultDoubleDivideDoubleTest",
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
                                MultNode(
                                    PrimitiveNode(
                                        "1.2",
                                        ofType: .double,
                                        references: CommonToken(0)
                                    ),
                                    divide: PrimitiveNode(
                                        "3.4",
                                        ofType: .double,
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
        XCTAssertNoThrow(try TestSuite.runProgram(url, className: "MultDoubleDivideDoubleTest"))
        let output: String! = try! TestSuite.runProgram(url, className: "MultDoubleDivideDoubleTest")
        XCTAssertNotNil(output)
        let outputNumber: Double! = Double(output.trimmingCharacters(in: .whitespacesAndNewlines))
        XCTAssertNotNil(outputNumber)
        XCTAssertEqual((outputNumber * 100).rounded() / 100, 0.35)
    }

    // MARK: - Modulo

    func testIntegerModuloInteger() {
        let ast = ObjectDecNode(
            "MultIntegerModuloIntegerTest",
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
                                MultNode(
                                    PrimitiveNode(
                                        "6",
                                        ofType: .integer,
                                        references: CommonToken(0)
                                    ),
                                    modulo: PrimitiveNode(
                                        "4",
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


        XCTAssertNoThrow(try TypeChecker.validate(ast))
        XCTAssertNoThrow(try TestSuite.generateClassFile(ast))
        let url = try! TestSuite.generateClassFile(ast)
        XCTAssertNoThrow(try TestSuite.runProgram(url, className: "MultIntegerModuloIntegerTest"))
        let output = try! TestSuite.runProgram(url, className: "MultIntegerModuloIntegerTest")
        XCTAssertEqual(output, "2\n")
    }

    func testIntegerModuloDouble() {
        let ast = ObjectDecNode(
            "MultIntegerModuloDoubleTest",
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
                                MultNode(
                                    PrimitiveNode(
                                        "4",
                                        ofType: .integer,
                                        references: CommonToken(0)
                                    ),
                                    modulo: PrimitiveNode(
                                        "3.1",
                                        ofType: .double,
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
        XCTAssertNoThrow(try TestSuite.runProgram(url, className: "MultIntegerModuloDoubleTest"))
        let output: String! = try! TestSuite.runProgram(url, className: "MultIntegerModuloDoubleTest")
        XCTAssertNotNil(output)
        let outputNumber: Double! = Double(output.trimmingCharacters(in: .whitespacesAndNewlines))
        XCTAssertNotNil(outputNumber)
        XCTAssertEqual((outputNumber * 10).rounded() / 10, 0.9)
    }

    func testDoubleModuloInteger() {
        let ast = ObjectDecNode(
            "MultDoubleModuloIntegerTest",
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
                                MultNode(
                                    PrimitiveNode(
                                        "-10.2",
                                        ofType: .double,
                                        references: CommonToken(0)
                                    ),
                                    modulo: PrimitiveNode(
                                        "-5",
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

        XCTAssertNoThrow(try TypeChecker.validate(ast))
        XCTAssertNoThrow(try TestSuite.generateClassFile(ast))
        let url = try! TestSuite.generateClassFile(ast)
        XCTAssertNoThrow(try TestSuite.runProgram(url, className: "MultDoubleModuloIntegerTest"))
        let output: String! = try! TestSuite.runProgram(url, className: "MultDoubleModuloIntegerTest")
        XCTAssertNotNil(output)
        let outputNumber: Double! = Double(output.trimmingCharacters(in: .whitespacesAndNewlines))
        XCTAssertNotNil(outputNumber)
        XCTAssertEqual((outputNumber * 10).rounded() / 10, -0.2)
    }

    func testDoubleModuloDouble() {
        let ast = ObjectDecNode(
            "MultDoubleModuloDoubleTest",
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
                                MultNode(
                                    PrimitiveNode(
                                        "1.2",
                                        ofType: .double,
                                        references: CommonToken(0)
                                    ),
                                    modulo: PrimitiveNode(
                                        "3.4",
                                        ofType: .double,
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
        XCTAssertNoThrow(try TestSuite.runProgram(url, className: "MultDoubleModuloDoubleTest"))
        let output: String! = try! TestSuite.runProgram(url, className: "MultDoubleModuloDoubleTest")
        XCTAssertNotNil(output)
        let outputNumber: Double! = Double(output.trimmingCharacters(in: .whitespacesAndNewlines))
        XCTAssertNotNil(outputNumber)
        XCTAssertEqual((outputNumber * 10).rounded() / 10, 1.2)
    }

}
