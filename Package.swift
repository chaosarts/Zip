// swift-tools-version:5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.
import PackageDescription

let package = Package(
    name: "Zip",
    products: [
        .library(name: "Zip", targets: ["Zip"])
    ],
    targets: [
        .target(
            name: "Minizip",
            dependencies: [],
            path: "Zip/minizip",
            exclude: ["module"],
            linkerSettings: [
                .linkedLibrary("z")
            ]),
        .target(
            name: "Zip",
            dependencies: ["Minizip"],
            path: "Zip",
            exclude: ["minizip", "zlib"],
            resources: [.copy("Resources/PrivacyInfo.xcprivacy")]),
        .testTarget(
            name: "ZipTests",
            dependencies: ["Zip"],
            path: "ZipTests"),
    ]
)
