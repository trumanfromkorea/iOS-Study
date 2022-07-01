//
//  ViewController.swift
//  JsonTestApp
//
//  Created by 장재훈 on 2022/07/01.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        parseData()
    }
    
    func loadData() -> Data? {
        let fileName: String = "sample"
        
        guard let asset = NSDataAsset.init(name: fileName) else {
            return nil
        }
        
        return asset.data
    }
    
    func parseData() {
        let data = loadData()
        
        do {
            guard let data = data else {
                return
            }
            
            let foodList = try JSONDecoder().decode(FoodList.self, from: data)
            print(foodList)
        } catch {
            print(error)
        }
    }


}

