//
//  ViewController.swift
//  DelegatePattern
//
//  Created by 장재훈 on 2022/07/01.
//

import UIKit

class ViewController: UIViewController, CodaDelegate {
    @IBOutlet var countLabel: UILabel!

    var count = 0

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func increment() {
        count += 1
        countLabel.text = "\(count)"
    }

    @IBAction func onTappedModalButton(_ sender: Any) {
        let storyboard = UIStoryboard(name: ModalViewController.storyboard, bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: ModalViewController.identifier) as! ModalViewController

        vc.delegate = self

        present(vc, animated: true)
    }
}
