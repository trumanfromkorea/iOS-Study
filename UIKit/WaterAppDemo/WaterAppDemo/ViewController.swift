//
//  ViewController.swift
//  WaterAppDemo
//
//  Created by 장재훈 on 2022/07/09.
//

import Inject
import UIKit

class ViewController: UIViewController {
    let button: UIButton = {
        let button = UIButton()
        button.setImage(systemName: "play.fill", state: .normal)
        button.tintColor = .label

        button.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)

        return button
    }()

    @objc func buttonTapped(_ sender: UIButton) {
        let viewController = Inject.ViewControllerHost(SecondViewController())
        self.navigationController?.pushViewController(viewController, animated: true)
    }

    init() {
        super.init(nibName: nil, bundle: nil)

        view.backgroundColor = .systemBackground
        view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.widthAnchor.constraint(equalToConstant: 40).isActive = true
        button.heightAnchor.constraint(equalToConstant: 40).isActive = true
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        button.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        print("coder")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}

class SecondViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .blue
    }
}

extension UIButton {
    func setImage(systemName: String, state: UIControl.State) {
        contentHorizontalAlignment = .fill
        contentVerticalAlignment = .fill

        imageView?.contentMode = .scaleAspectFit

        setImage(UIImage(systemName: systemName), for: state)
    }
}
