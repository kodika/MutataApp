// swift-tools-version:5.0
import PackageDescription

let package = Package(
    name: "SwiftAndroid",
    products: [
        .library(name: "SwiftAndroid", type: .dynamic, targets: ["SwiftAndroid"])
    ],
    dependencies: [
        .package(path: "../../../../../iOSSources")
    ],
    targets: [
        .target(
            name: "SwiftAndroid",
            dependencies: [
                "SWIFT_MODULE_NAME"
            ]
        )
    ]
)
