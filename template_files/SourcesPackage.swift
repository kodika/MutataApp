// swift-tools-version:5.0

import PackageDescription

let package = Package(
    name: "SWIFT_MODULE_NAME",
    products: [
        .library(
            name: "SWIFT_MODULE_NAME",
            targets: ["SWIFT_MODULE_NAME"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "SWIFT_MODULE_NAME",
            dependencies: [
            ],
            path: "",
            sources: [
                "./Sources-Android/"
            ],
            swiftSettings:[
                .define("ANDROID"),
            ]
        ),
    ]
)
