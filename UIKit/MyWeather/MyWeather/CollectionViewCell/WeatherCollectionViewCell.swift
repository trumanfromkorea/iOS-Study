//
//  WeatherCollectionViewCell.swift
//  MyWeather
//
//  Created by 장재훈 on 2022/05/16.
//

import UIKit

class WeatherCollectionViewCell: UICollectionViewCell {
    @IBOutlet var iconImageView: UIImageView!
    @IBOutlet var tempLabel: UILabel!

    static let identifier = "WeatherCollectionViewCell"

    // data 받아와서 넣어주기
    func configure(with model: Hourly) {
        tempLabel.text = "\((model.temp - 273.15).rounded())"

        iconImageView.contentMode = .scaleAspectFit
        iconImageView.image = UIImage(systemName: "sun.max.fill")?.withRenderingMode(.alwaysOriginal)
    }

    static func nib() -> UINib {
        return UINib(nibName: "WeatherCollectionViewCell", bundle: nil)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
