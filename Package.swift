// swift-tools-version:5.10.1

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
