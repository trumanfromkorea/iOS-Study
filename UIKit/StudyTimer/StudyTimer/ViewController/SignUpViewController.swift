//
//  SignUpViewController.swift
//  StudyTimer
//
//  Created by 장재훈 on 2022/06/16.
//

import FirebaseAuth
import UIKit

class SignUpViewController: UIViewController {
    static let identifier = "SignUpViewController"
    static let storyboard = "AuthView"

    var handle: AuthStateDidChangeListenerHandle?

    @IBOutlet var emailField: UITextField!
    @IBOutlet var passwordField: UITextField!
    @IBOutlet var confirmPasswordField: UITextField!
    @IBOutlet weak var confirmPasswordLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        passwordField.addTarget(self, action: #selector(passwordFieldListener(_:)), for: .editingChanged)
        confirmPasswordField.addTarget(self, action: #selector(passwordFieldListener(_:)), for: .editingChanged)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)

//        handle = Auth.auth().addStateDidChangeListener({ auth, user in
//          // user state event listener
//        })
    }

    @IBAction func onTappedDoneButton(_ sender: Any) {
        validateInput()
    }
    
    @objc func passwordFieldListener(_ sender: Any?) {
        if passwordField.text == confirmPasswordField.text {
            confirmPasswordLabel.text = ""
        } else {
            confirmPasswordLabel.text = "비밀번호가 일치하지 않습니다"
            confirmPasswordLabel.textColor = .red
        }
    }

    private func validateInput() {
        if emailField.text == nil || passwordField == nil || confirmPasswordField == nil {
            return
        }

        if !Validation.email(emailField.text!) {
            print("invalid email")

        } else if !Validation.password(passwordField.text!) {
            print("invalid password")
        } else if passwordField.text != confirmPasswordField.text {
            print("password incorrect")
        } else {
            Auth.auth().createUser(withEmail: emailField.text!, password: passwordField.text!) { authResult, error in
                if let error = error {
                    print(">> FB Auth Error : \(error)")
                    return
                }
                
                print(authResult?.additionalUserInfo!)
            }
        }
    }
}