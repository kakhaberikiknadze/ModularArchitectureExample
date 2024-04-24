// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AuthenticationAPI",
    platforms: [.iOS(.v17), .macOS(.v10_14)],
    products: [
        .library(name: "AuthenticationAPI", targets: ["AuthenticationAPI"]),
    ],
    dependencies: [
        .package(
            url: "https://github.com/pointfreeco/swift-composable-architecture",
            from: "1.9.0"
        )
    ],
    targets: [
        .target(
            name: "AuthenticationAPI",
            dependencies: [
                .product(name: "ComposableArchitecture", package: "swift-composable-architecture")
            ]
            
        ),
        .testTarget(
            name: "AuthenticationAPITests",
            dependencies: ["AuthenticationAPI"]
        )
    ]
)
