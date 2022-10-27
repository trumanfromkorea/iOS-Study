//
//  ViewController.swift
//  MyFirstRx
//
//  Created by 장재훈 on 2022/10/26.
//

import RxCocoa
import RxSwift
import UIKit

class ViewController: UIViewController {
    private var viewModel = ViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

class ViewModel {
    var users = BehaviorSubject(value: [User]())
    
    func fetchUsers() {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else {
            return
        }
        let task = URLSession.shared.dataTask(with: url) { data , response , error in
            guard let data else {
                return
            }
            
            do {
                let responseData = try JSONDecoder().decode([User].self, from: data)
                self.users.on(.next(responseData))
            } catch {
                print(error.localizedDescription)
            }
            
        }
        task.resume()
    }
}

//

struct User: Codable {
    let userID, id: Int
    let title, body: String

    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case id, title, body
    }
}
