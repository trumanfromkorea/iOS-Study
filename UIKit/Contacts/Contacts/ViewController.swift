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

        // custom cell 을 이용하기 위함
        let nib = UINib(nibName: "DemoTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "DemoTableViewCell")

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
        let cell = tableView.dequeueReusableCell(withIdentifier: "DemoTableViewCell", for: indexPath) as! DemoTableViewCell
        // 해당 cell 은 casting 해줘야함 (연결을 위해서인듯)
        
        // custome cell 의 IBOutlet 에 연결
        cell.myLabel.text = names[indexPath.row]
        cell.myImageView.backgroundColor = .blue
        
        return cell
    }
}
