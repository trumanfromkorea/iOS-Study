//
//  CollectionTableViewCell.swift
//  CollectionCell
//
//  Created by 장재훈 on 2022/05/13.
//

import UIKit

class CollectionTableViewCell: UITableViewCell {
    // MARK: - Variables

    static let identifier = "CollectionTableViewCell"

    @IBOutlet var collectionView: UICollectionView!

    var models: [Model] = []
    
    // MARK: - Methods
    
    // creating nib
    static func nib() -> UINib {
        return UINib(nibName: "CollectionTableViewCell", bundle: nil)
    }

    // models 에 값 넣어주기
    func configure(with models: [Model]) {
        self.models = models
        collectionView.reloadData()
    }
    
    // MARK: - Overrides
    
    override func awakeFromNib() {
        super.awakeFromNib()

        collectionView.register(MyCollectionViewCell.nib(), forCellWithReuseIdentifier: MyCollectionViewCell.identifier)
        collectionView.delegate = self
        collectionView.dataSource = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

extension CollectionTableViewCell: UICollectionViewDataSource {
    // CollectionView Cell 개수
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return models.count
    }

    // CollectionView Cell 리턴
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyCollectionViewCell.identifier, for: indexPath) as! MyCollectionViewCell
        
        // CollectionView Cell 에 객체 정보 넘겨줌
        cell.configure(with: models[indexPath.row])

        return cell
    }
}

extension CollectionTableViewCell: UICollectionViewDelegateFlowLayout {
    // size 정해주기
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 250, height: 250)
    }
}
