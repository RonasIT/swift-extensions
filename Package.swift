// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftExtensions",
    platforms: [
        .macOS(.v10_15),
        .iOS(.v13),
        .tvOS(.v11),
        .watchOS(.v4)
    ],
    products: [
        .library(name: "RNSArrayExtension", targets: ["RNSArrayExtension"]),
        .library(name: "RNSCGAffineTransformScaleExtension", targets: ["RNSCGAffineTransformScaleExtension"]),
        .library(name: "RNSKeyedDecodingContainerExtension", targets: ["RNSKeyedDecodingContainerExtension"]),
        .library(name: "RNSCGSizeExtension", targets: ["RNSCGSizeExtension"]),
        .library(name: "RNSCollectionViewExtension", targets: ["RNSCollectionViewExtension"]),
        .library(name: "RNSDecodingErrorExtension", targets: ["RNSDecodingErrorExtension"]),
        .library(name: "RNSEdgeInsetsExtension", targets: ["RNSEdgeInsetsExtension"]),
        .library(name: "RNSEncodableExtension", targets: ["RNSEncodableExtension"]),
        .library(name: "RNSErrorDecodingExtension", targets: ["RNSErrorDecodingExtension"]),
        .library(name: "RNSQuartzCoreExtension", targets: ["RNSQuartzCoreExtension"]),
        .library(name: "RNSStringValidation", targets: ["RNSStringValidation"]),
        .library(name: "RNSViewControllerKeyboardNotificationObserver", targets: ["RNSViewControllerKeyboardNotificationObserver"]),
        .library(name: "RNSViewExtension", targets: ["RNSViewExtension"]),
    ],
    dependencies: [
        .package(url: "https://github.com/malcommac/SwiftDate.git", .upToNextMajor(from: "6.3.1"))
    ],
    targets: [
        .target(name: "RNSArrayExtension", path: "Sources/RNSArrayExtension"),
        .target(name: "RNSCGAffineTransformScaleExtension", path: "Sources/RNSCGAffineTransformScaleExtension"),
        .target(
            name: "RNSKeyedDecodingContainerExtension",
            dependencies: ["SwiftDate"],
            path: "Sources/RNSKeyedDecodingContainerExtension"
        ),
        .target(
            name: "RNSCGSizeExtension",
            dependencies: ["RNSEdgeInsetsExtension"],
            path: "Sources/RNSCGSizeExtension"
        ),
        .target(name: "RNSCollectionViewExtension", path: "Sources/RNSCollectionViewExtension"),
        .target(name: "RNSDecodingErrorExtension", path: "Sources/RNSDecodingErrorExtension"),
        .target(name: "RNSEdgeInsetsExtension", path: "Sources/RNSEdgeInsetsExtension"),
        .target(name: "RNSEncodableExtension", path: "Sources/RNSEncodableExtension"),
        .target(name: "RNSErrorDecodingExtension", path: "Sources/RNSErrorDecodingExtension"),
        .target(name: "RNSQuartzCoreExtension", path: "Sources/RNSQuartzCoreExtension"),
        .target(name: "RNSStringValidation", path: "Sources/RNSStringValidation"),
        .target(name: "RNSViewControllerKeyboardNotificationObserver", path: "Sources/RNSViewControllerKeyboardNotificationObserver"),
        .target(name: "RNSViewExtension", path: "Sources/RNSViewExtension"),
    ]
)
