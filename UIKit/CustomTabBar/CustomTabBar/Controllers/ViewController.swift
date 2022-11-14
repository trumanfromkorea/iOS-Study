//
//  ViewController.swift
//  CustomTabBar
//
//  Created by 장재훈 on 2022/11/10.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate {
    @IBOutlet var collectionView: UICollectionView!

    var collectionViewItems: [String] = (1 ... 9).map { String($0) }

    private var dataSource: UICollectionViewDiffableDataSource<Section, String>!

    private enum Section {
        case main
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.collectionViewLayout = collectionViewLayout()

        configureDataSource()
        configureSnapShot()
    }
}

extension ViewController {
    private func configureDataSource() {
        dataSource = UICollectionViewDiffableDataSource<Section, String>(collectionView: collectionView, cellProvider: { collectionView, indexPath, itemIdentifier in
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.identifier, for: indexPath) as? CollectionViewCell else {
                return UICollectionViewCell()
            }

            cell.imageView.contentMode = .scaleToFill
            cell.imageView.image = UIImage(named: itemIdentifier)

            return cell
        })
    }

    private func configureSnapShot() {
        var snapshot = NSDiffableDataSourceSnapshot<Section, String>()
        snapshot.appendSections([.main])
        snapshot.appendItems(collectionViewItems, toSection: .main)
        dataSource.apply(snapshot)
    }

    private func collectionViewLayout() -> UICollectionViewCompositionalLayout {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.8), heightDimension: .fractionalHeight(1))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])

        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPagingCentered
        section.interGroupSpacing = 20

        section.visibleItemsInvalidationHandler = { _, offset, env in

            let rawValue = offset.x / (env.container.contentSize.width - 40)
            let index = Int(rawValue.rounded(.up))
            let indexPath = IndexPath(item: index, section: 0)

            guard let cell = self.collectionView.cellForItem(at: indexPath) as? CollectionViewCell else {
                return
            }

            UIView.animate(withDuration: 0.5, delay: 0) {
                self.view.backgroundColor = cell.imageView.image?.averageColor
            }
        }

        let layout = UICollectionViewCompositionalLayout(section: section)

        return layout
    }
}
