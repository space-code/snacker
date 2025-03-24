// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Snacker",
    platforms: [.iOS(.v17)],
    products: [
        .library(name: "Snacker", targets: ["Snacker"]),
    ],
    targets: [
        .target(name: "Snacker"),
        .testTarget(name: "SnackerTests", dependencies: ["Snacker"]),
    ]
)
