//
//  Created by Artem Sokurenko on 24/09/2019
//  Copyright © 2019 Ronas IT. All rights reserved.
//

import UIKit.UICollectionView

public extension UICollectionView {
    convenience init(collectionViewLayout: UICollectionViewLayout) {
        self.init(frame: .zero, collectionViewLayout: collectionViewLayout)
    }

    func registerCellClass(_ cellClass: AnyClass) {
        register(cellClass, forCellWithReuseIdentifier: String(describing: cellClass))
    }

    func registerCellClasses(_ cellClasses: [AnyClass]) {
        cellClasses.forEach { registerCellClass($0) }
    }

    func registerCellClasses(_ cellClasses: AnyClass...) {
        cellClasses.forEach { registerCellClass($0) }
    }

    func registerHeaderViewClass(_ viewClass: AnyClass) {
        register(
            viewClass, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: String(describing: viewClass) + ".Header"
        )
    }

    func registerFooterViewClass(_ viewClass: AnyClass) {
        register(
            viewClass, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter,
            withReuseIdentifier: String(describing: viewClass) + ".Footer"
        )
    }

    func dequeueReusableCell<T: UICollectionViewCell>(for indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withReuseIdentifier: String(describing: T.self), for: indexPath) as? T else {
            fatalError("Unable to dequeue reusable cell for indexPath: \((indexPath.section, indexPath.item))")
        }
        return cell
    }

    func dequeueReusableHeaderView<T: UICollectionReusableView>(for indexPath: IndexPath) -> T {
        guard let view = dequeueReusableSupplementaryView(
            ofKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: String(describing: T.self) + ".Header",
            for: indexPath
        ) as? T else {
            fatalError("Unable to dequeue reusable header for indexPath: \((indexPath.section, indexPath.item))")
        }
        return view
    }

    func dequeueReusableFooterView<T: UICollectionReusableView>(for indexPath: IndexPath) -> T {
        guard let view = dequeueReusableSupplementaryView(
            ofKind: UICollectionView.elementKindSectionFooter,
            withReuseIdentifier: String(describing: T.self) + ".Footer",
            for: indexPath
        ) as? T else {
            fatalError("Unable to dequeue reusable footer for indexPath: \((indexPath.section, indexPath.item))")
        }
        return view
    }

    func reloadSection(_ section: Int, animationStyle: UITableView.RowAnimation) {
        reloadSections([section])
    }

    func deselectAllItems(animated: Bool) {
        indexPathsForSelectedItems?.forEach { deselectItem(at: $0, animated: animated) }
    }

    func scrollToLastItem(at position: UICollectionView.ScrollPosition = .bottom, animated: Bool) {
        guard numberOfSections > 0 else {
            return
        }

        let section = numberOfSections - 1
        let numberOfItems = self.numberOfItems(inSection: section)

        if numberOfItems == 0 {
            return
        }

        let indexPath = IndexPath(item: numberOfItems - 1, section: section)
        scrollToItem(at: indexPath, at: position, animated: animated)
    }
}
