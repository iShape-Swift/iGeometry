# iGeometry
Vectors operations on integer field

---

## Installation

### [CocoaPods](https://cocoapods.org/)

Add the following to your `Podfile`:
```ruby
pod 'iGeometry'
```

### [Cartage](https://github.com/Carthage/Carthage)

Add the following to your `Cartfile`:
```
github "iShape-Swift/iGeometry"
```

### [Package Manager](https://swift.org/package-manager/)


Add the following to your `Package.swift`:
```swift
let package = Package(
    name: "[your name]",
    products: [
        dependencies: [
            .package(url: "https://github.com/iShape-Swift/iGeometry", from: "0.1.3")
        ],
        targets: [
            .target(
                name: "[your target]",
                dependencies: ["iGeometry"])
        ]
    ]
)
```
