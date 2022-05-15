//
//  WeatherTableViewCell.swift
//  MyWeather
//
//  Created by 장재훈 on 2022/05/16.
//

import UIKit

class WeatherTableViewCell: UITableViewCell {
    static let identifier = "WeatherTableViewCell"

    static func nib() -> UINib {
        return UINib(nibName: "WeatherTableViewCell", bundle: nil)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
