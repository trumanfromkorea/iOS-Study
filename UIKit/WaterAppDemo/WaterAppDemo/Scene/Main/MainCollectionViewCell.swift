//
//  MainCollectionViewCell.swift
//  WaterAppDemo
//
//  Created by 장재훈 on 2022/07/13.
//

import UIKit

class MainCollectionViewCell: UICollectionViewCell {
    static let identifier = "MainCollectionViewCell"

    override init(frame: CGRect) {
        super.init(frame: .zero)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    func configureCell() {
        self.contentView.backgroundColor = .secondarySystemBackground
    }

    private func configureLayout() {
    }
}
