load("@rules_cc//cc:defs.bzl", "cc_library")

genrule(
    name = "parser_gen",
    srcs = ["parser.y"],
    outs = ["parser.cpp", "parser.hh", "location.hh"],
    cmd = """
        bison --defines=$(location parser.hh) --output=$(location parser.cpp) --graph $(location parser.y)
        # Bison генерирует location.hh в текущей директории, копируем его в выходную
        if [ -f location.hh ]; then 
            cp location.hh $(location location.hh)
        else 
            touch $(location location.hh)
        fi
    """,
    message = "Generating parser from parser.y",
)

genrule(
    name = "scanner_gen",
    srcs = [
        "scanner.l",
        ":parser_gen",
    ],
    outs = ["scanner.cpp"],
    cmd = """
        flex --c++ --outfile=$(location scanner.cpp) $(location scanner.l)
    """,
    message = "Generating scanner from scanner.l",
)

cc_library(
    name = "grammar_lib",
    srcs = [
        ":parser_gen",
        ":scanner_gen",
        "Program.cpp",
        "expressions/NumberExpression.cpp",
        "expressions/MulExpression.cpp",
        "expressions/AddExpression.cpp",
        "expressions/SubstractExpression.cpp",
        "expressions/DivExpression.cpp",
        "expressions/IdentExpression.cpp",
        "statements/Statement.cpp",
        "statements/Assignment.cpp",
        "statements/StatementList.cpp",
        "statements/PrintStatement.cpp",
        "statements/VarDecl.cpp",
        "statements/ScopeAssignmentList.cpp",
        "functions/ParamList.cpp",
        "functions/Function.cpp",
        "functions/FunctionList.cpp",
        "expressions/FunctionCallExpression.cpp",
        "functions/ParamValueList.cpp",
        "statements/ReturnStatement.cpp",
    ],
    hdrs = [
        ":parser_gen",
        "Program.h",
        "scanner.h",
        "expressions/NumberExpression.h",
        "expressions/MulExpression.h",
        "expressions/AddExpression.h",
        "expressions/SubstractExpression.h",
        "expressions/DivExpression.h",
        "expressions/IdentExpression.h",
        "expressions/Expression.h",
        "statements/Statement.h",
        "statements/Assignment.h",
        "statements/StatementList.h",
        "statements/PrintStatement.h",
        "statements/VarDecl.h",
        "statements/ScopeAssignmentList.h",
        "statements/ReturnStatement.h",
        "functions/ParamList.h",
        "functions/Function.h",
        "functions/FunctionList.h",
        "expressions/FunctionCallExpression.h",
        "functions/ParamValueList.h",
        "base_elements/BaseElement.h",
    ],
    includes = [
        "../include",
    ],
    copts = [
        "-I.",
        "-Igrammar",
        "-I$(GENDIR)/grammar",
    ],
    visibility = ["//visibility:public"],
    deps = [
        "//:common_headers",
    ],
)

