// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "TaskTesting",
    platforms: [
        .iOS(.v14), .macOS("10.15")
    ],
    products: [
        .library(
            name: "TaskTesting",
            targets: ["TaskTesting"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "TaskTesting",
            dependencies: []),
        .testTarget(
            name: "TaskTestingTests",
            dependencies: ["TaskTesting"]),
    ]
)
