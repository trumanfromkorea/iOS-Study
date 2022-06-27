//
//  ViewController.swift
//  RecordApp
//
//  Created by 장재훈 on 2022/06/27.
//

import AVFoundation
import FirebaseStorage
import UIKit

class ViewController: UIViewController {
    @IBOutlet var tableView: UITableView!

    var dataList = [AudioCellItem]()
    var urlItem: AVURLAsset!
    let fileFormat = ".m4a"

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        getData()
    }

    @IBAction func onTappedRightBarButton(_ sender: Any) {
        let storyboard = UIStoryboard(name: RecordViewController.storyboard, bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: RecordViewController.identifier) as! RecordViewController

        present(vc, animated: true)
    }

    private func getData() {
        let storageReference = Storage.storage().reference().child("audio")
        storageReference.listAll { result, error in
            if let error = error {
                print("get data error \(error)")
                return
            }

            guard let result = result else { return }

            for prefixItem in result.prefixes {
                print("prefix: \(prefixItem)")
            }

            for item in result.items {
                let fileName = item.name.components(separatedBy: self.fileFormat).first!

                let split = fileName.split(separator: "+")
                let duration = AudioModel.durationString(Int(split[1])!)

                let newItem = AudioCellItem(title: String(split[0]), duration: duration)
                self.dataList.append(newItem)
            }
            self.tableView.reloadData()
        }
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("selected")
        let storyboard = UIStoryboard(name: PlayViewController.storyboard, bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: PlayViewController.identifier) as! PlayViewController

        vc.audioFile = dataList[indexPath.item]

        present(vc, animated: true)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: AudioCell.identifier, for: indexPath) as? AudioCell else {
            return UITableViewCell()
        }

        cell.configureCell(dataList[indexPath.item])

        return cell
    }
}
