// swift-tools-version: 6.0

import PackageDescription

let package = Package(
  name: "AdventOfSwift",
  products: [
    .library(name: "AdventOfSwift", targets: ["AdventOfSwift"]),
  ],
  targets: [
    .target(name: "AdventOfSwift"),
    .testTarget(name: "AdventOfSwiftTests", dependencies: ["AdventOfSwift"], resources: [.copy("Resources")]),
  ]
)
