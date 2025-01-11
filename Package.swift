// swift-tools-version:6.0

import PackageDescription

let package = Package(
    name: "Basic",
    platforms: [
        .macOS(.v14)
    ],
    dependencies: [
        .package(url: "https://github.com/swiftwasm/JavaScriptKit", branch: "main"),
        .package(url: "https://github.com/vapor/vapor.git", from: "4.111.0"),
    ],
    targets: [
        .target(name: "Shared"),
        .executableTarget(
            name: "Basic",
            dependencies: [
                "Shared",
                .product(name: "JavaScriptKit", package: "JavaScriptKit"),
                .product(name: "JavaScriptEventLoop", package: "JavaScriptKit")
            ]
        ),
        .executableTarget(
            name: "Server",
            dependencies: [
                "Shared",
                .product(name: "Vapor", package: "vapor")
            ]
        )
    ]
)