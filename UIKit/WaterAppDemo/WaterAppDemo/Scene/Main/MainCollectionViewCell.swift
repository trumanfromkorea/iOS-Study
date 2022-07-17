//
//  MainCollectionViewCell.swift
//  WaterAppDemo
//
//  Created by 장재훈 on 2022/07/13.
//

import SnapKit
import UIKit

class MainCollectionViewCell: UICollectionViewCell {
    static let identifier = "MainCollectionViewCell"

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 17, weight: .semibold)

        return label
    }()

    private let inspectionLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15, weight: .medium)

        return label
    }()

    private let dateLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 13, weight: .medium)
        label.textColor = .secondaryLabel

        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: .zero)
        configureLayout()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    func configureCell(_ cellData: WaterData) {
        contentView.backgroundColor = .secondarySystemBackground

        titleLabel.text = cellData.name
        inspectionLabel.text = cellData.inspectionAgency
        dateLabel.text = cellData.sampleDate
    }

    private func configureLayout() {
        [titleLabel, inspectionLabel, dateLabel].forEach {
            self.contentView.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }

        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(self.contentView)
            make.leading.equalTo(10)
            make.trailing.equalTo(-10)
        }

        inspectionLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp_bottomMargin).offset(5)
            make.leading.equalTo(10)
            make.trailing.equalTo(-10)
        }

        dateLabel.snp.makeConstraints { make in
            make.top.equalTo(inspectionLabel.snp_bottomMargin).offset(5)
            make.leading.equalTo(10)
            make.trailing.equalTo(-10)
        }
    }
}
