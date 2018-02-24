# StubsCompiler
A simple compiler for a subset of Scala.

## Build

### Dependencies
At least ANTLR 4.7.1 is required.
On macOS you can install it with [brew](https://brew.sh) via `brew install antlr`.
You can also follow the [official installation instructions](http//antlr.org) for your operating system.
Note, that in this case, you can't use an alias, unless you add it to your ~/.bash_profile and reloaded it with `source ~/.bash_profile`. Otherwise you have to adjust the build call in the Makefile to match your installed jar file.

### `make` it!
You can compile the compiler easily by running `make`. To clean all build files run `make clean` and for a clean build combine it: `make clean build`.

### Generate Parser and Lexer
The grammar files are located in the `Grammar` folder. To update the generated source files, after modifying the grammar, run: 
```sh
make clean_parser \ # clean parser and lexer source folders
     parser         # generate both sources from grammar
```

### Generate .xcodeproj
This project is using the Swift Package Manger. If you'd like to generate an xcodeproj run `swift package generate-xcodeproj`.


## Run
`./StubsCompiler -compile filename`

## Test

### Run testsuite
All automated tests can be executed with `make test`.

### Linting
To lint the source code (incl. written tests), run `make lint`.

### Open the CST with `grun`
You can test the parser interactively by running:
```sh
make clean_grun \       # delete all previously generated grun files
     grun               # generate and compile java files for parser
cd Tests/grun
grun Stubs program -gui # run grun test tool and open tree inspector
```
Then paste your code, press Enter and Ctrl+D to indicating the EOF. This will open the parse tree in a seperate window.

If you are running into java compiler errors like `Cannot find symbol: TerminalNode`, ensure to export the antlr4 jar classpath in your `~/.bash_profile` or your operating systems equivalent, e.g.:
`export CLASSPATH=".:/usr/local/lib/antlr-4.7.1.jar:$CLASSPATH"`
