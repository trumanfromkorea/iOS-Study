//
//  ViewController.swift
//  DelegatePattern
//
//  Created by 장재훈 on 2022/07/01.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var tableView: UITableView!

    let sampleData = [Data]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // tableView 의 dataSource 를 담당하는건 ViewController 자신
        tableView.dataSource = self
    }
}

// UITableViewDataSource 프로토콜을 채택, 필수 메소드 구현
extension ViewController: UITableViewDataSource {
    // TableView 에 나타날 행 (데이터) 의 개수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sampleData.count
    }
    
    // TableView 에 나타낼 Cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MyCell.identifier, for: indexPath) as? MyCell else {
            return UITableViewCell()
        }
        
        cell.configure(sampleData[indexPath.item])
        
        return cell
    }
}
