// swift-tools-version:4.0

import PackageDescription

let package = Package(
    name: "StubsCompiler",
    products: [
        .executable(name: "StubsCompiler", targets: ["StubsCompilerCLI"])
    ],
    dependencies: [
        .package(url: "https://github.com/Patrick-Remy/antlr4", .revision("93179b21623758c14c4072478617436c7ad3d4b0"))
    ],
    targets: [
        .target(name: "StubsLexer", dependencies: ["Antlr4"]),
        .target(name: "StubsParser", dependencies: ["Antlr4", "StubsLexer"]),
        .target(name: "StubsAST", dependencies: ["Antlr4", "StubsParser"]),
        .target(name: "StubsTypeChecker", dependencies: ["Antlr4", "StubsParser", "StubsAST"]),
        .target(name: "StubsCodeGenerator", dependencies: ["StubsAST"]),
        .target(name: "StubsCompiler", dependencies: ["Antlr4", "StubsLexer", "StubsParser", "StubsAST", "StubsTypeChecker", "StubsCodeGenerator"]),
        .target(name: "StubsCompilerCLI", dependencies: ["StubsCompiler"]),

        .testTarget(name: "StubsParserTests", dependencies: ["Antlr4", "StubsLexer", "StubsParser"]),
        .testTarget(name: "StubsASTTests", dependencies: ["Antlr4", "StubsLexer", "StubsParser", "StubsAST"]),
        .testTarget(name: "StubsTypeCheckerTests", dependencies: ["Antlr4", "StubsAST", "StubsTypeChecker"]),
        .testTarget(name: "StubsCodeGeneratorTests", dependencies: ["Antlr4", "StubsAST", "StubsTypeChecker", "StubsCodeGenerator"]),
        .testTarget(name: "StubsCompilerTests", dependencies: ["StubsCompiler"])
    ]
)
