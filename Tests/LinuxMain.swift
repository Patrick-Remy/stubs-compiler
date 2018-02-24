//
//  Compiler.swift
//  StubsCompiler
//
//  Created by Patrick Remy on 12.12.17.
//

import XCTest
import StubsParserTests
import StubsASTTests
import StubsTypeCheckerTests
import StubsCodeGeneratorTests
import StubsCompilerTests

var tests: [XCTestCaseEntry] = [
    StubsParserTests.allTests(),
    StubsASTTests.allTests(),
    StubsTypeCheckerTests.allTests(),
    StubsCodeGeneratorTests.allTests(),
    StubsCompilerTests.allTests()
]

XCTMain(tests)
