// swift-tools-version: 6.0

import PackageDescription

let package = Package(
  name: "AdventOfSwift",
  platforms: [.macOS(.v15)],
  products: [
//    .executable(name: "Scaffolder", targets: ["AdventOfSwift"])
  ],
  dependencies: [
    .package(url: "https://github.com/apple/swift-argument-parser", from: "1.5.0")
  ],
  targets: [
    .target(
      name: "AdventOfSwift",
      dependencies: [.product(name: "ArgumentParser", package: "swift-argument-parser")],
      resources: [.copy("Resources")]
    ),
    .testTarget(
      name: "AdventOfSwiftTests",
      dependencies: ["AdventOfSwift"]
    )
  ]
)
