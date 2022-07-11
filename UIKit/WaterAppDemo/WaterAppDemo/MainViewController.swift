//
//  ViewController.swift
//  WaterAppDemo
//
//  Created by 장재훈 on 2022/07/09.
//

import Inject
import UIKit

class MainViewController: UIViewController {

    lazy var searchButton = UIBarButtonItem(image: UIImage(systemName: "magnifyingglass"), style: .plain, target: self, action: #selector(onTappedSearchButton(_:)))


   

    init() {
        super.init(nibName: nil, bundle: nil)

        configureViewSettings()
        configureLayout()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        print("required init for: coder")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}

extension MainViewController {
    private func configureViewSettings() {
        view.backgroundColor = .systemBackground

        title = "생수 목록"

        navigationItem.rightBarButtonItem = searchButton
    }

    private func configureLayout() {
    }
}

// MARK: - Button Handler

extension MainViewController {
    @objc private func onTappedSearchButton(_ sender: UIBarButtonItem) {
        let viewController = Inject.ViewControllerHost(SearchViewController())
        navigationController?.pushViewController(viewController, animated: true)
    }
}
