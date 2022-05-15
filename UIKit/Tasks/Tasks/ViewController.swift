//
//  ViewController.swift
//  Tasks
//
//  Created by 장재훈 on 2022/05/15.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var tableView: UITableView!

    var tasks: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self

        // Setup

        if !UserDefaults().bool(forKey: "setup") {
            UserDefaults().set(true, forKey: "setup")
            UserDefaults().set(0, forKey: "count")
        }

        // Get all saved tasks
        updateTasks()
    }

    func updateTasks() {
        tasks.removeAll()

        guard let count = UserDefaults().value(forKey: "count") as? Int
        else { return }

        for x in 0 ..< count {
            if let task = UserDefaults().value(forKey: "task_\(x + 1)") as? String {
                tasks.append(task)
            }
        }

        tableView.reloadData()
    }

    @IBAction func didTapAdd(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "entry") as! EntryViewController
        vc.title = "New Task"
        vc.update = {
            DispatchQueue.main.async {
                self.updateTasks()
            }
        }
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "task") as! TaskViewController
        vc.title = "Task"
        vc.task = tasks[indexPath.row]
        
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        cell.textLabel?.text = tasks[indexPath.row]

        return cell
    }
}
