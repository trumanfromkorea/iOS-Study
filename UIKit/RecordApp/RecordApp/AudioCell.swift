//
//  RecordCell.swift
//  RecordApp
//
//  Created by 장재훈 on 2022/06/27.
//

import UIKit

class AudioCell: UITableViewCell {
    
    static let identifier = "AudioCell"
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configureCell(_ item: AudioCellItem) {
        titleLabel.text = item.title
        durationLabel.text = item.duration
    }

}
