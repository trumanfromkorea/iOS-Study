//
//  ViewController.swift
//  TableViewApp
//
//  Created by 장재훈 on 2022/07/01.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var tableView: UITableView!

    let dataList = Food.menu
    let foodTypes = FoodType.allCases

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
    }
}

extension ViewController: UITableViewDataSource {
    
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return dataList.count
//    }
//
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let foodType = foodTypes[section]

        return dataList[foodType]?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier, for: indexPath) as? CustomTableViewCell else {
            return UITableViewCell()
        }

        let type = foodTypes[indexPath.section]

        guard let section = dataList[type] else {
            return UITableViewCell()
        }

        cell.configure(section[indexPath.row])

        return cell
    }
//
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        let foodType = foodTypes[section]
//
//        return foodType.rawValue
//    }
}
