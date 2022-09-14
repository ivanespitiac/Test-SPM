// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "TestSPM",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "TestSPM",
            targets: ["TestSPM"]),
    ],
    dependencies: [
        .package(url: "https://github.com/Alamofire/Alamofire.git", .upToNextMajor(from: "5.6.1"))
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "TestSPM",
            dependencies: [
                .target(name: "Test"),
                .product(name: "Alamofire", package: "Alamofire"),
            ]),
        .testTarget(
            name: "TestSPMTests",
            dependencies: ["TestSPM"]),
        .binaryTarget(
            name: "Test",
            path: "./Sources/Test.xcframework")
    ]
)
