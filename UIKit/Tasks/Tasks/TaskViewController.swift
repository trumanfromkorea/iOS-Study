//
//  TaskViewController.swift
//  Tasks
//
//  Created by 장재훈 on 2022/05/15.
//

import UIKit

class TaskViewController: UIViewController {
    @IBOutlet var label: UILabel!

    var task: String?
    var currentPosition: Int?
    var update: (() -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()

        label.text = task

        // navigation bar 우측 버튼 -> #selector 개념 공부
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Delete", style: .done, target: self, action: #selector(deleteTask))
    }
    
    // 삭제 메소드
    @objc func deleteTask() {
        guard let count = UserDefaults().value(forKey: "count") as? Int
        else { return }

        let startIndex = currentPosition!
        
        // 인덱스 밀어주기
        if startIndex < count {
            for i in startIndex + 1 ... count {
                let value = UserDefaults().value(forKey: "task_\(i)")
                UserDefaults().setValue(value, forKey: "task_\(i - 1)")
            }
        }
        
        // 전체 길이 줄이기
        UserDefaults().setValue(nil, forKey: "task_\(count)")
        UserDefaults().setValue(count - 1, forKey: "count")

        update?()

        navigationController?.popViewController(animated: true)
    }
}
