//
//  CustomTableViewCell.swift
//  TableViewApp
//
//  Created by 장재훈 on 2022/07/01.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    static let identifier = "CustomTableViewCell"

    @IBOutlet var cellImageView: UIImageView!
    @IBOutlet var cellTitleLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configure(_ item: Food) {
        cellImageView.image = UIImage(systemName: "circle")
        cellTitleLabel.text = item.name
    }
}

