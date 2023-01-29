// swift-tools-version:5.3
// DO NOT EDIT! Generated automatically. See scripts/swift_package_generator.py
import PackageDescription


let package = Package(
    name: "TDLibFramework",
    platforms: [
        .watchOS(.v2), // Based on iOS 9 version
    ],
    products: [
        .library(
            name: "TDLibFramework",
            targets: ["TDLibFrameworkWrapper"]
        )
    ],
    dependencies: [],
    targets: [
        .target(
            name: "TDLibFrameworkWrapper",
            dependencies: [.target(name: "TDLibFramework")],
            linkerSettings: [
                .linkedLibrary("c++"),
                .linkedLibrary("z"),
            ]
        ),
        .binaryTarget(
            name: "TDLibFramework",
            url: "https://github.com/georgeprokopenko/TDLibFramework/releases/download/1.8.10-758ced94/TDLibFramework.zip",
            checksum: "67bf2455db125896c1ec9cf5e9b762139670f89d3f2959c78237aaebe4157bea"
        )
    ]
)
