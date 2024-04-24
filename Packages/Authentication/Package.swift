// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Authentication",
    platforms: [.iOS(.v17), .macOS(.v14)],
    products: [
        .library(name: "AuthenticationFeature", targets: ["AuthenticationFeature"]),
        .library(name: "AuthenticationFeatureUI", targets: ["AuthenticationFeatureUI"]),
        .library(name: "AuthenticationFeatureAPI", targets: ["AuthenticationFeatureAPI"]),
    ],
    dependencies: [
        .package(path: "../AuthenticationAPI"),
        .package(
            url: "https://github.com/pointfreeco/swift-composable-architecture",
            from: "1.9.0"
        )
    ],
    targets: [
        .target(
            name: "AuthenticationFeature",
            dependencies: [
                "AuthenticationFeatureAPI",
                "AuthenticationAPI",
                .product(name: "ComposableArchitecture", package: "swift-composable-architecture")
            ]
        ),
        .target(
            name: "AuthenticationFeatureAPI",
            dependencies: [
                .product(name: "ComposableArchitecture", package: "swift-composable-architecture")
            ]
        ),
        .target(
            name: "AuthenticationFeatureUI",
            dependencies: [
                "AuthenticationFeatureAPI",
                .product(name: "ComposableArchitecture", package: "swift-composable-architecture")
            ]
        ),
        .testTarget(
            name: "AuthenticationFeatureTests",
            dependencies: ["AuthenticationFeature"]),
    ]
)
