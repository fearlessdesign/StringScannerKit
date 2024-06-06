// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "StringScannerKit",
  defaultLocalization: "en",
  platforms: [
    .macOS("14"),
    .iOS("17"),
    .tvOS(.v16),
    .watchOS("10")
  ],
  products: [
    .library(name: "ScannerExtensions", targets: ["ScannerExtensions"]),
  ],
  dependencies: [
    .package(url: "https://github.com/apple/swift-docc-plugin", from: "1.3.0"),
  ],
  targets: [
    .target(name: "ScannerExtensions", swiftSettings: [
      .enableExperimentalFeature("StrictConcurrency")
    ]),
    .testTarget(name: "ScannerExtensionsTests", dependencies: [
      "ScannerExtensions"
    ]),
  ]
)
