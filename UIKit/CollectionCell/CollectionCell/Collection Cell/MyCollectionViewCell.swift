//
//  MyCollectionViewCell.swift
//  CollectionCell
//
//  Created by 장재훈 on 2022/05/13.
//

import UIKit

class MyCollectionViewCell: UICollectionViewCell {
    @IBOutlet var myLabel: UILabel!
    @IBOutlet var myImageView: UIImageView!

    static let identifier = "MyCollectionViewCell"
    static func nib() -> UINib {
        return UINib(nibName: "MyCollectionViewCell", bundle: nil)
    }

    public func configure(with model: Model) {
        self.myLabel.text = model.text
        self.myImageView.image = UIImage(named: model.imageName)
        self.myImageView.contentMode = .scaleAspectFill
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}
