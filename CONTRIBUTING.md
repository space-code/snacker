# Contributing to Snacker

First off, thank you for considering contributing to Snacker! It's people like you that make Snacker such a great tool for the iOS community.

## Table of Contents

* [Code of Conduct](#code-of-conduct)
* [Getting Started](#getting-started)
* [Development Setup](#development-setup)
* [Project Structure](#project-structure)
* [How Can I Contribute?](#how-can-i-contribute)
* [Reporting Bugs](#reporting-bugs)
* [Suggesting Features](#suggesting-features)
* [Improving Documentation](#improving-documentation)
* [Submitting Code](#submitting-code)
* [Development Workflow](#development-workflow)
* [Branching Strategy](#branching-strategy)
* [Commit Guidelines](#commit-guidelines)
* [Pull Request Process](#pull-request-process)
* [Coding Standards](#coding-standards)
* [Swift Style Guide](#swift-style-guide)
* [Code Quality](#code-quality)
* [Testing Requirements](#testing-requirements)
* [Community](#community)

## Code of Conduct

This project and everyone participating in it is governed by our Code of Conduct. By participating, you are expected to uphold this code. Please report unacceptable behavior to nv3212@gmail.com.

## Getting Started

### Development Setup

1. **Fork the repository**
```bash
# Click the "Fork" button on GitHub
```

2. **Clone your fork**
```bash
git clone https://github.com/YOUR_USERNAME/snacker.git
cd snacker
```

3. **Set up the development environment**
```bash
# Bootstrap the project
make bootstrap
```

4. **Create a feature branch**
```bash
git checkout -b feature/your-feature-name
```

5. **Open the project in Xcode**
```bash
open Package.swift
```

## How Can I Contribute?

### Reporting Bugs

Before creating a bug report, please check the [existing issues](#https://github.com/space-code/snacker/issues) to avoid duplicates.

When creating a bug report, include:

* **Clear title** - Describe the issue concisely
* **Reproduction steps** - Detailed steps to reproduce the bug
* **Expected behavior** - What you expected to happen
* **Actual behavior** - What actually happened
* **Environment** - OS, Xcode version, Swift version
* **Code samples** - Minimal reproducible example
* **Screenshots/Video** - Visual proof of UI glitches (highly recommended for Snacker)

**Example:**

```markdown
**Title:** Snackbar ignores safe area on iPhone 15 Pro

**Steps to reproduce:**
1. Call Snacker.shared.action with `.bottom` alignment
2. Rotate device to landscape
3. Observe snackbar overlapping the home indicator

**Expected:** Snackbar should respect safe area insets
**Actual:** Snackbar is clipped by the screen edge/home indicator

**Environment:**
- iOS 17.0
- Xcode 16.0
- Swift 6.0

**Code:**
\`\`\`swift
Snacker.shared.action(
    .snack(view: myView, data: .init(snackbarAlignment: .bottom(spacing: 0))),
    container: window
)
\`\`\`
```

### Suggesting Features

We love feature suggestions! When proposing a new feature, include:

* **Problem statement** - What problem does this solve?
* **Proposed solution** - How should it work?
* **Alternatives** - What alternatives did you consider?
* **Use cases** - Real-world scenarios
* **API design** - Example code showing usage
* **Visuals** - Mockups or sketches if applicable

**Example:**

```markdown
**Feature:** Swipe to dismiss

**Problem:** Users cannot manually dismiss a snackbar before the duration expires.

**Solution:** Add gesture recognizer to the container view to allow swiping the snackbar away.

**API:**
\`\`\`swift
let data = SnackbarData(
    snackbarAlignment: .top,
    interaction: .swipeToDismiss(direction: .up) // New parameter
)
\`\`\`

**Use case:** Error messages that block content which the user has already read.
```

### Improving Documentation

Documentation improvements are always welcome:

* **Code comments** - Add/improve inline documentation
* **DocC documentation** - Enhance documentation articles
* **README** - Fix typos, add visual examples
* **Guides** - Write tutorials on creating custom views
* **API documentation** - Document public APIs

### Submitting Code

1. **Check existing work** - Look for related issues or PRs
2. **Discuss major changes** - Open an issue for large features
3. **Follow coding standards** - See [Coding Standards](#coding-standards)
4. **Write tests** - All code changes require tests (logic & UI snapshots if possible)
5. **Update documentation** - Keep docs in sync with code
6. **Create a pull request** - Use clear description

## Development Workflow

### Branching Strategy

We use a simplified branching model:

* **`main`** - Main development branch (all PRs target this)
* **`feature/*`** - New features
* **`fix/*`** - Bug fixes
* **`docs/*`** - Documentation updates
* **`refactor/*`** - Code refactoring
* **`test/*`** - Test improvements

**Branch naming examples:**

```bash
feature/swipe-to-dismiss
fix/safe-area-calculation
docs/add-custom-view-example
refactor/animation-coordinator
test/add-queue-tests
```

### Commit Guidelines

We use [Conventional Commits](https://www.conventionalcommits.org/) for clear, structured commit history.

**Format:**

```
<type>(<scope>): <subject>

<body>

<footer>
```

**Types:**

* `feat` - New feature
* `fix` - Bug fix
* `docs` - Documentation changes
* `style` - Code style (formatting, no logic changes)
* `refactor` - Code refactoring
* `test` - Adding or updating tests
* `chore` - Maintenance tasks

**Scopes:**

* `core` - Core logic (Manager)
* `ui` - View components
* `animation` - Transitions and animations
* `layout` - Constraints and positioning
* `deps` - Dependencies

**Examples:**

```bash
feat(animation): add spring configuration support

Allow users to customize spring damping and velocity for
smoother snackbar appearance.

Closes #12

---

fix(layout): correct bottom spacing on iPad

iPad multitasking mode was causing incorrect width calculation.
Now uses safeAreaLayoutGuide correctly relative to container.

Fixes #23

---

docs(readme): add screenshot for custom view

Update README to show how a custom success toast looks
with the new styling options.

---

test(core): ensure queue order is preserved

Add tests to verify that multiple snackbar requests are
shown sequentially and not overlapping.

```

### Pull Request Process

1. **Update your branch**
```bash
git checkout main
git pull upstream main
git checkout feature/your-feature
git rebase main
```

2. **Run tests and checks**
```bash
# Run all tests
swift test
```

3. **Push to your fork**
```bash
git push origin feature/your-feature
```

4. **Create pull request**
* Target the `main` branch
* Provide clear description
* Link related issues
* **Attach screen recordings** for UI changes
* Request review from maintainers

## Coding Standards

### Swift Style Guide

We follow the [Swift API Design Guidelines](https://swift.org/documentation/api-design-guidelines/) and [Ray Wenderlich Swift Style Guide](https://github.com/raywenderlich/swift-style-guide).

**Key points:**

1. **Naming**
```swift
// ✅ Good
func show(view: UIView, data: SnackbarData)
let animationDuration: TimeInterval

// ❌ Bad
func doSnack(_ v: UIView, _ d: SnackbarData)
let dur: Double
```

2. **Protocols**
```swift
// ✅ Good - Use "I" prefix for protocols (Project Convention)
protocol ISnackbarManager {
    func schedule(_ action: SnackAction)
}

// ❌ Bad
protocol SnackbarManagerProtocol { }
```

3. **Access Control**
```swift
// ✅ Good - Explicit access control
public final class Snacker {
    public static let shared = Snacker()

    private let queue: DispatchQueue

    private init() {
        self.queue = DispatchQueue(label: "com.snacker.queue")
    }
}
```

4. **Documentation**
```swift
/// Displays a snackbar with custom configuration.
///
/// Use this method to present a transient notification view on top of
/// the current context. The view will be automatically dismissed
/// after the duration specified in `data`.
///
/// - Parameters:
///   - action: The action containing the view and configuration data.
///   - container: The window or view controller view to host the snackbar.
///
/// - Example:
/// ```swift
/// Snacker.shared.action(.snack(view: v, data: d), container: window)
/// ```
public func action(_ action: SnackAction, container: UIView) {
    // Implementation
}

```

### Code Quality

* **No force unwrapping** - Use optional binding or guards
* **No force casting** - Use conditional casting
* **UI on Main Thread** - Ensure all UI updates happen on `@MainActor`
* **Memory Management** - Watch out for retain cycles in closures (animations)
* **SOLID principles** - Follow SOLID design

**Example:**

```swift
// ✅ Good
@MainActor
func present(_ view: UIView) {
    guard let superview = container else { return }
    superview.addSubview(view)
}

// ❌ Bad
func present(_ view: UIView) {
    // Might crash if called from background
    container!.addSubview(view) 
}
```

### Testing Requirements

All code changes must include tests:

1. **Unit tests** - Test queue logic and data models
2. **Snapshot tests** - (Optional but recommended) Verify UI rendering
3. **Integration tests** - Test interaction between Manager and Views

**Coverage requirements:**

* New code: minimum 80% coverage
* Modified code: maintain or improve existing coverage

**Test structure:**

```swift
import XCTest
@testable import Snacker

final class SnackerManagerTests: XCTestCase {
    var sut: Snacker!
    
    override func setUp() {
        super.setUp()
        sut = Snacker()
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    // MARK: - Queue Tests
    
    func testAction_WhenQueueEmpty_ShowsImmediately() {
        // Given
        let view = UIView()
        let expectation = expectation(description: "View shown")
        
        // When
        sut.action(.snack(view: view, data: .default), container: UIView())
        
        // Then
        // Verify state change...
        expectation.fulfill()
        wait(for: [expectation], timeout: 1.0)
    }
}

```

## Community

* **Discussions** - Join [GitHub Discussions](#https://github.com/space-code/snacker/discussions)
* **Issues** - Track [open issues](#https://github.com/space-code/snacker/issues)
* **Pull Requests** - Review [open PRs](#https://github.com/space-code/snacker/pulls)

## Recognition

Contributors are recognized in:

* GitHub contributors page
* Release notes
* Project README (for significant contributions)

## Questions?

* Check [existing issues](https://github.com/space-code/snacker/issues)
* Search [discussions](https://github.com/space-code/snacker/discussions)
* Ask in [Q&A discussions](https://github.com/space-code/snacker/discussions/categories/q-a)
* Email the maintainer: nv3212@gmail.com

---

Thank you for contributing to Snacker! 🎉

Your efforts help make this project better for everyone.