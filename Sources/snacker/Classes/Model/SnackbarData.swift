//
// snacker
// Copyright © 2025 Space Code. All rights reserved.
//

import Foundation

public struct SnackbarData: Sendable {
    let snackbarAlignment: SnackbarAlignment
    let insets: SnackbarInsets
    let animationDuration: TimeInterval

    public init(
        snackbarAlignment: SnackbarAlignment = .bottom(spacing: 20.0),
        insets: SnackbarInsets = .zero,
        animationDuration: TimeInterval = 0.5
    ) {
        self.snackbarAlignment = snackbarAlignment
        self.insets = insets
        self.animationDuration = animationDuration
    }
}
