//
//  EntryViewController.swift
//  Tasks
//
//  Created by 장재훈 on 2022/05/15.
//

import UIKit

class EntryViewController: UIViewController {
    @IBOutlet var field: UITextField!

    var update: (() -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()

        field.delegate = self

        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .done, target: self, action: #selector(saveTask))
    }

    // navigation bar 우측 버튼 클릭 이벤트
    @objc func saveTask() {
        // textfield 가 비어있진 않은지
        guard let text = field.text, !text.isEmpty
        else { return }
        
        guard let count = UserDefaults().value(forKey: "count") as? Int
        else { return }

        let newCount = count + 1
        UserDefaults().set(newCount, forKey: "count")
        UserDefaults().set(text, forKey: "task_\(newCount)")
        
        //  VC 에서 전달받은 update 메소드
        update?()
        
        // 메소드가 끝나면 화면 pop
        navigationController?.popViewController(animated: true)
    }
}

extension EntryViewController: UITextFieldDelegate {
    // sw 키보드의 return 버튼이 클릭되었을때 실행될 함수
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        saveTask()

        return true
    }
}
