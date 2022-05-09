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

    override func viewDidLoad() {
        super.viewDidLoad()

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
        alert.addAction(UIAlertAction(title: "Done", style: .default, handler: { _ in
            // textField 입력값 가져오기
            if let field = alert.textFields?.first {
                if let text = field.text, !text.isEmpty {
                    // 새로운 아이템 추가
                    print(text)
                }
            }
        }))

        present(alert, animated: true)
    }

    // MARK: - UITableViewDataSource 구현 메소드

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        return cell
    }
}
