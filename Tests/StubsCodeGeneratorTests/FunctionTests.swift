//
//  FunctionTests.swift
//  StubsCodeGeneratorTests
//
//  Created by Patrick Remy on 28.01.18.
//

import XCTest
import Antlr4
@testable import StubsAST
import StubsTypeChecker


class FunctionTests: XCTestCase {

    override func setUp() {
        continueAfterFailure = false
    }

    // MARK: - Call

    func testVoidFunctionWithoutParameters() {
        let ast = ObjectDecNode(
            "FunctionVoidFunctionWithoutParametersTest",
            variables: [],
            functions: [
                FuncDecNode(
                    "foo",
                    parameters: [],
                    returnType: nil,
                    declarations: [],
                    statements: [
                        FuncCallNode(
                            IdentifierNode(
                                "println",
                                references: CommonToken(0)
                            ),
                            parameters: [
                                PrimitiveNode(
                                    "bar",
                                    ofType: .string,
                                    references: CommonToken(0)
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
                            parameters: []
                        )
                    ]
                )
            ]
        )

        XCTAssertNoThrow(try TypeChecker.validate(ast))
        XCTAssertNoThrow(try TestSuite.generateClassFile(ast))
        let url = try! TestSuite.generateClassFile(ast)
        XCTAssertNoThrow(try TestSuite.runProgram(url, className: "FunctionVoidFunctionWithoutParametersTest"))
        let output = try! TestSuite.runProgram(url, className: "FunctionVoidFunctionWithoutParametersTest")
        XCTAssertEqual(output, "bar\n")
    }

    func testVoidFunctionWithIntegerParameter() {
        let ast = ObjectDecNode(
            "FunctionVoidFunctionWithIntegerParameterTest",
            variables: [],
            functions: [
                FuncDecNode(
                    "foo",
                    parameters: [
                        ("bar", .integer)
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
                                    "bar",
                                    references: CommonToken(0)
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
                                PrimitiveNode(
                                    "42",
                                    ofType: .integer,
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
        XCTAssertNoThrow(try TestSuite.runProgram(url, className: "FunctionVoidFunctionWithIntegerParameterTest"))
        let output = try! TestSuite.runProgram(url, className: "FunctionVoidFunctionWithIntegerParameterTest")
        XCTAssertEqual(output, "42\n")
    }

    func testVoidFunctionWithIntegerArrayParameter() {
        let ast = ObjectDecNode(
            "FunctionVoidFunctionWithIntegerArrayParameterTest",
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
                    declarations: [
                        VarDecNode(
                            IdentifierNode(
                                "a",
                                references: CommonToken(0)
                            ),
                            datatype: .array(of: .integer),
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
                        )
                    ],
                    statements: [
                        FuncCallNode(
                            IdentifierNode(
                                "foo",
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
        XCTAssertNoThrow(try TestSuite.runProgram(url, className: "FunctionVoidFunctionWithIntegerArrayParameterTest"))
        let output = try! TestSuite.runProgram(url, className: "FunctionVoidFunctionWithIntegerArrayParameterTest")
        XCTAssertEqual(output, "4\n2\n")
    }

    func testVoidFunctionWithNativeIntegerArrayParameter() {
        let ast = ObjectDecNode(
            "FunctionVoidFunctionWithNativeIntegerArrayParameterTest",
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
                            ]
                        )
                    ]
                )
            ]
        )

        XCTAssertNoThrow(try TypeChecker.validate(ast))
        XCTAssertNoThrow(try TestSuite.generateClassFile(ast))
        let url = try! TestSuite.generateClassFile(ast)
        XCTAssertNoThrow(try TestSuite.runProgram(url, className: "FunctionVoidFunctionWithNativeIntegerArrayParameterTest"))
        let output = try! TestSuite.runProgram(url, className: "FunctionVoidFunctionWithNativeIntegerArrayParameterTest")
        XCTAssertEqual(output, "4\n2\n")
    }

    func testVoidFunctionWithDoubleParameter() {
        let ast = ObjectDecNode(
            "FunctionVoidFunctionWithDoubleParameterTest",
            variables: [],
            functions: [
                FuncDecNode(
                    "foo",
                    parameters: [
                        ("bar", .double)
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
                                    "bar",
                                    references: CommonToken(0)
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
                                PrimitiveNode(
                                    "42.0",
                                    ofType: .double,
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
        XCTAssertNoThrow(try TestSuite.runProgram(url, className: "FunctionVoidFunctionWithDoubleParameterTest"))
        let output = try! TestSuite.runProgram(url, className: "FunctionVoidFunctionWithDoubleParameterTest")
        XCTAssertEqual(output, "42.0\n")
    }

    func testVoidFunctionWithDoubleArrayParameter() {
        let ast = ObjectDecNode(
            "FunctionVoidFunctionWithDoubleArrayParameterTest",
            variables: [],
            functions: [
                FuncDecNode(
                    "foo",
                    parameters: [
                        ("bar", .array(of: .double))
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
                    declarations: [
                        VarDecNode(
                            IdentifierNode(
                                "a",
                                references: CommonToken(0)
                            ),
                            datatype: .array(of: .double),
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
                        )
                    ],
                    statements: [
                        FuncCallNode(
                            IdentifierNode(
                                "foo",
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
        XCTAssertNoThrow(try TestSuite.runProgram(url, className: "FunctionVoidFunctionWithDoubleArrayParameterTest"))
        let output = try! TestSuite.runProgram(url, className: "FunctionVoidFunctionWithDoubleArrayParameterTest")
        XCTAssertEqual(output, "4.0\n2.0\n")
    }

    func testVoidFunctionWithNativeDoubleArrayParameter() {
        let ast = ObjectDecNode(
            "FunctionVoidFunctionWithNativeDoubleArrayParameterTest",
            variables: [],
            functions: [
                FuncDecNode(
                    "foo",
                    parameters: [
                        ("bar", .array(of: .double))
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
                            ]
                        )
                    ]
                )
            ]
        )

        XCTAssertNoThrow(try TypeChecker.validate(ast))
        XCTAssertNoThrow(try TestSuite.generateClassFile(ast))
        let url = try! TestSuite.generateClassFile(ast)
        XCTAssertNoThrow(try TestSuite.runProgram(url, className: "FunctionVoidFunctionWithNativeDoubleArrayParameterTest"))
        let output = try! TestSuite.runProgram(url, className: "FunctionVoidFunctionWithNativeDoubleArrayParameterTest")
        XCTAssertEqual(output, "4.0\n2.0\n")
    }

    func testVoidFunctionWithStringParameter() {
        let ast = ObjectDecNode(
            "FunctionVoidFunctionWithStringParameterTest",
            variables: [],
            functions: [
                FuncDecNode(
                    "foo",
                    parameters: [
                        ("bar", .string)
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
                                    "bar",
                                    references: CommonToken(0)
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
                                PrimitiveNode(
                                    "Hello World!",
                                    ofType: .string,
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
        XCTAssertNoThrow(try TestSuite.runProgram(url, className: "FunctionVoidFunctionWithStringParameterTest"))
        let output = try! TestSuite.runProgram(url, className: "FunctionVoidFunctionWithStringParameterTest")
        XCTAssertEqual(output, "Hello World!\n")
    }

    func testVoidFunctionWithStringArrayParameter() {
        let ast = ObjectDecNode(
            "FunctionVoidFunctionWithStringArrayParameterTest",
            variables: [],
            functions: [
                FuncDecNode(
                    "foo",
                    parameters: [
                        ("bar", .array(of: .string))
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
                    declarations: [
                        VarDecNode(
                            IdentifierNode(
                                "a",
                                references: CommonToken(0)
                            ),
                            datatype: .array(of: .string),
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
                        )
                    ],
                    statements: [
                        FuncCallNode(
                            IdentifierNode(
                                "foo",
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
        XCTAssertNoThrow(try TestSuite.runProgram(url, className: "FunctionVoidFunctionWithStringArrayParameterTest"))
        let output = try! TestSuite.runProgram(url, className: "FunctionVoidFunctionWithStringArrayParameterTest")
        XCTAssertEqual(output, "Hello\nWorld\n")
    }

    func testVoidFunctionWithNativeStringArrayParameter() {
        let ast = ObjectDecNode(
            "FunctionVoidFunctionWithNativeStringArrayParameterTest",
            variables: [],
            functions: [
                FuncDecNode(
                    "foo",
                    parameters: [
                        ("bar", .array(of: .string))
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
        XCTAssertNoThrow(try TestSuite.runProgram(url, className: "FunctionVoidFunctionWithNativeStringArrayParameterTest"))
        let output = try! TestSuite.runProgram(url, className: "FunctionVoidFunctionWithNativeStringArrayParameterTest")
        XCTAssertEqual(output, "Hello\nWorld\n")
    }

    func testVoidFunctionWithBooleanParameter() {
        let ast = ObjectDecNode(
            "FunctionVoidFunctionWithBooleanParameterTest",
            variables: [],
            functions: [
                FuncDecNode(
                    "foo",
                    parameters: [
                        ("bar", .boolean)
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
                                    "bar",
                                    references: CommonToken(0)
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
                                PrimitiveNode(
                                    "true",
                                    ofType: .boolean,
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
        XCTAssertNoThrow(try TestSuite.runProgram(url, className: "FunctionVoidFunctionWithBooleanParameterTest"))
        let output = try! TestSuite.runProgram(url, className: "FunctionVoidFunctionWithBooleanParameterTest")
        XCTAssertEqual(output, "true\n")
    }

    func testVoidFunctionWithBooleanArrayParameter() {
        let ast = ObjectDecNode(
            "FunctionVoidFunctionWithBooleanArrayParameterTest",
            variables: [],
            functions: [
                FuncDecNode(
                    "foo",
                    parameters: [
                        ("bar", .array(of: .boolean))
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
                    declarations: [
                        VarDecNode(
                            IdentifierNode(
                                "a",
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
                        FuncCallNode(
                            IdentifierNode(
                                "foo",
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
        XCTAssertNoThrow(try TestSuite.runProgram(url, className: "FunctionVoidFunctionWithBooleanArrayParameterTest"))
        let output = try! TestSuite.runProgram(url, className: "FunctionVoidFunctionWithBooleanArrayParameterTest")
        XCTAssertEqual(output, "true\nfalse\n")
    }

    func testVoidFunctionWithBooleanNativeArrayParameter() {
        let ast = ObjectDecNode(
            "FunctionVoidFunctionWithBooleanNativeArrayParameterTest",
            variables: [],
            functions: [
                FuncDecNode(
                    "foo",
                    parameters: [
                        ("bar", .array(of: .boolean))
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
                            ]
                        )
                    ]
                )
            ]
        )

        XCTAssertNoThrow(try TypeChecker.validate(ast))
        XCTAssertNoThrow(try TestSuite.generateClassFile(ast))
        let url = try! TestSuite.generateClassFile(ast)
        XCTAssertNoThrow(try TestSuite.runProgram(url, className: "FunctionVoidFunctionWithBooleanNativeArrayParameterTest"))
        let output = try! TestSuite.runProgram(url, className: "FunctionVoidFunctionWithBooleanNativeArrayParameterTest")
        XCTAssertEqual(output, "true\nfalse\n")
    }

    func testVoidFunctionWithMultipleParameters() {
        let ast = ObjectDecNode(
            "FunctionVoidFunctionWithMultipleParametersTest",
            variables: [],
            functions: [
                FuncDecNode(
                    "foo",
                    parameters: [
                        ("bar1", .integer),
                        ("bar2", .double),
                        ("bar3", .boolean),
                        ("bar4", .string)
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
                                    "bar1",
                                    references: CommonToken(0)
                                )
                            ]
                        ),
                        FuncCallNode(
                            IdentifierNode(
                                "println",
                                references: CommonToken(0)
                            ),
                            parameters: [
                                IdentifierNode(
                                    "bar2",
                                    references: CommonToken(0)
                                )
                            ]
                        ),
                        FuncCallNode(
                            IdentifierNode(
                                "println",
                                references: CommonToken(0)
                            ),
                            parameters: [
                                IdentifierNode(
                                    "bar3",
                                    references: CommonToken(0)
                                )
                            ]
                        ),
                        FuncCallNode(
                            IdentifierNode(
                                "println",
                                references: CommonToken(0)
                            ),
                            parameters: [
                                IdentifierNode(
                                    "bar4",
                                    references: CommonToken(0)
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
                                PrimitiveNode(
                                    "42",
                                    ofType: .integer,
                                    references: CommonToken(0)
                                ),
                                PrimitiveNode(
                                    "4.0",
                                    ofType: .double,
                                    references: CommonToken(0)
                                ),
                                PrimitiveNode(
                                    "true",
                                    ofType: .boolean,
                                    references: CommonToken(0)
                                ),
                                PrimitiveNode(
                                    "Hello World",
                                    ofType: .string,
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
        XCTAssertNoThrow(try TestSuite.runProgram(url, className: "FunctionVoidFunctionWithMultipleParametersTest"))
        let output = try! TestSuite.runProgram(url, className: "FunctionVoidFunctionWithMultipleParametersTest")
        XCTAssertEqual(output, "42\n4.0\ntrue\nHello World\n")
    }

    // MARK: - Return

    func testIntegerReturnFunction() {
        let ast = ObjectDecNode(
            "FunctionIntegerReturnFunctionTest",
            variables: [],
            functions: [
                FuncDecNode(
                    "foo",
                    parameters: [],
                    returnType: .integer,
                    declarations: [],
                    statements: [
                        ReturnNode(
                            PrimitiveNode(
                                "42",
                                ofType: .integer,
                                references: CommonToken(0)
                            )
                        )
                    ]
                ),
                FuncDecNode(
                    "main",
                    parameters: [
                        ("args", .array(of: .string))
                    ],
                    returnType: nil,
                    declarations: [
                        VarDecNode(
                            IdentifierNode(
                                "bar",
                                references: CommonToken(0)
                            ),
                            datatype: .integer,
                            assign: FuncCallNode(
                                IdentifierNode(
                                    "foo",
                                    references: CommonToken(0)
                                )
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
                                    "bar",
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
        XCTAssertNoThrow(try TestSuite.runProgram(url, className: "FunctionIntegerReturnFunctionTest"))
        let output = try! TestSuite.runProgram(url, className: "FunctionIntegerReturnFunctionTest")
        XCTAssertEqual(output, "42\n")
    }

    func testIntegerArrayReturnFunction() {
        let ast = ObjectDecNode(
            "FunctionIntegerArrayReturnFunctionTest",
            variables: [],
            functions: [
                FuncDecNode(
                    "foo",
                    parameters: [],
                    returnType: .array(of: .integer),
                    declarations: [],
                    statements: [
                        ReturnNode(
                            ArrayNode(
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
                        )
                    ]
                ),
                FuncDecNode(
                    "main",
                    parameters: [
                        ("args", .array(of: .string))
                    ],
                    returnType: nil,
                    declarations: [
                        VarDecNode(
                            IdentifierNode(
                                "bar",
                                references: CommonToken(0)
                            ),
                            datatype: .array(of: .integer),
                            assign: FuncCallNode(
                                IdentifierNode(
                                    "foo",
                                    references: CommonToken(0)
                                )
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
                                        "bar",
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
                )
            ]
        )

        XCTAssertNoThrow(try TypeChecker.validate(ast))
        XCTAssertNoThrow(try TestSuite.generateClassFile(ast))
        let url = try! TestSuite.generateClassFile(ast)
        XCTAssertNoThrow(try TestSuite.runProgram(url, className: "FunctionIntegerArrayReturnFunctionTest"))
        let output = try! TestSuite.runProgram(url, className: "FunctionIntegerArrayReturnFunctionTest")
        XCTAssertEqual(output, "4\n2\n")
    }

    func testDoubleReturnFunction() {
        let ast = ObjectDecNode(
            "FunctionDoubleReturnFunctionTest",
            variables: [],
            functions: [
                FuncDecNode(
                    "foo",
                    parameters: [],
                    returnType: .double,
                    declarations: [],
                    statements: [
                        ReturnNode(
                            PrimitiveNode(
                                "42.0",
                                ofType: .double,
                                references: CommonToken(0)
                            )
                        )
                    ]
                ),
                FuncDecNode(
                    "main",
                    parameters: [
                        ("args", .array(of: .string))
                    ],
                    returnType: nil,
                    declarations: [
                        VarDecNode(
                            IdentifierNode(
                                "bar",
                                references: CommonToken(0)
                            ),
                            datatype: .double,
                            assign: FuncCallNode(
                                IdentifierNode(
                                    "foo",
                                    references: CommonToken(0)
                                )
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
                                    "bar",
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
        XCTAssertNoThrow(try TestSuite.runProgram(url, className: "FunctionDoubleReturnFunctionTest"))
        let output = try! TestSuite.runProgram(url, className: "FunctionDoubleReturnFunctionTest")
        XCTAssertEqual(output, "42.0\n")
    }

    func testDoubleArrayReturnFunction() {
        let ast = ObjectDecNode(
            "FunctionDoubleArrayReturnFunctionTest",
            variables: [],
            functions: [
                FuncDecNode(
                    "foo",
                    parameters: [],
                    returnType: .array(of: .double),
                    declarations: [],
                    statements: [
                        ReturnNode(
                            ArrayNode(
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
                        )
                    ]
                ),
                FuncDecNode(
                    "main",
                    parameters: [
                        ("args", .array(of: .string))
                    ],
                    returnType: nil,
                    declarations: [
                        VarDecNode(
                            IdentifierNode(
                                "bar",
                                references: CommonToken(0)
                            ),
                            datatype: .array(of: .double),
                            assign: FuncCallNode(
                                IdentifierNode(
                                    "foo",
                                    references: CommonToken(0)
                                )
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
                                        "bar",
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
                )
            ]
        )

        XCTAssertNoThrow(try TypeChecker.validate(ast))
        XCTAssertNoThrow(try TestSuite.generateClassFile(ast))
        let url = try! TestSuite.generateClassFile(ast)
        XCTAssertNoThrow(try TestSuite.runProgram(url, className: "FunctionDoubleArrayReturnFunctionTest"))
        let output = try! TestSuite.runProgram(url, className: "FunctionDoubleArrayReturnFunctionTest")
        XCTAssertEqual(output, "4.0\n2.0\n")
    }

    func testStringReturnFunction() {
        let ast = ObjectDecNode(
            "FunctionStringReturnFunctionTest",
            variables: [],
            functions: [
                FuncDecNode(
                    "foo",
                    parameters: [],
                    returnType: .string,
                    declarations: [],
                    statements: [
                        ReturnNode(
                            PrimitiveNode(
                                "Hello World",
                                ofType: .string,
                                references: CommonToken(0)
                            )
                        )
                    ]
                ),
                FuncDecNode(
                    "main",
                    parameters: [
                        ("args", .array(of: .string))
                    ],
                    returnType: nil,
                    declarations: [
                        VarDecNode(
                            IdentifierNode(
                                "bar",
                                references: CommonToken(0)
                            ),
                            datatype: .string,
                            assign: FuncCallNode(
                                IdentifierNode(
                                    "foo",
                                    references: CommonToken(0)
                                )
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
                                    "bar",
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
        XCTAssertNoThrow(try TestSuite.runProgram(url, className: "FunctionStringReturnFunctionTest"))
        let output = try! TestSuite.runProgram(url, className: "FunctionStringReturnFunctionTest")
        XCTAssertEqual(output, "Hello World\n")
    }

    func testStringArrayReturnFunction() {
        let ast = ObjectDecNode(
            "FunctionStringArrayReturnFunctionTest",
            variables: [],
            functions: [
                FuncDecNode(
                    "foo",
                    parameters: [],
                    returnType: .array(of: .string),
                    declarations: [],
                    statements: [
                        ReturnNode(
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
                        )
                    ]
                ),
                FuncDecNode(
                    "main",
                    parameters: [
                        ("args", .array(of: .string))
                    ],
                    returnType: nil,
                    declarations: [
                        VarDecNode(
                            IdentifierNode(
                                "bar",
                                references: CommonToken(0)
                            ),
                            datatype: .array(of: .string),
                            assign: FuncCallNode(
                                IdentifierNode(
                                    "foo",
                                    references: CommonToken(0)
                                )
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
                                        "bar",
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
                )
            ]
        )

        XCTAssertNoThrow(try TypeChecker.validate(ast))
        XCTAssertNoThrow(try TestSuite.generateClassFile(ast))
        let url = try! TestSuite.generateClassFile(ast)
        XCTAssertNoThrow(try TestSuite.runProgram(url, className: "FunctionStringArrayReturnFunctionTest"))
        let output = try! TestSuite.runProgram(url, className: "FunctionStringArrayReturnFunctionTest")
        XCTAssertEqual(output, "Hello\nWorld\n")
    }

    func testBooleanReturnFunction() {
        let ast = ObjectDecNode(
            "FunctionBooleanReturnFunctionTest",
            variables: [],
            functions: [
                FuncDecNode(
                    "foo",
                    parameters: [],
                    returnType: .boolean,
                    declarations: [],
                    statements: [
                        ReturnNode(
                            PrimitiveNode(
                                "true",
                                ofType: .boolean,
                                references: CommonToken(0)
                            )
                        )
                    ]
                ),
                FuncDecNode(
                    "main",
                    parameters: [
                        ("args", .array(of: .string))
                    ],
                    returnType: nil,
                    declarations: [
                        VarDecNode(
                            IdentifierNode(
                                "bar",
                                references: CommonToken(0)
                            ),
                            datatype: .boolean,
                            assign: FuncCallNode(
                                IdentifierNode(
                                    "foo",
                                    references: CommonToken(0)
                                )
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
                                    "bar",
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
        XCTAssertNoThrow(try TestSuite.runProgram(url, className: "FunctionBooleanReturnFunctionTest"))
        let output = try! TestSuite.runProgram(url, className: "FunctionBooleanReturnFunctionTest")
        XCTAssertEqual(output, "true\n")
    }

    func testBooleanArrayReturnFunction() {
        let ast = ObjectDecNode(
            "FunctionBooleanArrayReturnFunctionTest",
            variables: [],
            functions: [
                FuncDecNode(
                    "foo",
                    parameters: [],
                    returnType: .array(of: .boolean),
                    declarations: [],
                    statements: [
                        ReturnNode(
                            ArrayNode(
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
                    ]
                ),
                FuncDecNode(
                    "main",
                    parameters: [
                        ("args", .array(of: .string))
                    ],
                    returnType: nil,
                    declarations: [
                        VarDecNode(
                            IdentifierNode(
                                "bar",
                                references: CommonToken(0)
                            ),
                            datatype: .array(of: .boolean),
                            assign: FuncCallNode(
                                IdentifierNode(
                                    "foo",
                                    references: CommonToken(0)
                                )
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
                                        "bar",
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
                )
            ]
        )

        XCTAssertNoThrow(try TypeChecker.validate(ast))
        XCTAssertNoThrow(try TestSuite.generateClassFile(ast))
        let url = try! TestSuite.generateClassFile(ast)
        XCTAssertNoThrow(try TestSuite.runProgram(url, className: "FunctionBooleanArrayReturnFunctionTest"))
        let output = try! TestSuite.runProgram(url, className: "FunctionBooleanArrayReturnFunctionTest")
        XCTAssertEqual(output, "true\nfalse\n")
    }

}
