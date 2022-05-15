//
//  MyCollectionViewCell.swift
//  CollectionCell
//
//  Created by 장재훈 on 2022/05/13.
//

import UIKit

class MyCollectionViewCell: UICollectionViewCell {
    // MARK: - Variables

    @IBOutlet var myLabel: UILabel!
    @IBOutlet var myImageView: UIImageView!

    static let identifier = "MyCollectionViewCell"

    // MARK: - Methods
    
    static func nib() -> UINib {
        return UINib(nibName: "MyCollectionViewCell", bundle: nil)
    }
    
    // cell 내부 요소들 설정
    public func configure(with model: Model) {
        myLabel.text = model.text
        myImageView.image = UIImage(named: model.imageName)
        myImageView.contentMode = .scaleAspectFill
    }

    // MARK: - Overrides

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}
