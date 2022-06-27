//
//  ViewController.swift
//  RecordApp
//
//  Created by 장재훈 on 2022/06/27.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    let sampleList = ["test", "test2", "test34"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
    }

    @IBAction func onTappedRightBarButton(_ sender: Any) {
        let storyboard = UIStoryboard(name: RecordViewController.storyboard, bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: RecordViewController.identifier)
        
        present(vc, animated: true)
    }
    
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sampleList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: RecordCell.identifier, for: indexPath) as? RecordCell else {
            return UITableViewCell()
        }
        
        cell.configureCell(sampleList[indexPath.item])
        
        return cell
    }
}
