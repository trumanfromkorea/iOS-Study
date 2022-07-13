//
//  ViewController.swift
//  WaterAppDemo
//
//  Created by 장재훈 on 2022/07/09.
//

import Inject
import SnapKit
import UIKit

class MainViewController: UIViewController {
    private var mainCollectionView: MainCollectionView!

    var dataSource: UICollectionViewDiffableDataSource<Section, Item>!
    typealias Item = Int
    enum Section {
        case main
    }

    private let waterList = WaterData.list

    lazy var searchButton = UIBarButtonItem(image: UIImage(systemName: "magnifyingglass"), style: .plain, target: self, action: #selector(onTappedSearchButton(_:)))

    init() {
        super.init(nibName: nil, bundle: nil)

        configureViewSettings()
        configureLayout()
        configureCollectionView()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        print("required init for: coder")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}

extension MainViewController {
    private func configureViewSettings() {
        view.backgroundColor = .systemBackground

        title = "생수 목록"

        navigationItem.rightBarButtonItem = searchButton
    }

    private func configureLayout() {
        mainCollectionView = MainCollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())
        mainCollectionView.translatesAutoresizingMaskIntoConstraints = false
        mainCollectionView.backgroundColor = .systemBackground

        view.addSubview(mainCollectionView)

        mainCollectionView.snp.makeConstraints { make in
            make.height.equalTo(self.view)
            make.leading.equalTo(20)
            make.trailing.equalTo(-20)
        }
    }
}

// MARK: - CollectionView {

extension MainViewController {
    private func configureCollectionView() {
        mainCollectionView.register(MainCollectionViewCell.self, forCellWithReuseIdentifier: MainCollectionViewCell.identifier)
        mainCollectionView.showsVerticalScrollIndicator = false

        dataSource = UICollectionViewDiffableDataSource<Section, Item>(collectionView: mainCollectionView, cellProvider: { _, indexPath, _ in
            guard let cell = self.mainCollectionView.dequeueReusableCell(withReuseIdentifier: MainCollectionViewCell.identifier, for: indexPath) as? MainCollectionViewCell else {
                return nil
            }

            cell.configureCell()

            return cell
        })

        applySectionItems(waterList)

        mainCollectionView.collectionViewLayout = collectionViewLayout()
    }

    private func applySectionItems(_ items: [Item], to section: Section = .main) {
        var snapshot = NSDiffableDataSourceSnapshot<Section, Item>()
        snapshot.appendSections([section])
        snapshot.appendItems(items, toSection: section)
        dataSource.apply(snapshot)
    }

    private func collectionViewLayout() -> UICollectionViewCompositionalLayout {
        let spacing: CGFloat = 10
        // Item
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalWidth(0.33))
        let itemLayout = NSCollectionLayoutItem(layoutSize: itemSize)

        // Group
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalWidth(0.33))
        let groupLayout = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: itemLayout, count: 1)
        groupLayout.interItemSpacing = .fixed(spacing)

        // Section
        let section = NSCollectionLayoutSection(group: groupLayout)
        section.interGroupSpacing = spacing

        return UICollectionViewCompositionalLayout(section: section)
    }
}

// MARK: - Button Handler

extension MainViewController {
    @objc private func onTappedSearchButton(_ sender: UIBarButtonItem) {
        let viewController = Inject.ViewControllerHost(SearchViewController())
        navigationController?.pushViewController(viewController, animated: true)
    }
}
