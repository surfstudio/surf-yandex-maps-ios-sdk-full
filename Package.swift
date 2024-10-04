// swift-tools-version: 5.7
import PackageDescription

let package = Package(
    name: "YandexMapsMobile",
    platforms: [.iOS(.v13)],
    products: [
        .library(
            name: "YandexMapsMobile",
            targets: ["YandexMapsMobile"])
    ],
    dependencies: [],
    targets: [
        .binaryTarget(
            name: "YandexMapsMobile",
            url: "https://github.com/surfstudio/surf-yandex-maps-ios-sdk-full/releases/download/4.8.0/YandexMapsMobile.xcframework.zip",
            checksum: "97370469642ab9d73792dccff570ff421c4759406201877afb859425f6f549fd"
        )
    ]
)
