// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftSugar",
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(name: "UIKit+Sugar", targets: ["UIKit+Sugar"]),
        .library(name: "QuartzCore+Sugar", targets: ["QuartzCore+Sugar"]),
        .library(name: "Foundation+Sugar", targets: ["Foundation+Sugar"]),
        .library(name: "CoreGraphics+Sugar", targets: ["CoreGraphics+Sugar"]),
    ],
    dependencies: [
        .package(url: "https://github.com/malcommac/SwiftDate.git", .upToNextMajor(from: "6.3.1")),
        .package(url: "https://github.com/RonasIT/swift-networking.git", .upToNextMajor(from: "2.0.0")),
    ],
    targets: [
        .target(name: "UIKit+Sugar", path: "Sources/UIKit+Sugar"),
        .target(name: "QuartzCore+Sugar", path: "Sources/QuartzCore+Sugar"),
        .target(name: "Foundation+Sugar", path: "Sources/Foundation+Sugar"),
        .target(name: "CoreGraphics+Sugar", path: "Sources/CoreGraphics+Sugar"),
    ]
)
