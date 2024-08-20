# YandexMapsMobile, Full version

Binary Framework as Swift Package with Yandex mobile maps (full version).

Yandex mobile maps lite version you can find [here](https://github.com/surfstudio/surf-yandex-maps-ios-sdk).

🎉 Works on Apple silicone without Rosetta mode.

## Requirements

- iOS 12.0

## Swift Package Manager

To integrate YandexMapsMobile into your project using SwiftPM do this 👇🏻

- File > Swift Packages > Add Package Dependency
- Add `https://github.com/surfstudio/surf-yandex-maps-ios-sdk-full.git`
- Select "Up to Next Major" with "4.7.0"

or add the following code to your `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/surfstudio/surf-yandex-maps-ios-sdk-full.git", revision: "4.7.0"),
],
```
or via [XcodeGen](https://github.com/yonaskolb/XcodeGen) insert into your `project.yml`:

```yaml
name: YourProjectName
options:
  deploymentTarget:
    iOS: 12.0
packages:
  YandexMapsMobile:
    url: https://github.com/surfstudio/surf-yandex-maps-ios-sdk-full
    from: 4.7.0
targets:
  YourTarget:
    type: application
    ...
    dependencies:
       - package: YandexMapsMobile
```

## Recommedations to use

<details>
  <summary>Using on Apple silicon without Rosetta mode</summary>
  
1. You should init `YMKMapView` with `vulkanPreferred: true`
```swift
YMKMapView.init(frame: .zero, vulkanPreferred: isM1Simulator())

....

    #if targetEnvironment(simulator)
    public static func isM1Simulator() -> Bool {
        return TARGET_CPU_ARM64 != 0
    }
    #else
    public static func isM1Simulator() -> Bool { false }
    #endif

```

2. Call `YMKMapKit.sharedInstance()` in `AppDelegate` as in [example](https://github.com/yandex/mapkit-ios-demo/blob/master/MapKitDemo/AppDelegate.swift)

```swift
/**
If you create instance of YMKMapKit not in application:didFinishLaunchingWithOptions: 
you should also explicitly call YMKMapKit.sharedInstance().onStart()
*/
YMKMapKit.sharedInstance()
```

</details>

<details>
  <summary>Latest recommendations for project settings</summary>
  
to build project you should add following *linker flags* in the *Build Settings* tab:

```yaml
frameworks:
    "CoreFoundation",
    "Foundation",
    "CoreLocation",
    "UIKit",
    "OpenGLES",
    "SystemConfiguration",
    "CoreGraphics",
    "QuartzCore",
    "Security",
    "CoreTelephony",
    "CoreMotion"
libraries:
    "resolv",
    "c++"
```

as in the screenshot:

<img width="600" alt="Screenshot 2024-02-09 at 23 33 46" src="https://github.com/c-villain/YandexMapsMobile/assets/6235615/5eb59561-9ddb-45d0-84b3-5051fefce4d3">
  
</details>

<details>
  <summary>YandexMapsMobile as subpackage</summary>

If you use `YandexMapsMobile` as subdependency in your own package you should probably add `linkerSettings` to the target for successful building:

```swift
targets: [
    .target(
        name: "Your target",
        dependencies: [
            .product(name: "YandexMapsMobile", package: "surf-yandex-maps-ios-sdk")
        ],
        linkerSettings: [ // <===== ‼️LOOK HERE‼️
            .linkedFramework("CoreLocation"),
            .linkedFramework("CoreTelephony"),
            .linkedFramework("SystemConfiguration"),
            .linkedLibrary("c++"),
            .unsafeFlags(["-ObjC"]),
        ]),
]
```

</details>

## Special thanks

Based on work in this [repo](https://github.com/c-villain/YandexMapsMobile) ❤️
