//
//  SignInViewController.swift
//  StudyTimer
//
//  Created by 장재훈 on 2022/06/16.
//

import UIKit
import FirebaseAuth

class SignInViewController: UIViewController {
    static let identifier = "SignInViewController"
    static let storyboard = "AuthView"

    @IBOutlet var emailField: UITextField!
    @IBOutlet var passwordField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        passwordField.isSecureTextEntry = true
    }
    
    @IBAction func onTappedSignInButton(_ sender: Any) {
        validateInput()
    }
    
    @IBAction func onTappedSignUpButton(_ sender: Any) {
        let storyboard = UIStoryboard(name: SignUpViewController.storyboard, bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: SignUpViewController.identifier) as! SignUpViewController
        navigationController?.pushViewController(vc, animated: true)
    }
    
    private func validateInput() {
        if !Validation.email(emailField.text) {
            print("Invalid Email")
        } else if !Validation.password(passwordField.text) {
            print("비밀번호는 8자리 이상 영어 숫자 조합")
        } else {
            Auth.auth().signIn(withEmail: emailField.text!, password: passwordField.text!) { _, error in
                if let error = error {
                    print(">> FB Sign In Error : \(error)")
                } else {
                    print("Sign In Complete")
                }
            }
        }
    }
}
