//
//  SignUpViewController.swift
//  Anthill
//
//  Created by 장재훈 on 2022/06/14.
//

import Alamofire
import UIKit

class SignUpViewController: UIViewController {
    static let identifier = "SignUpViewController"
    static let storyboard = "SignUp"

    @IBOutlet var idTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var verifyPasswordTextField: UITextField!
    @IBOutlet var nicknameTextField: UITextField!
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var phoneNumberTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func onTappedDoneButton(_ sender: Any) {
        signUpWithUserInfo()
    }

    func signUpWithUserInfo() {
        let param = [
            "userid": idTextField.text,
            "password": passwordTextField.text,
            "nickName": nicknameTextField.text,
            "name": nameTextField.text,
            "phoneNumber": phoneNumberTextField.text,
        ]

        AF.request(Server.url, method: .post, parameters: param as Parameters, encoding: JSONEncoding.default)
            .response { response in
                print(response.result)
            }
    }
}
