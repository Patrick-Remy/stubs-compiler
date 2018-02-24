//
//  ArrayTests.swift
//  StubsCodeGeneratorTests
//
//  Created by Patrick Remy on 28.01.18.
//

import XCTest
import Antlr4
@testable import StubsAST
import StubsTypeChecker


class ArrayTests: XCTestCase {

    override func setUp() {
        continueAfterFailure = false
    }

    // MARK: - Declaration

    // MARK: Global
    func testGlobalIntegerArray() {
        let ast = ObjectDecNode(
            "ArrayGlobalIntegerTest",
            variables: [
                VarDecNode(
                    IdentifierNode(
                        "foo",
                        references: CommonToken(0)
                    ),
                    datatype: .array(of: .integer),
                    assign: ArrayNode(
                        [
                            PrimitiveNode(
                                "1",
                                ofType: .integer,
                                references: CommonToken(0)
                            ),
                            PrimitiveNode(
                                "2",
                                ofType: .integer,
                                references: CommonToken(0)
                            ),
                            PrimitiveNode(
                                "3",
                                ofType: .integer,
                                references: CommonToken(0)
                            )
                        ]
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
                    declarations: [
                    ],
                    statements: [
                        FuncCallNode(
                            IdentifierNode(
                                "println",
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
                                            "0",
                                            ofType: .integer,
                                            references: CommonToken(0)
                                        )
                                    ]
                                )
                            ]
                        ),
                        FuncCallNode(
                            IdentifierNode(
                                "println",
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
                        ),
                        FuncCallNode(
                            IdentifierNode(
                                "println",
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
            ]
        )

        XCTAssertNoThrow(try TypeChecker.validate(ast))
        XCTAssertNoThrow(try TestSuite.generateClassFile(ast))
        let url = try! TestSuite.generateClassFile(ast)
        XCTAssertNoThrow(try TestSuite.runProgram(url, className: "ArrayGlobalIntegerTest"))
        let output = try! TestSuite.runProgram(url, className: "ArrayGlobalIntegerTest")
        XCTAssertEqual(output, "1\n2\n3\n")
    }


    // MARK: Local

    func testLocalIntegerArray() {
        let ast = ObjectDecNode(
            "ArrayLocalIntegerTest",
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
                                        "1",
                                        ofType: .integer,
                                        references: CommonToken(0)
                                    ),
                                    PrimitiveNode(
                                        "2",
                                        ofType: .integer,
                                        references: CommonToken(0)
                                    ),
                                    PrimitiveNode(
                                        "3",
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
                                FuncCallNode(
                                    IdentifierNode(
                                        "foo",
                                        references: CommonToken(0)
                                    ),
                                    parameters: [
                                        PrimitiveNode(
                                            "0",
                                            ofType: .integer,
                                            references: CommonToken(0)
                                        )
                                    ]
                                )
                            ]
                        ),
                        FuncCallNode(
                            IdentifierNode(
                                "println",
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
                        ),
                        FuncCallNode(
                            IdentifierNode(
                                "println",
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
            ]
        )

        XCTAssertNoThrow(try TypeChecker.validate(ast))
        XCTAssertNoThrow(try TestSuite.generateClassFile(ast))
        let url = try! TestSuite.generateClassFile(ast)
        XCTAssertNoThrow(try TestSuite.runProgram(url, className: "ArrayLocalIntegerTest"))
        let output = try! TestSuite.runProgram(url, className: "ArrayLocalIntegerTest")
        XCTAssertEqual(output, "1\n2\n3\n")
    }

    // MARK: Parameter

    func testPrintIntegerParameter() {
        let ast = ObjectDecNode(
            "ArrayPrintIntegerParameterTest",
            variables: [],
            functions: [
                FuncDecNode(
                    "foo",
                    parameters: [
                        ("bar", .array(of: .integer))
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
                                FuncCallNode(
                                    IdentifierNode(
                                        "bar",
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
                                ArrayNode(
                                    [
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
            ]
        )

        XCTAssertNoThrow(try TypeChecker.validate(ast))
        XCTAssertNoThrow(try TestSuite.generateClassFile(ast))
        let url = try! TestSuite.generateClassFile(ast)
        XCTAssertNoThrow(try TestSuite.runProgram(url, className: "ArrayPrintIntegerParameterTest"))
        let output = try! TestSuite.runProgram(url, className: "ArrayPrintIntegerParameterTest")
        XCTAssertEqual(output, "2\n")
    }

    func testPrintStringParameter() {
        let ast = ObjectDecNode(
            "ArrayPrintStringParameterTest",
            variables: [],
            functions: [
                FuncDecNode(
                    "sayHello",
                    parameters: [
                        ("message", .array(of: .string))
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
                                FuncCallNode(
                                    IdentifierNode(
                                        "message",
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
                                "sayHello",
                                references: CommonToken(0)
                            ),
                            parameters: [
                                ArrayNode(
                                    [
                                        PrimitiveNode(
                                            "Hello",
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
                            ]
                        )
                    ]
                )
            ]
        )

        XCTAssertNoThrow(try TypeChecker.validate(ast))
        XCTAssertNoThrow(try TestSuite.generateClassFile(ast))
        let url = try! TestSuite.generateClassFile(ast)
        XCTAssertNoThrow(try TestSuite.runProgram(url, className: "ArrayPrintStringParameterTest"))
        let output = try! TestSuite.runProgram(url, className: "ArrayPrintStringParameterTest")
        XCTAssertEqual(output, "World\n")
    }

    // MARK: Double conversion

    func testDoubleConversion() {
        let ast = ObjectDecNode(
            "ArrayDoubleConversionTest",
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
                            datatype: .array(of: .double),
                            assign: ArrayNode(
                                [
                                    PrimitiveNode(
                                        "1",
                                        ofType: .integer,
                                        references: CommonToken(0)
                                    ),
                                    PrimitiveNode(
                                        "42.0",
                                        ofType: .double,
                                        references: CommonToken(0)
                                    ),
                                    PrimitiveNode(
                                        "3",
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
        XCTAssertNoThrow(try TestSuite.generateClassFile(ast))
        let url = try! TestSuite.generateClassFile(ast)
        XCTAssertNoThrow(try TestSuite.runProgram(url, className: "ArrayDoubleConversionTest"))
        let output: String! = try! TestSuite.runProgram(url, className: "ArrayDoubleConversionTest")
        XCTAssertNotNil(output)
        let outputNumber: Double! = Double(output.trimmingCharacters(in: .whitespacesAndNewlines))
        XCTAssertNotNil(outputNumber)
        XCTAssertEqual((outputNumber * 10).rounded() / 10, 42.0)
    }


    // MARK: - Assignment

    // MARK: Global
    func testAssignToGlobalIntegerArray() {
        let ast = ObjectDecNode(
            "ArrayAssignToGlobalIntegerArrayTest",
            variables: [
                VarDecNode(
                    IdentifierNode(
                        "foo",
                        references: CommonToken(0)
                    ),
                    datatype: .array(of: .integer),
                    assign: ArrayNode(
                        [
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
                                "foo",
                                references: CommonToken(0)
                            ),
                            index: PrimitiveNode(
                                "1",
                                ofType: .integer,
                                references: CommonToken(0)
                            ),
                            assign: PrimitiveNode(
                                "3",
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
                                FuncCallNode(
                                    IdentifierNode(
                                        "foo",
                                        references: CommonToken(0)
                                    ),
                                    parameters: [
                                        PrimitiveNode(
                                            "0",
                                            ofType: .integer,
                                            references: CommonToken(0)
                                        )
                                    ]
                                )
                            ]
                        ),
                        FuncCallNode(
                            IdentifierNode(
                                "println",
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
        XCTAssertNoThrow(try TestSuite.generateClassFile(ast))
        let url = try! TestSuite.generateClassFile(ast)
        XCTAssertNoThrow(try TestSuite.runProgram(url, className: "ArrayAssignToGlobalIntegerArrayTest"))
        let output = try! TestSuite.runProgram(url, className: "ArrayAssignToGlobalIntegerArrayTest")
        XCTAssertEqual(output, "1\n3\n")
    }

    func testAssignToGlobalDoubleArray() {
        let ast = ObjectDecNode(
            "ArrayAssignToGlobalDoubleArrayTest",
            variables: [
                VarDecNode(
                    IdentifierNode(
                        "foo",
                        references: CommonToken(0)
                    ),
                    datatype: .array(of: .double),
                    assign: ArrayNode(
                        [
                            PrimitiveNode(
                                "1.0",
                                ofType: .double,
                                references: CommonToken(0)
                            ),
                            PrimitiveNode(
                                "2.0",
                                ofType: .double,
                                references: CommonToken(0)
                            )
                        ]
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
                                "foo",
                                references: CommonToken(0)
                            ),
                            index: PrimitiveNode(
                                "1",
                                ofType: .integer,
                                references: CommonToken(0)
                            ),
                            assign: PrimitiveNode(
                                "3.0",
                                ofType: .double,
                                references: CommonToken(0)
                            )
                        ),
                        FuncCallNode(
                            IdentifierNode(
                                "println",
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
                                            "0",
                                            ofType: .integer,
                                            references: CommonToken(0)
                                        )
                                    ]
                                )
                            ]
                        ),
                        FuncCallNode(
                            IdentifierNode(
                                "println",
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
        XCTAssertNoThrow(try TestSuite.generateClassFile(ast))
        let url = try! TestSuite.generateClassFile(ast)
        XCTAssertNoThrow(try TestSuite.runProgram(url, className: "ArrayAssignToGlobalDoubleArrayTest"))
        let output = try! TestSuite.runProgram(url, className: "ArrayAssignToGlobalDoubleArrayTest")
        XCTAssertEqual(output, "1.0\n3.0\n")
    }

    func testAssignIntegerToGlobalDoubleArray() {
        let ast = ObjectDecNode(
            "ArrayAssignIntegerToGlobalDoubleArrayTest",
            variables: [
                VarDecNode(
                    IdentifierNode(
                        "foo",
                        references: CommonToken(0)
                    ),
                    datatype: .array(of: .double),
                    assign: ArrayNode(
                        [
                            PrimitiveNode(
                                "1.0",
                                ofType: .double,
                                references: CommonToken(0)
                            ),
                            PrimitiveNode(
                                "2.0",
                                ofType: .double,
                                references: CommonToken(0)
                            )
                        ]
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
                                "foo",
                                references: CommonToken(0)
                            ),
                            index: PrimitiveNode(
                                "1",
                                ofType: .integer,
                                references: CommonToken(0)
                            ),
                            assign: PrimitiveNode(
                                "3",
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
                                FuncCallNode(
                                    IdentifierNode(
                                        "foo",
                                        references: CommonToken(0)
                                    ),
                                    parameters: [
                                        PrimitiveNode(
                                            "0",
                                            ofType: .integer,
                                            references: CommonToken(0)
                                        )
                                    ]
                                )
                            ]
                        ),
                        FuncCallNode(
                            IdentifierNode(
                                "println",
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
        XCTAssertNoThrow(try TestSuite.generateClassFile(ast))
        let url = try! TestSuite.generateClassFile(ast)
        XCTAssertNoThrow(try TestSuite.runProgram(url, className: "ArrayAssignIntegerToGlobalDoubleArrayTest"))
        let output = try! TestSuite.runProgram(url, className: "ArrayAssignIntegerToGlobalDoubleArrayTest")
        XCTAssertEqual(output, "1.0\n3.0\n")
    }


    func testAssignToGlobalStringArray() {
        let ast = ObjectDecNode(
            "ArrayAssignToGlobalStringArrayTest",
            variables: [
                VarDecNode(
                    IdentifierNode(
                        "foo",
                        references: CommonToken(0)
                    ),
                    datatype: .array(of: .string),
                    assign: ArrayNode(
                        [
                            PrimitiveNode(
                                "foo",
                                ofType: .string,
                                references: CommonToken(0)
                            ),
                            PrimitiveNode(
                                "bar",
                                ofType: .string,
                                references: CommonToken(0)
                            )
                        ]
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
                                "foo",
                                references: CommonToken(0)
                            ),
                            index: PrimitiveNode(
                                "1",
                                ofType: .integer,
                                references: CommonToken(0)
                            ),
                            assign: PrimitiveNode(
                                "foo",
                                ofType: .string,
                                references: CommonToken(0)
                            )
                        ),
                        FuncCallNode(
                            IdentifierNode(
                                "println",
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
                                            "0",
                                            ofType: .integer,
                                            references: CommonToken(0)
                                        )
                                    ]
                                )
                            ]
                        ),
                        FuncCallNode(
                            IdentifierNode(
                                "println",
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
        XCTAssertNoThrow(try TestSuite.generateClassFile(ast))
        let url = try! TestSuite.generateClassFile(ast)
        XCTAssertNoThrow(try TestSuite.runProgram(url, className: "ArrayAssignToGlobalStringArrayTest"))
        let output = try! TestSuite.runProgram(url, className: "ArrayAssignToGlobalStringArrayTest")
        XCTAssertEqual(output, "foo\nfoo\n")
    }

    func testAssignToGlobalBooleanArray() {
        let ast = ObjectDecNode(
            "ArrayAssignToGlobalBooleanArrayTest",
            variables: [
                VarDecNode(
                    IdentifierNode(
                        "foo",
                        references: CommonToken(0)
                    ),
                    datatype: .array(of: .boolean),
                    assign: ArrayNode(
                        [
                            PrimitiveNode(
                                "true",
                                ofType: .boolean,
                                references: CommonToken(0)
                            ),
                            PrimitiveNode(
                                "false",
                                ofType: .boolean,
                                references: CommonToken(0)
                            )
                        ]
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
                                "foo",
                                references: CommonToken(0)
                            ),
                            index: PrimitiveNode(
                                "1",
                                ofType: .integer,
                                references: CommonToken(0)
                            ),
                            assign: PrimitiveNode(
                                "true",
                                ofType: .boolean,
                                references: CommonToken(0)
                            )
                        ),
                        FuncCallNode(
                            IdentifierNode(
                                "println",
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
                                            "0",
                                            ofType: .integer,
                                            references: CommonToken(0)
                                        )
                                    ]
                                )
                            ]
                        ),
                        FuncCallNode(
                            IdentifierNode(
                                "println",
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
        XCTAssertNoThrow(try TestSuite.generateClassFile(ast))
        let url = try! TestSuite.generateClassFile(ast)
        XCTAssertNoThrow(try TestSuite.runProgram(url, className: "ArrayAssignToGlobalBooleanArrayTest"))
        let output = try! TestSuite.runProgram(url, className: "ArrayAssignToGlobalBooleanArrayTest")
        XCTAssertEqual(output, "true\ntrue\n")
    }

    // MARK: Local
    func testAssignToLocalIntegerArray() {
        let ast = ObjectDecNode(
            "ArrayAssignToLocalIntegerArrayTest",
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
                        )
                    ],
                    statements: [
                        VarAssignNode(
                            IdentifierNode(
                                "foo",
                                references: CommonToken(0)
                            ),
                            index: PrimitiveNode(
                                "1",
                                ofType: .integer,
                                references: CommonToken(0)
                            ),
                            assign: PrimitiveNode(
                                "3",
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
                                FuncCallNode(
                                    IdentifierNode(
                                        "foo",
                                        references: CommonToken(0)
                                    ),
                                    parameters: [
                                        PrimitiveNode(
                                            "0",
                                            ofType: .integer,
                                            references: CommonToken(0)
                                        )
                                    ]
                                )
                            ]
                        ),
                        FuncCallNode(
                            IdentifierNode(
                                "println",
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
        XCTAssertNoThrow(try TestSuite.generateClassFile(ast))
        let url = try! TestSuite.generateClassFile(ast)
        XCTAssertNoThrow(try TestSuite.runProgram(url, className: "ArrayAssignToLocalIntegerArrayTest"))
        let output = try! TestSuite.runProgram(url, className: "ArrayAssignToLocalIntegerArrayTest")
        XCTAssertEqual(output, "1\n3\n")
    }

    func testAssignToLocalDoubleArray() {
        let ast = ObjectDecNode(
            "ArrayAssignToLocalDoubleArrayTest",
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
                            datatype: .array(of: .double),
                            assign: ArrayNode(
                                [
                                    PrimitiveNode(
                                        "1.0",
                                        ofType: .double,
                                        references: CommonToken(0)
                                    ),
                                    PrimitiveNode(
                                        "2.0",
                                        ofType: .double,
                                        references: CommonToken(0)
                                    )
                                ]
                            )
                        )
                    ],
                    statements: [
                        VarAssignNode(
                            IdentifierNode(
                                "foo",
                                references: CommonToken(0)
                            ),
                            index: PrimitiveNode(
                                "1",
                                ofType: .integer,
                                references: CommonToken(0)
                            ),
                            assign: PrimitiveNode(
                                "3.0",
                                ofType: .double,
                                references: CommonToken(0)
                            )
                        ),
                        FuncCallNode(
                            IdentifierNode(
                                "println",
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
                                            "0",
                                            ofType: .integer,
                                            references: CommonToken(0)
                                        )
                                    ]
                                )
                            ]
                        ),
                        FuncCallNode(
                            IdentifierNode(
                                "println",
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
        XCTAssertNoThrow(try TestSuite.generateClassFile(ast))
        let url = try! TestSuite.generateClassFile(ast)
        XCTAssertNoThrow(try TestSuite.runProgram(url, className: "ArrayAssignToLocalDoubleArrayTest"))
        let output = try! TestSuite.runProgram(url, className: "ArrayAssignToLocalDoubleArrayTest")
        XCTAssertEqual(output, "1.0\n3.0\n")
    }

    func testAssignIntegerToLocalDoubleArray() {
        let ast = ObjectDecNode(
            "ArrayAssignIntegerToLocalDoubleArrayTest",
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
                            datatype: .array(of: .double),
                            assign: ArrayNode(
                                [
                                    PrimitiveNode(
                                        "1.0",
                                        ofType: .double,
                                        references: CommonToken(0)
                                    ),
                                    PrimitiveNode(
                                        "2.0",
                                        ofType: .double,
                                        references: CommonToken(0)
                                    )
                                ]
                            )
                        )
                    ],
                    statements: [
                        VarAssignNode(
                            IdentifierNode(
                                "foo",
                                references: CommonToken(0)
                            ),
                            index: PrimitiveNode(
                                "1",
                                ofType: .integer,
                                references: CommonToken(0)
                            ),
                            assign: PrimitiveNode(
                                "3",
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
                                FuncCallNode(
                                    IdentifierNode(
                                        "foo",
                                        references: CommonToken(0)
                                    ),
                                    parameters: [
                                        PrimitiveNode(
                                            "0",
                                            ofType: .integer,
                                            references: CommonToken(0)
                                        )
                                    ]
                                )
                            ]
                        ),
                        FuncCallNode(
                            IdentifierNode(
                                "println",
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
        XCTAssertNoThrow(try TestSuite.generateClassFile(ast))
        let url = try! TestSuite.generateClassFile(ast)
        XCTAssertNoThrow(try TestSuite.runProgram(url, className: "ArrayAssignIntegerToLocalDoubleArrayTest"))
        let output = try! TestSuite.runProgram(url, className: "ArrayAssignIntegerToLocalDoubleArrayTest")
        XCTAssertEqual(output, "1.0\n3.0\n")
    }

    func testAssignToLocalStringArray() {
        let ast = ObjectDecNode(
            "ArrayAssignToLocalStringArrayTest",
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
                            datatype: .array(of: .string),
                            assign: ArrayNode(
                                [
                                    PrimitiveNode(
                                        "foo",
                                        ofType: .string,
                                        references: CommonToken(0)
                                    ),
                                    PrimitiveNode(
                                        "bar",
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
                                "foo",
                                references: CommonToken(0)
                            ),
                            index: PrimitiveNode(
                                "1",
                                ofType: .integer,
                                references: CommonToken(0)
                            ),
                            assign: PrimitiveNode(
                                "foo",
                                ofType: .string,
                                references: CommonToken(0)
                            )
                        ),
                        FuncCallNode(
                            IdentifierNode(
                                "println",
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
                                            "0",
                                            ofType: .integer,
                                            references: CommonToken(0)
                                        )
                                    ]
                                )
                            ]
                        ),
                        FuncCallNode(
                            IdentifierNode(
                                "println",
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
        XCTAssertNoThrow(try TestSuite.generateClassFile(ast))
        let url = try! TestSuite.generateClassFile(ast)
        XCTAssertNoThrow(try TestSuite.runProgram(url, className: "ArrayAssignToLocalStringArrayTest"))
        let output = try! TestSuite.runProgram(url, className: "ArrayAssignToLocalStringArrayTest")
        XCTAssertEqual(output, "foo\nfoo\n")
    }

    func testAssignToLocalBooleanArray() {
        let ast = ObjectDecNode(
            "ArrayAssignToLocalBooleanArrayTest",
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
                            datatype: .array(of: .boolean),
                            assign: ArrayNode(
                                [
                                    PrimitiveNode(
                                        "true",
                                        ofType: .boolean,
                                        references: CommonToken(0)
                                    ),
                                    PrimitiveNode(
                                        "false",
                                        ofType: .boolean,
                                        references: CommonToken(0)
                                    )
                                ]
                            )
                        )
                    ],
                    statements: [
                        VarAssignNode(
                            IdentifierNode(
                                "foo",
                                references: CommonToken(0)
                            ),
                            index: PrimitiveNode(
                                "1",
                                ofType: .integer,
                                references: CommonToken(0)
                            ),
                            assign: PrimitiveNode(
                                "true",
                                ofType: .boolean,
                                references: CommonToken(0)
                            )
                        ),
                        FuncCallNode(
                            IdentifierNode(
                                "println",
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
                                            "0",
                                            ofType: .integer,
                                            references: CommonToken(0)
                                        )
                                    ]
                                )
                            ]
                        ),
                        FuncCallNode(
                            IdentifierNode(
                                "println",
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
        XCTAssertNoThrow(try TestSuite.generateClassFile(ast))
        let url = try! TestSuite.generateClassFile(ast)
        XCTAssertNoThrow(try TestSuite.runProgram(url, className: "ArrayAssignToLocalBooleanArrayTest"))
        let output = try! TestSuite.runProgram(url, className: "ArrayAssignToLocalBooleanArrayTest")
        XCTAssertEqual(output, "true\ntrue\n")
    }

    // MARK: - New array assignment

    // MARK: Global

    func testAssignNewArrayToGlobalBooleanArray() {
        let ast = ObjectDecNode(
            "ArrayAssignNewArrayToGlobalBooleanArrayTest",
            variables: [
                VarDecNode(
                    IdentifierNode(
                        "foo",
                        references: CommonToken(0)
                    ),
                    datatype: .array(of: .boolean),
                    assign: ArrayNode(
                        [
                            PrimitiveNode(
                                "true",
                                ofType: .boolean,
                                references: CommonToken(0)
                            ),
                            PrimitiveNode(
                                "false",
                                ofType: .boolean,
                                references: CommonToken(0)
                            )
                        ]
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
                                "foo",
                                references: CommonToken(0)
                            ),
                            assign: ArrayNode(
                                [
                                    PrimitiveNode(
                                        "false",
                                        ofType: .boolean,
                                        references: CommonToken(0)
                                    ),
                                    PrimitiveNode(
                                        "true",
                                        ofType: .boolean,
                                        references: CommonToken(0)
                                    )
                                ]
                            )
                        ),
                        FuncCallNode(
                            IdentifierNode(
                                "println",
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
                                            "0",
                                            ofType: .integer,
                                            references: CommonToken(0)
                                        )
                                    ]
                                )
                            ]
                        ),
                        FuncCallNode(
                            IdentifierNode(
                                "println",
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
        XCTAssertNoThrow(try TestSuite.generateClassFile(ast))
        let url = try! TestSuite.generateClassFile(ast)
        XCTAssertNoThrow(try TestSuite.runProgram(url, className: "ArrayAssignNewArrayToGlobalBooleanArrayTest"))
        let output = try! TestSuite.runProgram(url, className: "ArrayAssignNewArrayToGlobalBooleanArrayTest")
        XCTAssertEqual(output, "false\ntrue\n")
    }

    func testAssignNewArrayToGlobalIntegerArray() {
        let ast = ObjectDecNode(
            "ArrayAssignNewArrayToGlobalIntegerArrayTest",
            variables: [
                VarDecNode(
                    IdentifierNode(
                        "foo",
                        references: CommonToken(0)
                    ),
                    datatype: .array(of: .integer),
                    assign: ArrayNode(
                        [
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
                                "foo",
                                references: CommonToken(0)
                            ),
                            assign: ArrayNode(
                                [
                                    PrimitiveNode(
                                        "4",
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
                        ),
                        FuncCallNode(
                            IdentifierNode(
                                "println",
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
                                            "0",
                                            ofType: .integer,
                                            references: CommonToken(0)
                                        )
                                    ]
                                )
                            ]
                        ),
                        FuncCallNode(
                            IdentifierNode(
                                "println",
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
        XCTAssertNoThrow(try TestSuite.generateClassFile(ast))
        let url = try! TestSuite.generateClassFile(ast)
        XCTAssertNoThrow(try TestSuite.runProgram(url, className: "ArrayAssignNewArrayToGlobalIntegerArrayTest"))
        let output = try! TestSuite.runProgram(url, className: "ArrayAssignNewArrayToGlobalIntegerArrayTest")
        XCTAssertEqual(output, "4\n2\n")
    }

    func testAssignNewArrayToGlobalDoubleArray() {
        let ast = ObjectDecNode(
            "ArrayAssignNewArrayToGlobalDoubleArrayTest",
            variables: [
                VarDecNode(
                    IdentifierNode(
                        "foo",
                        references: CommonToken(0)
                    ),
                    datatype: .array(of: .double),
                    assign: ArrayNode(
                        [
                            PrimitiveNode(
                                "1.0",
                                ofType: .double,
                                references: CommonToken(0)
                            ),
                            PrimitiveNode(
                                "2.0",
                                ofType: .double,
                                references: CommonToken(0)
                            )
                        ]
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
                                "foo",
                                references: CommonToken(0)
                            ),
                            assign: ArrayNode(
                                [
                                    PrimitiveNode(
                                        "4.0",
                                        ofType: .double,
                                        references: CommonToken(0)
                                    ),
                                    PrimitiveNode(
                                        "2.0",
                                        ofType: .double,
                                        references: CommonToken(0)
                                    )
                                ]
                            )
                        ),
                        FuncCallNode(
                            IdentifierNode(
                                "println",
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
                                            "0",
                                            ofType: .integer,
                                            references: CommonToken(0)
                                        )
                                    ]
                                )
                            ]
                        ),
                        FuncCallNode(
                            IdentifierNode(
                                "println",
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
        XCTAssertNoThrow(try TestSuite.generateClassFile(ast))
        let url = try! TestSuite.generateClassFile(ast)
        XCTAssertNoThrow(try TestSuite.runProgram(url, className: "ArrayAssignNewArrayToGlobalDoubleArrayTest"))
        let output = try! TestSuite.runProgram(url, className: "ArrayAssignNewArrayToGlobalDoubleArrayTest")
        XCTAssertEqual(output, "4.0\n2.0\n")
    }

    func testAssignNewArrayToGlobalStringArray() {
        let ast = ObjectDecNode(
            "ArrayAssignNewArrayToGlobalStringArrayTest",
            variables: [
                VarDecNode(
                    IdentifierNode(
                        "foo",
                        references: CommonToken(0)
                    ),
                    datatype: .array(of: .string),
                    assign: ArrayNode(
                        [
                            PrimitiveNode(
                                "foo",
                                ofType: .string,
                                references: CommonToken(0)
                            ),
                            PrimitiveNode(
                                "bar",
                                ofType: .string,
                                references: CommonToken(0)
                            )
                        ]
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
                                "foo",
                                references: CommonToken(0)
                            ),
                            assign: ArrayNode(
                                [
                                    PrimitiveNode(
                                        "Hello",
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
                        ),
                        FuncCallNode(
                            IdentifierNode(
                                "println",
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
                                            "0",
                                            ofType: .integer,
                                            references: CommonToken(0)
                                        )
                                    ]
                                )
                            ]
                        ),
                        FuncCallNode(
                            IdentifierNode(
                                "println",
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
        XCTAssertNoThrow(try TestSuite.generateClassFile(ast))
        let url = try! TestSuite.generateClassFile(ast)
        XCTAssertNoThrow(try TestSuite.runProgram(url, className: "ArrayAssignNewArrayToGlobalStringArrayTest"))
        let output = try! TestSuite.runProgram(url, className: "ArrayAssignNewArrayToGlobalStringArrayTest")
        XCTAssertEqual(output, "Hello\nWorld\n")
    }

    // MARK: Local

    func testAssignNewArrayToLocalBooleanArray() {
        let ast = ObjectDecNode(
            "ArrayAssignNewArrayToLocalBooleanArrayTest",
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
                            datatype: .array(of: .boolean),
                            assign: ArrayNode(
                                [
                                    PrimitiveNode(
                                        "true",
                                        ofType: .boolean,
                                        references: CommonToken(0)
                                    ),
                                    PrimitiveNode(
                                        "false",
                                        ofType: .boolean,
                                        references: CommonToken(0)
                                    )
                                ]
                            )
                        )
                    ],
                    statements: [
                        VarAssignNode(
                            IdentifierNode(
                                "foo",
                                references: CommonToken(0)
                            ),
                            assign: ArrayNode(
                                [
                                    PrimitiveNode(
                                        "false",
                                        ofType: .boolean,
                                        references: CommonToken(0)
                                    ),
                                    PrimitiveNode(
                                        "true",
                                        ofType: .boolean,
                                        references: CommonToken(0)
                                    )
                                ]
                            )
                        ),
                        FuncCallNode(
                            IdentifierNode(
                                "println",
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
                                            "0",
                                            ofType: .integer,
                                            references: CommonToken(0)
                                        )
                                    ]
                                )
                            ]
                        ),
                        FuncCallNode(
                            IdentifierNode(
                                "println",
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
        XCTAssertNoThrow(try TestSuite.generateClassFile(ast))
        let url = try! TestSuite.generateClassFile(ast)
        XCTAssertNoThrow(try TestSuite.runProgram(url, className: "ArrayAssignNewArrayToLocalBooleanArrayTest"))
        let output = try! TestSuite.runProgram(url, className: "ArrayAssignNewArrayToLocalBooleanArrayTest")
        XCTAssertEqual(output, "false\ntrue\n")
    }

    func testAssignNewArrayToLocalIntegerArray() {
        let ast = ObjectDecNode(
            "ArrayAssignNewArrayToLocalIntegerArrayTest",
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
                        )
                    ],
                    statements: [
                        VarAssignNode(
                            IdentifierNode(
                                "foo",
                                references: CommonToken(0)
                            ),
                            assign: ArrayNode(
                                [
                                    PrimitiveNode(
                                        "4",
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
                        ),
                        FuncCallNode(
                            IdentifierNode(
                                "println",
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
                                            "0",
                                            ofType: .integer,
                                            references: CommonToken(0)
                                        )
                                    ]
                                )
                            ]
                        ),
                        FuncCallNode(
                            IdentifierNode(
                                "println",
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
        XCTAssertNoThrow(try TestSuite.generateClassFile(ast))
        let url = try! TestSuite.generateClassFile(ast)
        XCTAssertNoThrow(try TestSuite.runProgram(url, className: "ArrayAssignNewArrayToLocalIntegerArrayTest"))
        let output = try! TestSuite.runProgram(url, className: "ArrayAssignNewArrayToLocalIntegerArrayTest")
        XCTAssertEqual(output, "4\n2\n")
    }

    func testAssignNewArrayToLocalDoubleArray() {
        let ast = ObjectDecNode(
            "ArrayAssignNewArrayToLocalDoubleArrayTest",
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
                            datatype: .array(of: .double),
                            assign: ArrayNode(
                                [
                                    PrimitiveNode(
                                        "1.0",
                                        ofType: .double,
                                        references: CommonToken(0)
                                    ),
                                    PrimitiveNode(
                                        "2.0",
                                        ofType: .double,
                                        references: CommonToken(0)
                                    )
                                ]
                            )
                        )
                    ],
                    statements: [
                        VarAssignNode(
                            IdentifierNode(
                                "foo",
                                references: CommonToken(0)
                            ),
                            assign: ArrayNode(
                                [
                                    PrimitiveNode(
                                        "4.0",
                                        ofType: .double,
                                        references: CommonToken(0)
                                    ),
                                    PrimitiveNode(
                                        "2.0",
                                        ofType: .double,
                                        references: CommonToken(0)
                                    )
                                ]
                            )
                        ),
                        FuncCallNode(
                            IdentifierNode(
                                "println",
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
                                            "0",
                                            ofType: .integer,
                                            references: CommonToken(0)
                                        )
                                    ]
                                )
                            ]
                        ),
                        FuncCallNode(
                            IdentifierNode(
                                "println",
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
        XCTAssertNoThrow(try TestSuite.generateClassFile(ast))
        let url = try! TestSuite.generateClassFile(ast)
        XCTAssertNoThrow(try TestSuite.runProgram(url, className: "ArrayAssignNewArrayToLocalDoubleArrayTest"))
        let output = try! TestSuite.runProgram(url, className: "ArrayAssignNewArrayToLocalDoubleArrayTest")
        XCTAssertEqual(output, "4.0\n2.0\n")
    }

    func testAssignNewArrayToLocalStringArray() {
        let ast = ObjectDecNode(
            "ArrayAssignNewArrayToLocalStringArrayTest",
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
                            datatype: .array(of: .string),
                            assign: ArrayNode(
                                [
                                    PrimitiveNode(
                                        "foo",
                                        ofType: .string,
                                        references: CommonToken(0)
                                    ),
                                    PrimitiveNode(
                                        "bar",
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
                                "foo",
                                references: CommonToken(0)
                            ),
                            assign: ArrayNode(
                                [
                                    PrimitiveNode(
                                        "Hello",
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
                        ),
                        FuncCallNode(
                            IdentifierNode(
                                "println",
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
                                            "0",
                                            ofType: .integer,
                                            references: CommonToken(0)
                                        )
                                    ]
                                )
                            ]
                        ),
                        FuncCallNode(
                            IdentifierNode(
                                "println",
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
        XCTAssertNoThrow(try TestSuite.generateClassFile(ast))
        let url = try! TestSuite.generateClassFile(ast)
        XCTAssertNoThrow(try TestSuite.runProgram(url, className: "ArrayAssignNewArrayToLocalStringArrayTest"))
        let output = try! TestSuite.runProgram(url, className: "ArrayAssignNewArrayToLocalStringArrayTest")
        XCTAssertEqual(output, "Hello\nWorld\n")
    }

}
