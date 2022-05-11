//
//  ViewController.swift
//  MyGithub
//
//  Created by 장재훈 on 2022/05/09.
//

import Alamofire
import UIKit

class ViewController: UIViewController {
    var userData: User?

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func buttonTapped(_ sender: Any) {
        let url = GithubInfo.githubAPI + "/users/" + GithubInfo.myUsername

        AF.request(url, method: .get).response { response in
            let decoder = JSONDecoder()

            do {
                self.userData = try decoder.decode(User.self, from: response.data!)
                print(self.userData!)
            } catch let error {
                print(error)
            }
        }
    }

    @IBAction func authTestButton(_ sender: Any) {
        let scope = "repo,user"
        let urlString = GithubInfo.githubAPI + "/login/oauth/authorize?client_id=\(GithubInfo.githubAppClientID)&scope=\(scope)"

        if let url = URL(string: urlString), UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url)
        }
    }
}

struct User: Codable {
    let name: String
    let accountName: String
    let email: String?
    let blog: String?
    let avatarURL: String
    let followers: Int
    let following: Int
    let repoCount: Int

    enum CodingKeys: String, CodingKey {
        case name
        case accountName = "login"
        case email
        case blog
        case avatarURL = "avatar_url"
        case followers
        case following
        case repoCount = "public_repos"
    }
}
