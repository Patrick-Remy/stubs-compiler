//
//  Constants.swift
//  StubsCodeGeneratorTests
//
//  Created by Patrick Remy on 27.01.18.
//

import Foundation
import StubsAST
import StubsCodeGenerator
import XCTest


class TestSuite {

    enum Error: Swift.Error {
        case jasminError(String!)
        case javaError(String!)
        case timeoutReached(TimeInterval)
    }

    static let sourcesURL = URL(fileURLWithPath: FileManager.default.currentDirectoryPath + "Tests/StubsCodeGeneratorTests/Sources")
    static let outputURL: URL = {
        let outputURL = URL(fileURLWithPath: NSTemporaryDirectory()).appendingPathComponent("StubsCompilerTests")
        try! FileManager.default.createDirectory(at: outputURL, withIntermediateDirectories: true)
        return outputURL
    }()

    class func generateClassFile(_ ast: Node) throws -> URL {
        let code = CodeGenerator.generate(for: ast)
        let fileURL = outputURL.appendingPathComponent(UUID().uuidString)
        try code.write(to: fileURL, atomically: false, encoding: .utf8)

        print("Generating class file for \(fileURL.path)...")

        let process = Process()
        process.launchPath = "/usr/local/bin/jasmin"
        process.arguments = [fileURL.path, "-d", fileURL.deletingLastPathComponent().path]

        let pipe = Pipe()
        process.standardError = pipe

        process.launch()
        process.waitUntilExit()

        guard process.terminationStatus == 0 else {
            let output = String(data: pipe.fileHandleForReading.readDataToEndOfFile(), encoding: .utf8)
            throw Error.jasminError(output)
        }

        // Jasmin's exit code can be 0, even if an error occurs, so ensure no error output is written
        if let output = String(data: pipe.fileHandleForReading.readDataToEndOfFile(), encoding: .utf8), output.count > 0 {
            throw Error.jasminError(output)
        }

        return fileURL
    }

    class func runProgram(_ url: URL, className: String, timeout: TimeInterval = 3) throws -> String? {
        print("Running program at \(url.path)...")

        let process = Process()
        process.launchPath = "/usr/bin/java"
        process.arguments = ["-cp", url.deletingLastPathComponent().path, className]

        let pipe = Pipe()
        process.standardOutput = pipe
        process.standardError = pipe

        process.launch()
        // Kill program after timeout
        var timeoutReached = false
        DispatchQueue.main.asyncAfter(deadline: .now() + timeout) {
            process.interrupt()
            process.terminate()
            timeoutReached = true
        }
        process.waitUntilExit()

        guard !timeoutReached else {
            throw Error.timeoutReached(timeout)
        }

        let output = String(data: pipe.fileHandleForReading.readDataToEndOfFile(), encoding: .utf8)
        guard process.terminationStatus == 0 else {
            throw Error.javaError(output)
        }

        return output
    }

}
