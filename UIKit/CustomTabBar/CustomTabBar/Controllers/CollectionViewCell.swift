//
//  CollectionViewCell.swift
//  CustomTabBar
//
//  Created by 장재훈 on 2022/11/14.
//

import UIKit

extension UICollectionViewCell {
    static var identifier: String {
        String(describing: self)
    }
}

class CollectionViewCell: UICollectionViewCell {
    @IBOutlet var imageView: UIImageView!
}
