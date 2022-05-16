//
//  WeatherTableViewCell.swift
//  MyWeather
//
//  Created by 장재훈 on 2022/05/16.
//

import UIKit

class WeatherTableViewCell: UITableViewCell {
    @IBOutlet var minTempLabel: UILabel!
    @IBOutlet var maxTempLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!

    @IBOutlet var weatherImage: UIImageView!

    static let identifier = "WeatherTableViewCell"

    static func nib() -> UINib {
        return UINib(nibName: "WeatherTableViewCell", bundle: nil)
    }

    func configure(with model: WeatherResponse) {
        let kelvin = 273.15
        
        minTempLabel.text = "\(model.main.temp_min - kelvin)"
        maxTempLabel.text = "\(model.main.temp_max - kelvin)"

        dateLabel.text = getDayForDate(Date())
        weatherImage.image = UIImage(systemName: "sun.min.fill")
    }

    func getDayForDate(_ date: Date?) -> String {
        guard let inputDate = date
        else { return "" }

        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY-MM-dd"

        return formatter.string(from: inputDate)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = .gray
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
