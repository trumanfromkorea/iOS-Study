//
//  ViewController.swift
//  Anthill
//
//  Created by 장재훈 on 2022/06/14.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func navigateToSignUp(_ sender: Any) {
        let storyboard = UIStoryboard(name: SignUpViewController.storyboard, bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: SignUpViewController.identifier) as! SignUpViewController

        navigationController?.pushViewController(vc, animated: true)
    }
}
