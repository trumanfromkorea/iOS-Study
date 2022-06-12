//
//  StopTimerViewController.swift
//  StudyTimer
//
//  Created by 장재훈 on 2022/06/09.
//

import UIKit

class StopTimerViewController: UIViewController {
    static let identifier = "StopTimerViewController"
    static let storyboard = "StopTimerView"

    let ratingList = ["😞", "😊", "😆"]

    var dataSource: UICollectionViewDiffableDataSource<Section, Item>!
    typealias Item = String
    enum Section {
        case main
    }

    @IBOutlet var studyContentsTextView: UITextField!
    @IBOutlet var fromListButton: UIButton!
    @IBOutlet var ratingCollectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()

        ratingCollectionView.delegate = self

        configureStates()
        configureCollectionView()
    }

    @IBAction func onTappedFromList(_ sender: Any) {
        print("목록에서 선택하기")
    }

    @IBAction func onTappedDoneButton(_ sender: Any) {
        let viewControllers: [UIViewController] = navigationController!.viewControllers as [UIViewController]

        navigationController?.popToViewController(viewControllers[viewControllers.count - 3], animated: true)
    }

    private func configureStates() {
        navigationItem.hidesBackButton = true

        fromListButton.layer.cornerRadius = 15
        fromListButton.backgroundColor = Theme.supplementColor2.withAlphaComponent(0.5)
        fromListButton.titleLabel?.textColor = Theme.mainColor
        fromListButton.tintColor = Theme.mainColor
    }
}

extension StopTimerViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("something")
    }

    private func configureCollectionView() {
        dataSource = UICollectionViewDiffableDataSource<Section, Item>(collectionView: ratingCollectionView, cellProvider: { _, indexPath, itemIdentifier in
            guard let cell = self.ratingCollectionView.dequeueReusableCell(withReuseIdentifier: RatingCell.identifier, for: indexPath) as? RatingCell else {
                return nil
            }
            cell.configure(itemIdentifier)
            return cell
        })

        var snapshot = NSDiffableDataSourceSnapshot<Section, Item>()
        snapshot.appendSections([.main])
        snapshot.appendItems(ratingList, toSection: .main)
        dataSource.apply(snapshot)

        ratingCollectionView.collectionViewLayout = layout()
    }

    private func layout() -> UICollectionViewCompositionalLayout {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.33), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalWidth(0.33))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 3)

        let section = NSCollectionLayoutSection(group: group)

        let layout = UICollectionViewCompositionalLayout(section: section)

        return layout
    }
}
