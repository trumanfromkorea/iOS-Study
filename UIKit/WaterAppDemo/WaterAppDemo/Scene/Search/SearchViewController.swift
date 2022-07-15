//
//  SearchViewController.swift
//  WaterAppDemo
//
//  Created by 장재훈 on 2022/07/10.
//
import SnapKit
import UIKit

class SearchViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        configureViewSettings()
        configureLayout()
        configureSearchController()
    }
}

// MARK: - Initial Settings

extension SearchViewController {
    private func configureViewSettings() {
        self.title = "검색"
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
