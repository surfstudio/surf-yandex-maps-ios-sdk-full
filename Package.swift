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
            checksum: "2173854f9834b5e1daaee048cdbab5f01cbf670df506941f7396d98c4fd91a57"
        ),
    ]
)
