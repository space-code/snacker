<h1 align="center" style="margin-top: 0px;">snacker</h1>

<p align="center">
<a href="https://github.com/space-code/snacker/blob/main/LICENSE"><img alt="License" src="https://img.shields.io/github/license/space-code/snacker?style=flat"></a> 
<a href="https://swiftpackageindex.com/space-code/snacker"><img alt="Swift Compatibility" src="https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2Fspace-code%2Fsnacker%2Fbadge%3Ftype%3Dswift-versions"/></a> 
<a href="https://swiftpackageindex.com/space-code/snacker"><img alt="Platform Compatibility" src="https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2Fspace-code%2Fsnacker%2Fbadge%3Ftype%3Dplatforms"/></a> 
<a href="https://github.com/space-code/snacker"><img alt="CI" src="https://github.com/space-code/snacker/actions/workflows/ci.yml/badge.svg?branch=main"></a>

## Description
`snacker` is a lightweight Swift library for displaying snackbars in iOS applications.

- [Usage](#usage)
- [Requirements](#requirements)
- [Installation](#installation)
- [Communication](#communication)
- [Contributing](#contributing)
- [Author](#author)
- [License](#license)

## Usage

```swift
import Snackner

Snacker.shared.action(
    .snack(
        view: view,
        data: SnackbarData(
            snackbarAlignment: .top(spacing: 20),
            insets: .zero,
            animationDuration: 0.25
        )
    ),
    container: window
)
```

## Requirements

- iOS 17.0+
- Xcode 16.0
- Swift 6.0

## Installation
### Swift Package Manager

The [Swift Package Manager](https://swift.org/package-manager/) is a tool for automating the distribution of Swift code and is integrated into the `swift` compiler. It is in early development, but `snacker` does support its use on supported platforms.

Once you have your Swift package set up, adding `snacker` as a dependency is as easy as adding it to the `dependencies` value of your `Package.swift`.

```swift
dependencies: [
    .package(url: "https://github.com/space-code/snacker.git", .upToNextMajor(from: "1.0.0"))
]
```

## Communication
- If you **found a bug**, open an issue.
- If you **have a feature request**, open an issue.
- If you **want to contribute**, submit a pull request.

## Contributing
Bootstrapping development environment

```
make bootstrap
```

Please feel free to help out with this project! If you see something that could be made better or want a new feature, open up an issue or send a Pull Request!

## Author
Nikita Vasilev, nv3212@gmail.com

## License
snacker is available under the MIT license. See the LICENSE file for more info.
