//
//  MyCollectionViewCell.swift
//  Collection
//
//  Created by 장재훈 on 2022/05/10.
//

import UIKit

class MyCollectionViewCell: UICollectionViewCell {
    @IBOutlet var imageView: UIImageView!

    // identifier 지정해주고 사용할 수 있음
    static let identifier = "MyCollectionViewCell"

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    // 이미지 연결
    public func configure(with image: UIImage) {
        imageView.image = image
    }

    static func nib() -> UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
}
