//
//  Created by Dmitry Frishbuter on 10/03/2019
//  Copyright © 2019 Ronas IT. All rights reserved.
//

import UIKit

public extension CGSize {

    func inset(by insets: UIEdgeInsets) -> CGSize {
        return CGSize(
            width: width - insets.left - insets.right,
            height: height - insets.top - insets.bottom
        )
    }

    static func - (size: CGSize, insets: UIEdgeInsets) -> CGSize {
        var size = size
        size.height -= insets.topAndBottom
        size.width -= insets.leftAndRight
        return size
    }

    static func + (size: CGSize, insets: UIEdgeInsets) -> CGSize {
        var size = size
        size.height += insets.topAndBottom
        size.width += insets.leftAndRight
        return size
    }

    init<W: CGFloatCovertible, H: CGFloatCovertible>(_ width: W, _ height: H) {
        self = CGSize(width: width.cgFloatValue, height: height.cgFloatValue)
    }

    static func - (lhs: CGSize, rhs: CGSize) -> CGSize {
        return CGSize(width: lhs.width - rhs.width, height: lhs.height - rhs.height)
    }

    static func * (lhs: CGSize, rhs: CGSize) -> CGSize {
        return CGSize(width: lhs.width * rhs.width, height: lhs.height * rhs.height)
    }

    static func * (lhs: CGSize, rhs: CGFloat) -> CGSize {
        return CGSize(width: lhs.width * rhs, height: lhs.height * rhs)
    }

    static func / (lhs: CGSize, rhs: CGSize) -> CGSize {
        return CGSize(width: lhs.width / rhs.width, height: lhs.height / rhs.height)
    }

    static func / (lhs: CGSize, rhs: CGFloat) -> CGSize {
        return CGSize(width: lhs.width / rhs, height: lhs.height / rhs)
    }
}

public protocol CGFloatCovertible {
    var cgFloatValue: CGFloat { get }
}

extension CGFloat: CGFloatCovertible {
    public var cgFloatValue: CGFloat { return self }
}

extension Float: CGFloatCovertible {
    public var cgFloatValue: CGFloat { return CGFloat(self) }
}

extension Double: CGFloatCovertible {
    public var cgFloatValue: CGFloat { return CGFloat(self) }
}

extension Int: CGFloatCovertible {
    public var cgFloatValue: CGFloat { return CGFloat(self) }
}
