//
//  SearchViewController.swift
//  WaterAppDemo
//
//  Created by 장재훈 on 2022/07/10.
//

import UIKit

class SearchViewController: UIViewController {
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

extension SearchViewController {
    private func configureViewSettings() {
        title = "검색"
        view.backgroundColor = .systemBackground
    }

    private func configureLayout() {
    }
}
