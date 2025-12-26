//
// snacker
// Copyright © 2025 Space Code. All rights reserved.
//

import UIKit

// MARK: - ISnacker

@MainActor
public protocol ISnacker {
    func action(_ action: SnackbarAction, container: UIView)
}

// MARK: - Snacker

@MainActor
public final class Snacker {
    // MARK: Properties

    public static let shared: ISnacker = Snacker()

    private var cachedViews: [Int: [SnackbarController]] = [:]

    // MARK: Initialization

    private init() {}

    // MARK: Private

    private func save(controller: SnackbarController, id: Int) {
        if var views = cachedViews[id] {
            views.append(controller)
            cachedViews[id] = views
        } else {
            cachedViews[id] = [controller]
        }
    }

    private func remove(controller: SnackbarController, id: Int) {
        controller.hide(animated: true) { [weak self] in
            guard let index = self?.cachedViews[id]?.firstIndex(of: controller) else {
                return
            }
            self?.cachedViews[id]?.remove(at: index)
        }
    }

    private func makeController(
        for view: UIView,
        inContainerView containerView: UIView,
        data: SnackbarData
    ) -> SnackbarController {
        let controller = SnackbarController(
            contentView: view,
            containerView: containerView,
            alignment: data.snackbarAlignment,
            insets: data.insets
        )
        return controller
    }
}

// MARK: ISnacker

extension Snacker: ISnacker {
    // swiftlint:disable:next function_body_length
    public func action(_ action: SnackbarAction, container: UIView) {
        let hash = container.hash

        switch action {
        case let .snack(view, data):
            let controller = makeController(
                for: view,
                inContainerView: container,
                data: data
            )
            save(controller: controller, id: hash)

            DispatchQueue.main.async { controller.show(animated: true) }

            DispatchQueue.main.asyncAfter(deadline: .now() + data.animationDuration) { [weak self] in
                self?.remove(controller: controller, id: hash)
            }
        case let .snackSingle(view, data) where (cachedViews[hash] ?? []).isEmpty:
            let controller = makeController(
                for: view,
                inContainerView: container,
                data: data
            )
            save(controller: controller, id: hash)

            DispatchQueue.main.async { controller.show(animated: true) }

            DispatchQueue.main.asyncAfter(deadline: .now() + data.animationDuration) { [weak self] in
                self?.remove(controller: controller, id: hash)
            }
        case .removeLast:
            if let controller = cachedViews[hash]?.last {
                remove(controller: controller, id: hash)
            }
        case .removeAll:
            for item in cachedViews[hash] ?? [] {
                remove(controller: item, id: hash)
            }
        default:
            break
        }
    }
}
