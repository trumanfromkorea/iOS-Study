//
//  ViewController.swift
//  ToDoList
//
//  Created by 장재훈 on 2022/05/09.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    // TableView 선언
    private let table: UITableView = {
        let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")

        return table
    }()
    
    var items: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 디바이스 저장값 확인 및 초기화
        self.items = UserDefaults.standard.stringArray(forKey: "items") ?? []

        // navigation title
        title = "To Do List"

        // table view 삽입
        view.addSubview(table)
        table.dataSource = self

        // navigation 오른쪽 버튼 추가
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(didTapAdd))
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        table.frame = view.bounds
    }

    // navigation 오른쪽 버튼 클릭 이벤트
    @objc private func didTapAdd() {
        // alert 창 띄우기
        let alert = UIAlertController(title: "New Item", message: "Enter your ToDoList Item", preferredStyle: .alert)

        // textField 추가
        alert.addTextField { field in
            field.placeholder = "Enter Item"
        }
        // 취소버튼, 완료버튼 추가
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "Done", style: .default, handler: { [weak self] _ in
            // textField 입력값 가져오기
            if let field = alert.textFields?.first {
                if let text = field.text, !text.isEmpty {
                    // 새로운 아이템 추가
                    DispatchQueue.main.async {
                        // 디바이스에 값 저장
                        var currentItems = UserDefaults.standard.stringArray(forKey: "items") ?? []
                        currentItems.append(text)
                        UserDefaults.standard.setValue(currentItems, forKey: "items")
                        
                        // 리스트에 값 추가 후 reload
                        self?.items.append(text)
                        self?.table.reloadData()
                    }
                    
                }
            }
        }))

        present(alert, animated: true)
    }

    // MARK: - UITableViewDataSource 구현 메소드

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = items[indexPath.row]
        
        return cell
    }
}
