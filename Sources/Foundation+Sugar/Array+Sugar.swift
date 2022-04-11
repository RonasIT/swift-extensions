//
//  Created by Anton Dityativ on 05.11.2020
//  Copyright © 2020 Ronas IT. All rights reserved.
//

import Foundation

public extension Array where Element: Equatable {
    subscript (safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }

    subscript (safe range: ClosedRange<Int>) -> [Element] {
        return Array<Int>(range).compactMap { index -> Element? in // swiftlint:disable:this syntactic_sugar
            return indices.contains(index) ? self[index] : nil
        }
    }

    mutating func append(_ elements: Element...) {
        elements.forEach { append($0) }
    }

    mutating func append(_ elements: [Element]) {
        elements.forEach { append($0) }
    }

    var unique: [Element] {
        var uniqueElements: [Element] = []
        forEach { item in
            if !uniqueElements.contains(item) {
                uniqueElements += [item]
            }
        }
        return uniqueElements
    }

    func index(of element: Element) -> Int? {
        return firstIndex { item -> Bool in
            return item == element
        }
    }

    mutating func remove(_ element: Element) {
        if let index = firstIndex(where: { evaluated in
            return evaluated == element
        }) {
            remove(at: index)
        }
    }

    mutating func removeElements(_ elements: Element...) {
        elements.forEach { element in
            remove(element)
        }
    }

    func removingDuplicatedElements() -> [Element] {
        var result = [Element]()
        forEach { item in
            if !result.contains(item) {
                result.append(item)
            }
        }
        return result
    }
}

public extension Sequence {
    func group<U: Hashable>(by key: (Iterator.Element) -> U) -> [U: [Iterator.Element]] {
        return .init(grouping: self, by: key)
    }
}
