//
//  Created by Dmitry Frishbuter on 07.04.2020
//  Copyright © 2020 Ronas IT. All rights reserved.
//

import UIKit

public extension UIView {
    convenience init(color: UIColor) {
        self.init()
        self.backgroundColor = color
    }

    func roundCorners(_ corners: UIRectCorner = .allCorners, radius: CGFloat) {
        let maskPath = UIBezierPath(
            roundedRect: bounds,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: radius, height: radius)
        )
        let maskLayer = CAShapeLayer()
        maskLayer.frame = bounds
        maskLayer.path = maskPath.cgPath
        layer.mask = maskLayer
    }

    func addSubviews(_ subviews: [UIView]) {
        subviews.forEach(self.addSubview)
    }

    func addSubviews(_ subviews: UIView...) {
        subviews.forEach(self.addSubview)
    }

    func insertSubviews(_ views: [UIView], aboveSubview: UIView) {
        views.forEach { view in
            insertSubview(view, aboveSubview: aboveSubview)
        }
    }

    func insertSubviews(_ views: [UIView], belowSubview: UIView) {
        views.forEach { view in
            insertSubview(view, belowSubview: belowSubview)
        }
    }

    func removeSubview(_ subview: UIView) {
        guard subview.superview === self else {
            return
        }
        subview.removeFromSuperview()
    }

    func removeSubviews(_ subviews: [UIView]) {
        subviews.forEach(self.removeSubview)
    }

    func removeAllSubviews() {
        removeSubviews(subviews)
    }

    func findSubview(withAccessibilityLabel accessibilityLabel: String) -> UIView? {
        let targetViews = subviews
            .compactMap { view -> UIView? in
                if view.accessibilityLabel == accessibilityLabel {
                    return view
                }
                return view.findSubview(withAccessibilityLabel: accessibilityLabel)
            }
        return targetViews.first
    }

    func layout() {
        setNeedsLayout()
        layoutIfNeeded()
    }

    static func layoutAnimated(
        _ view: UIView,
        withDuration duration: TimeInterval,
        delay: TimeInterval = 0,
        animationOptions: UIView.AnimationOptions = [],
        completion: ((Bool) -> Void)? = nil
    ) {
        view.setNeedsLayout()
        UIView.animate(
            withDuration: duration,
            delay: delay,
            options: animationOptions,
            animations: { [weak view] in
                view?.layoutIfNeeded()
            },
            completion: completion
        )
    }

    func containsLocation(of touch: UITouch) -> Bool {
        return bounds.contains(touch.location(in: self))
    }

    func loopDescendantViews(_ closure: (_ subView: UIView) -> Void) {
        for view in subviews {
            closure(view)
            view.loopDescendantViews(closure)
        }
    }
}

public extension Collection where Element: UIView {
    func removeFromSuperview() {
        forEach { $0.removeFromSuperview() }
    }

    func setAlpha(_ alpha: CGFloat) {
        forEach { $0.alpha = alpha }
    }
}
