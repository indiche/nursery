// swift-tools-version:3.1

import PackageDescription

let package = Package(
    name: "nursery",
    dependencies: [
        .Package(url: "https://github.com/JohnSundell/Files", majorVersion: 1, minor: 9)
    ]
)
