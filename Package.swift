// swift-tools-version:5.7
import Foundation
import PackageDescription

let package = Package(
  name: "SnapshotTesting",
  platforms: [
    .iOS(.v11),
    .macOS(.v12),
    .tvOS(.v14)
  ],
  products: [
    .library(
      name: "SnapshotTesting",
      targets: ["SnapshotTesting"]),
  ],
  targets: [
    .target(
      name: "SnapshotTesting",
      dependencies: [],
      cSettings: [.unsafeFlags(["-O"], .when(configuration: .debug))],
      swiftSettings: [.unsafeFlags(["-O"], .when(configuration: .debug))]
    ),
    .testTarget(
      name: "SnapshotTestingTests",
      dependencies: ["SnapshotTesting"]),
  ]
)
