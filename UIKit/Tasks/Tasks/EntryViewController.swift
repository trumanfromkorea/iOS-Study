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

    @objc func saveTask() {
        guard let text = field.text, !text.isEmpty
        else { return }

        guard let count = UserDefaults().value(forKey: "count") as? Int
        else { return }

        let newCount = count + 1
        UserDefaults().set(newCount, forKey: "count")
        UserDefaults().set(text, forKey: "task_\(newCount)")
        
        update?()
        
        navigationController?.popViewController(animated: true)
    }
}

extension EntryViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        saveTask()

        return true
    }
}
