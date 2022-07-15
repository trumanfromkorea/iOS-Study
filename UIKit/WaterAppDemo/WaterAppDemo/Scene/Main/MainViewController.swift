//
//  ViewController.swift
//  WaterAppDemo
//
//  Created by 장재훈 on 2022/07/09.
//

import SnapKit
import UIKit

class MainViewController: UIViewController {
    private var mainCollectionView: UICollectionView!
    private var viewModel = MainViewModel(NetworkManager.shared)

    var dataSource: UICollectionViewDiffableDataSource<Section, Item>!
    typealias Item = Int
    enum Section {
        case main
    }

    private let waterList = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

    lazy var searchButton = UIBarButtonItem(image: UIImage(systemName: "magnifyingglass"), style: .plain, target: self, action: #selector(onTappedSearchButton(_:)))

    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel.getDataList()

        configureViewSettings()
        configureLayout()
        configureCollectionView()
    }
}

extension MainViewController {
    private func configureViewSettings() {
        view.backgroundColor = .systemBackground

        title = "목록"

        navigationItem.rightBarButtonItem = searchButton
    }

    private func configureLayout() {
        mainCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())
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

extension MainViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let viewController = DetailsViewController()
        navigationController?.pushViewController(viewController, animated: true)
    }
}

extension MainViewController {
    private func configureCollectionView() {
        mainCollectionView.delegate = self

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
        let viewController = SearchViewController()
        navigationController?.pushViewController(viewController, animated: true)
    }
}
