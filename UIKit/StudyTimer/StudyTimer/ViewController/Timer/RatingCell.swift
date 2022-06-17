//
//  RatingCell.swift
//  StudyTimer
//
//  Created by 장재훈 on 2022/06/11.
//

import UIKit

class RatingCell: UICollectionViewCell {
    static let identifier = "RatingCell"

    @IBOutlet var emojiLabel: UILabel!

    override var isSelected: Bool {
        didSet {
            if isSelected {
                contentView.backgroundColor = .gray
            } else {
                contentView.backgroundColor = .white
            }
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()

        let cornerRadius = frame.size.width / 2

        // Apply rounded corners to contentView
        contentView.layer.cornerRadius = cornerRadius
        contentView.layer.masksToBounds = true

        // Set masks to bounds to false to avoid the shadow
        // from being clipped to the corner radius
        layer.cornerRadius = cornerRadius
        layer.masksToBounds = false
    }

    func configure(_ label: String) {
        emojiLabel.text = label
    }
}
