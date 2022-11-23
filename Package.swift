// swift-tools-version:5.0
import Foundation
import PackageDescription

let package = Package(
  name: "SnapshotTesting",
  platforms: [
    .iOS(.v11),
    .macOS(.v10_10),
    .tvOS(.v10)
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
      swiftSettings: [.unsafeFlags(["-O"], .when(configuration: .debug))]
    ),
    .testTarget(
      name: "SnapshotTestingTests",
      dependencies: ["SnapshotTesting"]),
  ]
)

if ProcessInfo.processInfo.environment.keys.contains("PF_DEVELOP") {
  package.dependencies.append(
    contentsOf: [
      .package(url: "https://github.com/yonaskolb/XcodeGen.git", .exact("2.15.1")),
    ]
  )
}
