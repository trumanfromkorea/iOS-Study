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
        configureSearchController()
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

    private func configureSearchController() {
        let searchController = UISearchController(searchResultsController: nil)
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.searchResultsUpdater = self
        searchController.searchBar.delegate = self
        searchController.searchBar.placeholder = "검색어 입력"
        
        navigationItem.searchController = searchController
    }
}

// MARK: - Search Controller

extension SearchViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        print("update results")
    }
}

extension SearchViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        print(searchBar.text)
    }
}
