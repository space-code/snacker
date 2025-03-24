//
// snacker
// Copyright © 2025 Space Code. All rights reserved.
//

import UIKit

// MARK: - SnackbarController

@MainActor
final class SnackbarController: NSObject {
    // MARK: Properties

    private let contentView: UIView
    private weak var containerView: UIView!
    private let alignment: SnackbarAlignment
    private let insets: SnackbarInsets

    private var disabledConstraints: [NSLayoutConstraint] = []
    private var activeConstraints: [NSLayoutConstraint] = []

    // MARK: Initialization

    init(
        contentView: UIView,
        containerView: UIView,
        alignment: SnackbarAlignment,
        insets: SnackbarInsets
    ) {
        self.contentView = contentView
        self.containerView = containerView
        self.alignment = alignment
        self.insets = insets
    }

    // MARK: Private

    private func staticConstraints() -> [NSLayoutConstraint] {
        [
            contentView.leadingAnchor.constraint(greaterThanOrEqualTo: containerView.leadingAnchor, constant: insets.leading),
            containerView.trailingAnchor.constraint(greaterThanOrEqualTo: contentView.trailingAnchor, constant: insets.trailing),
            contentView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
        ]
    }

    private func activeConstraints(contentView: UIView, container: UIView) -> [NSLayoutConstraint] {
        switch alignment {
        case let .top(spacing):
            [
                contentView.topAnchor.constraint(
                    equalTo: container.safeAreaLayoutGuide.topAnchor,
                    constant: spacing
                ),
            ]
        case let .bottom(spacing):
            [
                contentView.bottomAnchor.constraint(
                    equalTo: container.safeAreaLayoutGuide.bottomAnchor,
                    constant: -1 * spacing
                ),
            ]
        }
    }

    private func disabledConstraints(contentView: UIView, container: UIView) -> [NSLayoutConstraint] {
        switch alignment {
        case .top:
            [
                contentView.bottomAnchor.constraint(equalTo: container.topAnchor),
            ]
        case .bottom:
            [
                contentView.topAnchor.constraint(equalTo: container.bottomAnchor),
            ]
        }
    }
}

extension SnackbarController {
    func show(animated: Bool, completion: (() -> Void)? = nil) {
        contentView.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(contentView)

        let baseConstraints = staticConstraints()

        disabledConstraints = disabledConstraints(contentView: contentView, container: containerView)
        activeConstraints = activeConstraints(contentView: contentView, container: containerView)

        NSLayoutConstraint.activate(baseConstraints)

        if animated {
            NSLayoutConstraint.activate(disabledConstraints)
            containerView.layoutIfNeeded()

            UIView.animate(
                withDuration: 0.5,
                delay: .zero,
                options: .curveEaseInOut,
                animations: { [weak self] in
                    guard let self else {
                        return
                    }
                    NSLayoutConstraint.deactivate(self.disabledConstraints)
                    NSLayoutConstraint.activate(self.activeConstraints)
                    self.containerView.layoutIfNeeded()
                },
                completion: { _ in
                    completion?()
                }
            )
        } else {
            NSLayoutConstraint.activate(activeConstraints)
            completion?()
        }
    }

    func hide(animated: Bool, completion: (() -> Void)? = nil) {
        NSLayoutConstraint.deactivate(activeConstraints)
        containerView.layoutIfNeeded()

        if animated {
            UIView.animate(
                withDuration: 0.5,
                delay: .zero,
                options: .curveEaseInOut,
                animations: { [weak self] in
                    guard let self else {
                        return
                    }
                    NSLayoutConstraint.activate(self.disabledConstraints)
                    self.containerView.layoutIfNeeded()
                },
                completion: { [weak self] _ in
                    self?.contentView.removeFromSuperview()
                    self?.containerView = nil
                    completion?()
                }
            )
        } else {
            contentView.removeFromSuperview()
            containerView = nil
            completion?()
        }
    }
}
