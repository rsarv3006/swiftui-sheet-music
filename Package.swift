// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftUISheetMusic",
    platforms: [
        .iOS(.v14),
        .macOS(.v11),
        .tvOS(.v13),
        .watchOS(.v6)
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "SwiftUISheetMusic",
            targets: ["SwiftUISheetMusic"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
//        .package(url: "https://github.com/rsarv3006/music-notation", branch: "swiftui"),
        .package(url: "https://github.com/nalexn/ViewInspector", from: "0.9.5"),
        .package(path: "../music-notation")
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "SwiftUISheetMusic",
            dependencies: [.product(name: "MusicNotation", package: "music-notation")],
            resources: [.process("Fonts")]
        ),
        .testTarget(
            name: "SwiftUISheetMusicTests",
            dependencies: ["SwiftUISheetMusic", .product(name: "ViewInspector", package: "ViewInspector")]),
    ]
)
