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

    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var verifyPasswordTextField: UITextField!
    @IBOutlet weak var nicknameTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    @IBAction func onTappedDoneButton(_ sender: Any) {
    }
    
}
