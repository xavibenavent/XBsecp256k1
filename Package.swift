// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "XBsecp256k1",
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "XBsecp256k1",
            targets: ["XBsecp256k1"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "XBsecp256k1",
            dependencies: [],
            exclude: [
                "src/modules/ecdh/Makefile.am.include",
                "src/modules/extrakeys/Makefile.am.include",
                "src/modules/recovery/Makefile.am.include",
                "src/modules/schnorrsig/Makefile.am.include",
                "src/valgrind_ctime_test.c",
                "src/asm",
                "src/bench.c",
                "src/bench_ecmult.c",
                "src/bench_internal.c",
                "src/modules/extrakeys/tests_impl.h",
                "src/modules/schnorrsig/tests_impl.h",
                "src/precompute_ecmult.c",
                "src/precompute_ecmult_gen.c",
                "src/tests_exhaustive.c",
                "src/tests.c",
            ],
            cSettings: [
                .define("ECMULT_WINDOW_SIZE", to: "15"),
                .define("ECMULT_GEN_PREC_BITS", to: "4"),
                // Enabling additional secp256k1 modules.
                .define("SECP256K1_ECDH_H"),
                .define("SECP256K1_MODULE_ECDH_MAIN_H"),
                .define("SECP256K1_EXTRAKEYS_H"),
                .define("SECP256K1_MODULE_EXTRAKEYS_MAIN_H"),
                .define("SECP256K1_SCHNORRSIG_H"),
                .define("SECP256K1_MODULE_SCHNORRSIG_MAIN_H"),
            ]
        ),
    ]
)
