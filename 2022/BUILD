load("@rules_cc//cc:defs.bzl", "cc_binary", "cc_library")

cc_library(
    name = "common_headers",
    hdrs = [
        "visitors/elements.h",
    ],
    copts = [
        "-I.",
    ],
    visibility = ["//visibility:public"],
)

cc_library(
    name = "llvm_headers",
    includes = [
        "external_llvm/include",
    ],
    copts = [
        "-Iexternal_llvm/include",
    ],
    visibility = ["//visibility:public"],
)

cc_library(
    name = "common_lib",
    srcs = [
        "driver.cpp",
        "visitors/TemplateVisitor.cpp",
        "visitors/PrintVisitor.cpp",
        "visitors/MainInterpreter.cpp",
        "visitors/IrGeneratorVisitor.cpp",
        "visitors/SymbolTableVisitor.cpp",
        "symbols/BaseSymbol.cpp",
        "symbols/VariableSymbol.cpp",
        "symbols/Function.cpp",
        "scopes/BaseScope.cpp",
    ],
    hdrs = [
        "visitors/MainInterpreter.h",
        "visitors/IrGeneratorVisitor.h",
        "visitors/SymbolTableVisitor.h",
        "visitors/PrintVisitor.h",
        "visitors/TemplateVisitor.h",
        "visitors/elements.h",
        "symbols/BaseSymbol.h",
        "symbols/Function.h",
        "symbols/VariableSymbol.h",
        "scopes/BaseScope.h",
    ],
    includes = [
        "include",
    ],
    copts = [
        "-I.",
        "-Igrammar",
        "-I$(GENDIR)/grammar",
    ],
    visibility = ["//visibility:public"],
    deps = [
        ":common_headers",
        ":llvm_headers",
        "//grammar:grammar_lib",
    ],
)

cc_binary(
    name = "Compilers2022Executable",
    srcs = ["main.cpp"],
    deps = [
        ":common_lib",
        "//grammar:grammar_lib",
    ],
    copts = [
        "-I.",
        "-Igrammar",
        "-I$(GENDIR)/grammar",
    ],
    linkopts = [
        "-L/usr/lib/llvm-14/lib",
        "-Wl,--start-group",
        "-lLLVMSupport",
        "-lLLVMCore",
        "-lLLVMIRReader",
        "-lLLVMDebugInfoDWARF",
        "-lLLVMRemarks",
        "-lLLVMBinaryFormat",
        "-lLLVMBitstreamReader",
        "-Wl,--end-group",
        "-ltinfo",
        "-lpthread",
        "-ldl",
        "-lz",
    ],
)

cc_binary(
    name = "Compilers2022Executable_tests",
    srcs = ["test_scope.cpp"],
    deps = [
        ":common_lib",
        "//grammar:grammar_lib",
    ],
    copts = [
        "-I.",
        "-Igrammar",
        "-I$(GENDIR)/grammar",
    ],
    linkopts = [
        "-L/usr/lib/llvm-14/lib",
        "-Wl,--start-group",
        "-lLLVMSupport",
        "-lLLVMCore",
        "-lLLVMIRReader",
        "-lLLVMDebugInfoDWARF",
        "-lLLVMRemarks",
        "-lLLVMBinaryFormat",
        "-lLLVMBitstreamReader",
        "-Wl,--end-group",
        "-ltinfo",
        "-lpthread",
        "-ldl",
        "-lz",
    ],
)

cc_binary(
    name = "Compilers2022Executable_ir",
    srcs = ["test_ir.cpp"],
    deps = [
        ":common_lib",
        "//grammar:grammar_lib",
    ],
    copts = [
        "-I.",
        "-Igrammar",
        "-I$(GENDIR)/grammar",
    ],
    linkopts = [
        "-L/usr/lib/llvm-14/lib",
        "-Wl,--start-group",
        "-lLLVMSupport",
        "-lLLVMCore",
        "-lLLVMIRReader",
        "-lLLVMDebugInfoDWARF",
        "-lLLVMRemarks",
        "-lLLVMBinaryFormat",
        "-lLLVMBitstreamReader",
        "-Wl,--end-group",
        "-ltinfo",
        "-lpthread",
        "-ldl",
        "-lz",
    ],
)

