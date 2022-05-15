//
//  ViewController.swift
//  CollectionCell
//
//  Created by 장재훈 on 2022/05/13.
//

import UIKit

/*
 - TableView
    - TableViewCell
        - CollectionView
            - CollectionViewCell
 */

class ViewController: UIViewController {
    @IBOutlet var table: UITableView!

    var models: [Model] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        // image 는 미리 Assets 에 추가
        models.append(Model(text: "First", imageName: "image_1"))
        models.append(Model(text: "Second", imageName: "image_2"))
        models.append(Model(text: "Third", imageName: "image_3"))
        models.append(Model(text: "Fourth", imageName: "image_4"))

        table.register(CollectionTableViewCell.nib(), forCellReuseIdentifier: CollectionTableViewCell.identifier)
        table.delegate = self
        table.dataSource = self
    }
}

extension ViewController: UITableViewDelegate {
    // tableView cell 크기
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250.0
    }
}

extension ViewController: UITableViewDataSource {
    // tableView cell 개수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }

    // tableView cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCell(withIdentifier: CollectionTableViewCell.identifier, for: indexPath) as! CollectionTableViewCell
        
        // CollectionView 에 models 배열 전달
        cell.configure(with: models)
        
        return cell
    }
}

// Model 인스턴스 (사진, 이미지 이름)
struct Model {
    let text: String
    let imageName: String

    init(text: String, imageName: String) {
        self.text = text
        self.imageName = imageName
    }
}
