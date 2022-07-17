//
//  ServerModel.swift
//  WaterAppDemo
//
//  Created by 장재훈 on 2022/07/18.
//

import Foundation

protocol ServerService {
    static var serverURL: String { get }
    static var serviceKey: String { get }
}

struct ServerInfo {
    static var serverURL = "http://apis.data.go.kr/1480523/Dwqualityservice/getDrinkWaterTKAWY"
    static var serviceKey = "9pf41LSuG2XHOFg0ebOKNyhRH7DfqMevft4TT83j8jzWwI0qbodqkVfkFyOdimpCmqd8OuU1szNqKII%2FdZkPVg%3D%3D"
}
