ANTLR4?=antlr4 # java -jar /usr/local/lib/antlr-4.7.2-SNAPSHOT.jar
GRUN?=grun # java org.antlr.v4.gui.TestRig
SWIFT=swift
SWIFT_BUILD_FLAGS?=-c release
BUILT_PATH:=$(shell swift build ${SWIFT_BUILD_FLAGS} --show-bin-path)/StubsCompiler

RED=\033[0;31m
GREEN=\033[0;32m
NOCOLOR=\033[0m

all: build

build: parser
	@${SWIFT} build ${SWIFT_BUILD_FLAGS}
	@echo "🚀  ${GREEN}Successfully built the compiler.\nPath: ${BUILT_PATH}${NOCOLOR}"

test: parser
	@${SWIFT} test

parser: lexer
	@cd Grammar && ${ANTLR4} -visitor -lib ../Sources/StubsLexer -o ../Sources/StubsParser StubsParser.g4

lexer:
	@cd Grammar && ${ANTLR4} -visitor -o ../Sources/StubsLexer StubsLexer.g4

grun: parser_grun
	@cd Tests/grun/ && javac *.java

parser_grun: lexer_grun
	@cd Grammar && ${ANTLR4} -Dlanguage=Java -lib ../Tests/grun -o ../Tests/grun StubsParser.g4

lexer_grun:
	@cd Grammar && ${ANTLR4} -Dlanguage=Java -o ../Tests/grun StubsLexer.g4

clean: clean_parser clean_grun clean_build_folder

clean_build_folder:
	@${SWIFT} package clean
	-@rm -r .build || true

clean_parser:
	-@rm -r Sources/StubsParser 2>/dev/null || true
	-@rm -r Sources/StubsLexer 2>/dev/null || true

clean_grun:
	-@rm -r Tests/grun 2>/dev/null || true
