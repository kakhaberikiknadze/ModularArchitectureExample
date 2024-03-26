// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Root",
    platforms: [.iOS(.v17), .macOS(.v14)],
    products: [
        .library(name: "RootFeature", targets: ["RootFeature"]),
        .library(name: "RootFeatureAPI", targets: ["RootFeatureAPI"]),
        .library(name: "RootFeatureUI", targets: ["RootFeatureUI"])
    ],
    dependencies: [
        .package(path: "../RootAPI"),
        .package(
            url: "https://github.com/pointfreeco/swift-composable-architecture",
            from: "1.9.0"
        )
    ],
    targets: [
        .target(
            name: "RootFeature",
            dependencies: [
                "RootFeatureAPI",
                "RootAPI",
                .product(name: "ComposableArchitecture", package: "swift-composable-architecture")
            ]
        ),
        .target(
            name: "RootFeatureAPI",
            dependencies: [
                .product(name: "ComposableArchitecture", package: "swift-composable-architecture")
            ]
        ),
        .target(
            name: "RootFeatureUI",
            dependencies: [
                "RootFeatureAPI",
                .product(name: "ComposableArchitecture", package: "swift-composable-architecture")
            ]
        ),
        .testTarget(
            name: "RootFeatureTests",
            dependencies: ["RootFeature"]
        )
    ]
)
