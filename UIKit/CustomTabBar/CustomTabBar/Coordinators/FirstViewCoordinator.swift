//
//  FirstViewCoordinator.swift
//  CustomTabBar
//
//  Created by 장재훈 on 2022/11/10.
//

import UIKit

class FirstViewCoordinator: Coordinator {
    weak var parentCoordinator: Coordinator?
    var childCoordinator: [Coordinator] = []
    var navigationController: UINavigationController?
    
    init() {
        self.navigationController = .init()
    }
    
    func start () {}
    
//    func startPush() -> UINavigationController {
//        let firstViewController = ViewController()
//        firstViewController.delegate = self
//
//        navigationController?.setViewControllers([firstViewController], animated: false)
//
//        return navigationController
//    }
}
