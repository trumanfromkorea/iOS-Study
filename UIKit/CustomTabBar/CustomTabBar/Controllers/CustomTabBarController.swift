//
//  File.swift
//  CustomTabBarVC
//
//  Created by 장재훈 on 2022/11/10.
//

import UIKit

class CustomTabBarController: UITabBarController, UITabBarControllerDelegate {
    let buttonSize: CGFloat = 50

    override func viewDidLoad() {
        super.viewDidLoad()

        delegate = self

        setUpPlusButton()
    }

    private func setUpPlusButton() {
        let buttonFrame = CGRect(
            x: view.bounds.width / 2 - buttonSize / 2,
            y: -(buttonSize / 2),
            width: buttonSize,
            height: buttonSize
        )

        let button = UIButton(frame: buttonFrame)
        button.setBackgroundImage(UIImage(systemName: "plus.circle.fill"), for: .normal)
        button.addTarget(self, action: #selector(plusButtonTapped(_:)), for: .touchUpInside)

        tabBar.addSubview(button)
    }

    @objc func plusButtonTapped(_ sender: UIButton) {
        print("hello")
    }
}
