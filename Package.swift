// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftSugar",
    platforms: [
        .macOS(.v10_15),
        .iOS(.v13),
        .tvOS(.v11),
        .watchOS(.v4)
    ],
    products: [
        .library(name: "UIKit+Sugar", targets: ["UIKit+Sugar"]),
        .library(name: "QuartzCore+Sugar", targets: ["QuartzCore+Sugar"]),
        .library(name: "Foundation+Sugar", targets: ["Foundation+Sugar"]),
        .library(name: "CoreGraphics+Sugar", targets: ["CoreGraphics+Sugar"]),
    ],
    dependencies: [
        .package(url: "https://github.com/malcommac/SwiftDate.git", .upToNextMajor(from: "6.3.1"))
    ],
    targets: [
        .target(name: "UIKit+Sugar", path: "Sources/UIKit+Sugar"),
        .target(name: "QuartzCore+Sugar", path: "Sources/QuartzCore+Sugar"),
        .target(
            name: "Foundation+Sugar",
            dependencies: ["SwiftDate"],
            path: "Sources/Foundation+Sugar"
        ),
        .target(name: "CoreGraphics+Sugar", path: "Sources/CoreGraphics+Sugar"),
    ]
)
