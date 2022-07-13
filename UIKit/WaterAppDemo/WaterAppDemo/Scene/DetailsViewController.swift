//
//  DetailsViewController.swift
//  WaterAppDemo
//
//  Created by 장재훈 on 2022/07/10.
//

import UIKit

class DetailsViewController: UIViewController {
    init() {
        super.init(nibName: nil, bundle: nil)

        configureViewSettings()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        print("required init for: coder")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// MARK: - Initial Settings

extension DetailsViewController {
    private func configureViewSettings() {
        title = "상세 정보"
        view.backgroundColor = .systemBackground
    }

    private func configureLayout() {
    }
}
