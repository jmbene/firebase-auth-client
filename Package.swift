// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription


let package = Package(
    name: "firebase-auth-client",
    platforms: [
        .macOS(.v11),
        .iOS(.v14),
        .watchOS(.v7),
        .tvOS(.v13)
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "FirebaseAuthClient",
            targets: ["FirebaseAuthClient"]),
        .library(
            name: "FirebaseAuthClientLive",
            targets: ["FirebaseAuthClientLive"])
    ],
    dependencies: [
        .package(url: "https://github.com/pointfreeco/swift-dependencies", from: "1.2.2"),
        .package(url: "https://github.com/firebase/firebase-ios-sdk", from: "10.22.1")
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "FirebaseAuthClient",
            dependencies: [
                .product(name: "Dependencies", package: "swift-dependencies")
            ]
        ),
        .target(
            name: "FirebaseAuthClientLive",
            dependencies: [
                "FirebaseAuthClient",
                .product(name: "Dependencies", package: "swift-dependencies"),
                .product(name: "FirebaseAuth", package: "firebase-ios-sdk")
            ]
        ),
        .testTarget(
            name: "FirebaseAuthClientTests",
            dependencies: ["FirebaseAuthClient"]),
    ]
)
