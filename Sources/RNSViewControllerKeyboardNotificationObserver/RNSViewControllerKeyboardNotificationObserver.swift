//
//  Created by Dmitry Frishbuter on 02/09/2019
//  Copyright © 2019 2019 98 Training Pty Limited. All rights reserved.
//

import UIKit

// Wrapper for keyboard notification data
public final class KeyboardNotification {
    public let duration: TimeInterval
    public let animationCurve: UIView.AnimationOptions
    public let endFrame: CGRect

    fileprivate init?(notification: NSNotification) {
        guard let userInfo = notification.userInfo,
              let endFrame = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue,
              let duration = (userInfo[UIResponder.keyboardAnimationDurationUserInfoKey] as? NSNumber)?.doubleValue,
              let animationCurveRaw = (userInfo[UIResponder.keyboardAnimationCurveUserInfoKey] as? NSNumber)?.uintValue else {
            return nil
        }
        self.endFrame = endFrame
        self.duration = duration
        self.animationCurve = UIView.AnimationOptions(rawValue: animationCurveRaw)
    }
}

public protocol KeyboardNotificationObserver {
    func keyboardWillChangeFrame(with notification: KeyboardNotification)
    func keyboardWillShow(with notification: KeyboardNotification)
    func keyboardDidShow(with notification: KeyboardNotification)
    func keyboardWillHide(with notification: KeyboardNotification)
    func keyboardDidHide(with notification: KeyboardNotification)
}

public extension KeyboardNotificationObserver {
    func keyboardWillChangeFrame(with notification: KeyboardNotification) {}
    func keyboardWillShow(with notification: KeyboardNotification) {}
    func keyboardDidShow(with notification: KeyboardNotification) {}
    func keyboardWillHide(with notification: KeyboardNotification) {}
    func keyboardDidHide(with notification: KeyboardNotification) {}
}

// Extension for handy subscriptions to keyboard notifications
public extension UIViewController {
    func startObservingNotifications(_ name: NSNotification.Name, selector: Selector, object: Any? = nil) {
        NotificationCenter.default.addObserver(self, selector: selector, name: name, object: object)
    }

    func endObservingNotifications(_ name: NSNotification.Name, object: Any? = nil) {
        NotificationCenter.default.removeObserver(self, name: name, object: object)
    }

    func removeNotificationObserver() {
        NotificationCenter.default.removeObserver(self)
    }

    func startObservingKeyboardWillChangeFrameNotifications() {
        startObservingNotifications(
            UIResponder.keyboardWillChangeFrameNotification,
            selector: #selector(keyboardWillChangeFrameNotificationReceived)
        )
    }

    func startObservingKeyboardWillShowNotifications() {
        startObservingNotifications(UIResponder.keyboardWillShowNotification, selector: #selector(keyboardWillShowNotificationReceived))
    }

    func startObservingKeyboardDidShowNotifications() {
        startObservingNotifications(UIResponder.keyboardDidShowNotification, selector: #selector(keyboardDidShowNotificationReceived))
    }

    func startObservingKeyboardWillHideNotifications() {
        startObservingNotifications(UIResponder.keyboardWillHideNotification, selector: #selector(keyboardWillHideNotificationReceived))
    }

    func startObservingKeyboardDidHideNotifications() {
        startObservingNotifications(UIResponder.keyboardDidHideNotification, selector: #selector(keyboardDidHideNotificationReceived))
    }

    func endObservingKeyboardWillChangeFrameNotifications() {
        endObservingNotifications(UIResponder.keyboardWillChangeFrameNotification)
    }

    func endObservingKeyboardWillShowNotifications() {
        endObservingNotifications(UIResponder.keyboardWillShowNotification)
    }

    func endObservingKeyboardDidShowNotifications() {
        endObservingNotifications(UIResponder.keyboardDidShowNotification)
    }

    func endObservingKeyboardWillHideNotifications() {
        endObservingNotifications(UIResponder.keyboardWillHideNotification)
    }

    func endObservingKeyboardDidHideNotifications() {
        endObservingNotifications(UIResponder.keyboardDidHideNotification)
    }

    @objc func keyboardWillChangeFrameNotificationReceived(_ notification: NSNotification) {
        guard let notification = KeyboardNotification(notification: notification) else {
            return
        }
        if let observer = self as? KeyboardNotificationObserver {
            observer.keyboardWillChangeFrame(with: notification)
        }
    }

    @objc func keyboardDidShowNotificationReceived(_ notification: NSNotification) {
        guard let notification = KeyboardNotification(notification: notification) else {
            return
        }
        if let observer = self as? KeyboardNotificationObserver {
            observer.keyboardDidShow(with: notification)
        }
    }

    @objc func keyboardWillShowNotificationReceived(_ notification: NSNotification) {
        guard let notification = KeyboardNotification(notification: notification) else {
            return
        }
        if let observer = self as? KeyboardNotificationObserver {
            observer.keyboardWillShow(with: notification)
        }
    }

    @objc func keyboardWillHideNotificationReceived(_ notification: NSNotification) {
        guard let notification = KeyboardNotification(notification: notification) else {
            return
        }
        if let observer = self as? KeyboardNotificationObserver {
            observer.keyboardWillHide(with: notification)
        }
    }

    @objc func keyboardDidHideNotificationReceived(_ notification: NSNotification) {
        guard let notification = KeyboardNotification(notification: notification) else {
            return
        }
        if let observer = self as? KeyboardNotificationObserver {
            observer.keyboardDidHide(with: notification)
        }
    }
}
