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
            checksum: "dcc07dacaa7b5819ed876966e2e098463bf2dc2ad3fa995ec8aedf2533c393c7"
        )
    ]
)
