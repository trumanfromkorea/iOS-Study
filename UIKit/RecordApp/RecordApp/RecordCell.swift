//
//  RecordCell.swift
//  RecordApp
//
//  Created by 장재훈 on 2022/06/27.
//

import UIKit

class RecordCell: UITableViewCell {
    
    static let identifier = "RecordCell"
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(_ title: String) {
        
    }

}
