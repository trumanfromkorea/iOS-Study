//
//  CustomNavigationController.swift
//  WaterAppDemo
//
//  Created by 장재훈 on 2022/07/09.
//

import UIKit

class CustomNavigationController: UINavigationController {

    override init(rootViewController: UIViewController) {
        super.init(rootViewController: rootViewController)

        configureNavigationBar()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureNavigationBar() {
        self.navigationBar.topItem?.backButtonTitle = ""
        self.navigationBar.tintColor = .label
    }

}
