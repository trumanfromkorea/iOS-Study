//
//  SignInViewController.swift
//  StudyTimer
//
//  Created by 장재훈 on 2022/06/16.
//

import UIKit

class SignInViewController: UIViewController {
    static let identifier = "SignInViewController"
    static let storyboard = "AuthView"

    @IBOutlet var emailField: UITextField!
    @IBOutlet var passwordField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        passwordField.isSecureTextEntry = true
    }

    @IBAction func onTappedSignUpButton(_ sender: Any) {
        let storyboard = UIStoryboard(name: SignUpViewController.storyboard, bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: SignUpViewController.identifier) as! SignUpViewController
        navigationController?.pushViewController(vc, animated: true)
    }
}
