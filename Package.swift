// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.
// Lite version for YandexMapsMobile
import PackageDescription

let package = Package(
    name: "YandexMapsMobile",
    platforms: [
        .iOS(.v12),
    ],
    products: [
        .library(
            name: "YandexMapsMobile",
            targets: ["YandexMapsMobile"])
    ],
    dependencies: [
    ],
    targets: [
        .binaryTarget(
            name: "YandexMapsMobile",
            url: "https://github.com/surfstudio/surf-yandex-maps-ios-sdk-full/releases/download/4.7.0/YandexMapsMobile.xcframework.zip",
            checksum: "39c3b16eb5f55ec54bfc7dd5f51e2161a527ee679e75f547790cb775fcdcee2c"
        ),
    ]
)
