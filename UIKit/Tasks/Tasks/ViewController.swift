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

        // Get all saved tasks

        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
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
