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

    // 디바이스 저장소에서 데이터 가져오기
    func updateTasks() {
        tasks.removeAll()

        guard let count = UserDefaults().value(forKey: "count") as? Int
        else { return }

        for x in 0 ..< count {
            if let task = UserDefaults().value(forKey: "task_\(x + 1)") as? String {
                tasks.append(task)
            }
        }

        // 데이터 가져온 후 tableView 업데이트
        tableView.reloadData()
    }

    @IBAction func didTapAdd(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "entry") as! EntryViewController
        vc.title = "New Task"
        
        // 옮겨진 VC 로 데이터 업데이트하는 메소드 넘겨줌
        vc.update = {
            DispatchQueue.main.async {
                self.updateTasks()
            }
        }
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension ViewController: UITableViewDelegate {
    // TableView cell 을 터치했을때 일어나는 이벤트
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        // 이동하고 싶은 ViewController 의 인스턴스와 identifier 이용
        let vc = storyboard?.instantiateViewController(withIdentifier: "task") as! TaskViewController
        vc.title = "Task" // 이동할 View 의 title
        
        // 이동하는 VC 의 프로퍼티 접근
        vc.task = tasks[indexPath.row]
        vc.currentPosition = indexPath.row + 1
        vc.update = {
            DispatchQueue.main.async {
                self.updateTasks()
            }
        }
        
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
