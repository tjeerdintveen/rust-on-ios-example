// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "Swiftzerland",
  platforms: [
    .iOS(.v13) // <-- iOS only
  ],
  products: [
    .library(
      name: "Switzerland", // <-- We can use the Switzerland name
      targets: ["Switzerland"] // <-- We can use the Switzerland name
    ),
  ],
  targets: [
    .testTarget(
      name: "SwiftzerlandTests",
      dependencies: ["Switzerland"]
    ),
    // Binary target for the XCFramework
    .binaryTarget(
      name: "switzerlandFFI",
      path: "Switzerland.xcframework"
    ),
    // Swift target that wraps the binary
    .target(
      name: "Switzerland",
      dependencies: ["switzerlandFFI"]
    ),

  ]
)

