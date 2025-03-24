//
// snacker
// Copyright © 2025 Space Code. All rights reserved.
//

import UIKit

public enum SnackbarAction {
    case snack(view: UIView, data: SnackbarData)
    case snackSingle(view: UIView, data: SnackbarData)
    case removeLast
    case removeAll
}
