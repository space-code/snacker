//
// snacker
// Copyright © 2025 Space Code. All rights reserved.
//

import Foundation

public struct SnackbarInsets: Sendable {
    public static let zero = SnackbarInsets(leading: .zero, trailing: .zero)

    let leading: CGFloat
    let trailing: CGFloat

    public init(leading: CGFloat, trailing: CGFloat) {
        self.leading = leading
        self.trailing = trailing
    }
}
