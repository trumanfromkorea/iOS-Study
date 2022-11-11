//
//  Coordinator.swift
//  CustomTabBar
//
//  Created by 장재훈 on 2022/11/10.
//

import Foundation

protocol Coordinator: AnyObject {
    var childCoordinator: [Coordinator] { get set }
    func start()
}
