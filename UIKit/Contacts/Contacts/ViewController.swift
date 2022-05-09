//
//  ViewController.swift
//  Contacts
//
//  Created by 장재훈 on 2022/05/09.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var tableView: UITableView!

    let names = ["Jaehoon", "Jaehyun", "Bongho"]

    override func viewDidLoad() {
        super.viewDidLoad()

        // UITableViewDelegate 와 UITableDataSource 를 이용하여 메소드 구현 (Delegate Pattern)
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension ViewController: UITableViewDelegate {
    // cell item 터치 이벤트
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("tapped item")
    }
}

extension ViewController: UITableViewDataSource {
    // section 개수
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    // row 개수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }

    // cell 지정
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 계속 cell 을 재사용하여 렌더링하기 위함이라고 생각됨
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        // indexPath 를 이용해 1:1 매핑 가능
        cell.textLabel?.text = names[indexPath.row]

        return cell
    }
}
