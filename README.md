<h1 align="center" style="margin-top: 0px;">snacker</h1>

<p align="center">
<a href="https://github.com/space-code/snacker/blob/main/LICENSE"><img alt="License" src="https://img.shields.io/github/license/space-code/snacker?style=flat"></a> 
<a href="https://swiftpackageindex.com/space-code/snacker"><img alt="Swift Compatibility" src="https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2Fspace-code%2Fsnacker%2Fbadge%3Ftype%3Dswift-versions"/></a> 
<a href="https://swiftpackageindex.com/space-code/snacker"><img alt="Platform Compatibility" src="https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2Fspace-code%2Fsnacker%2Fbadge%3Ftype%3Dplatforms"/></a> 
<a href="https://github.com/space-code/snacker"><img alt="CI" src="https://github.com/space-code/snacker/actions/workflows/ci.yml/badge.svg?branch=main"></a>

## Description
Snacker is a modern, lightweight Swift framework for displaying customizable snackbars and toast notifications in iOS applications. Designed with simplicity in mind, it allows developers to present any custom view as a non-intrusive notification with flexible positioning and smooth animations.

## Features
✨ Custom Views — Display any UIView as a snackbar  
📐 Flexible Positioning — Support for top and bottom screen alignments  
🎬 Smooth Animations — Fully configurable transition durations  
🎯 Simple API — Single-line execution via a shared service  
📱 Modern Swift — Built for Swift 6.0 and iOS 17.0+  
⚡ Lightweight — Minimal overhead with zero external dependencies  
🧪 Well Tested — Reliable performance for production environments  

## Table of Contents

* [Requirements](#requirements)
* [Installation](#installation)
* [Quick Start](h#quick-start)
* [Usage](#usage)
* [Custom View Implementation](#custom-view-implementation)
* [Communication](#communication)
* [Contributing](#contributing)
* [Development Setup](#development-setup)

## Requirements

| Platform | Minimum Version |
| --- | --- |
| iOS | 17.0+ |
| Xcode | 16.0+ |
| Swift | 6.0+ |

## Installation

### Swift Package Manager

Add the following dependency to your `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/space-code/snacker.git", from: "1.0.1")
]

```

Or add it through Xcode:

1. File > Add Package Dependencies
2. Enter package URL: `https://github.com/space-code/snacker.git`
3. Select version requirements

## Quick Start

```swift
import Snacker

let myView = MyCustomView() // Any UIView subclass

Snacker.shared.action(
    .snack(
        view: myView,
        data: SnackbarData(
            snackbarAlignment: .top(spacing: 20),
            animationDuration: 0.25
        )
    ),
    container: window
)

```

## Usage

### Custom View Implementation

You can display any view as a snackbar. Here is a practical example of creating and presenting a simple information toast:

```swift
import UIKit
import Snacker

// 1. Define your custom notification view
final class InfoToastView: UIView {
    private let messageLabel = UILabel()

    init(text: String) {
        super.init(frame: .zero)
        backgroundColor = .secondarySystemBackground
        layer.cornerRadius = 10
        
        messageLabel.text = text
        messageLabel.textAlignment = .center
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(messageLabel)
        NSLayoutConstraint.activate([
            messageLabel.topAnchor.constraint(equalTo: topAnchor, constant: 12),
            messageLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12),
            messageLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            messageLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16)
        ])
    }

    required init?(coder: NSCoder) { fatalError() }
}

// 2. Present the snackbar
func notifyUser() {
    let toast = InfoToastView(text: "New message received!")
    
    let config = SnackbarData(
        snackbarAlignment: .bottom(spacing: 50),
        insets: UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20),
        animationDuration: 0.3
    )
    
    Snacker.shared.action(
        .snack(view: toast, data: config),
        container: self.view.window
    )
}

```

## Communication

- 🐛 **Found a bug?** [Open an issue](https://github.com/space-code/typhoon/issues/new)
- 💡 **Have a feature request?** [Open an issue](https://github.com/space-code/typhoon/issues/new)
- ❓ **Questions?** [Start a discussion](https://github.com/space-code/typhoon/discussions)
- 🔒 **Security issue?** Email nv3212@gmail.com

## Contributing

We love contributions! Please feel free to help out with this project. If you see something that could be made better or want a new feature, open up an issue or send a Pull Request.

### Development Setup

Bootstrap the development environment:

```bash
mise install
```

## Author

**Nikita Vasilev**
- Email: nv3212@gmail.com
- GitHub: [@ns-vasilev](https://github.com/ns-vasilev)

## License

Snacker is released under the MIT license. See [LICENSE](https://github.com/space-code/snacker/blob/main/LICENSE) for details.

---

<div align="center">

**[⬆ back to top](https://www.google.com/search?q=%23snacker)**

Made with ❤️ by [space-code](https://github.com/space-code)

</div>