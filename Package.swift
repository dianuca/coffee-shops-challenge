// swift-tools-version: 6.3

import PackageDescription

let package = Package(
    name: "coffee-shops-challenge",

    platforms: [
        .macOS(.v12)
    ],

    targets: [
        .executableTarget(
            name: "coffee-shops-challenge"
        ),

        .testTarget(
            name: "coffee-shops-challengeTests",
            dependencies: ["coffee-shops-challenge"]
        ),
    ],

    swiftLanguageModes: [.v6]
)
