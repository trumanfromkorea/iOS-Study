//
//  ViewController.swift
//  StackViewTest
//
//  Created by 장재훈 on 2022/06/26.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var collectionView: UICollectionView!

    @IBOutlet var collectionViewHeight: NSLayoutConstraint!

    let sampleData = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24]

    var dataSource: UICollectionViewDiffableDataSource<Section, Item>!

    typealias Item = Int
    enum Section {
        case main
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configureCollectionView()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        let height = collectionView.collectionViewLayout.collectionViewContentSize.height
        if height != CGFloat(0.0) {
            collectionViewHeight.constant = height
            view.layoutIfNeeded()
        }
        
    }

    func configureCollectionView() {
        dataSource = UICollectionViewDiffableDataSource<Section, Item>(collectionView: collectionView, cellProvider: { _, indexPath, _ in
            guard let cell = self.collectionView.dequeueReusableCell(withReuseIdentifier: MyCell.identifier, for: indexPath) as? MyCell else {
                return nil
            }

            return cell
        })

        var snapshot = NSDiffableDataSourceSnapshot<Section, Item>()
        snapshot.appendSections([.main])
        snapshot.appendItems(sampleData, toSection: .main)
        dataSource.apply(snapshot)

        collectionView.collectionViewLayout = layout()
    }

    private func layout() -> UICollectionViewCompositionalLayout {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.3), heightDimension: .fractionalWidth(0.3))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 1, bottom: 0, trailing: 1)

        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalWidth(0.3))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 3)

        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 1

        let layout = UICollectionViewCompositionalLayout(section: section)

        return layout
    }
}
