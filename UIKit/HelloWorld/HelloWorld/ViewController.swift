//
//  ViewController.swift
//  HelloWorld
//
//  Created by 장재훈 on 2022/09/19.
//

import UIKit

class ViewController: UIViewController {
 
    @IBOutlet weak var stackView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        stackView.subviews.forEach { view in
            if let label = view as? UILabel {
                print(label.text ?? "X")
            }
        }
    }
 
}
