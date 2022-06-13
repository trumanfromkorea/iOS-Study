//
//  SignUpViewController.swift
//  Anthill
//
//  Created by 장재훈 on 2022/06/14.
//

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
        
    }
}
