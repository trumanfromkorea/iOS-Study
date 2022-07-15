//
//  APIManager.swift
//  WaterAppDemo
//
//  Created by 장재훈 on 2022/07/16.
//

import Foundation

protocol API {
    var method: Method { get }
    var url: String { get }
    var queryParams: [String: Any] { get }
}

struct APIData: API {
    var method: Method
    var url: String
    var queryParams: [String : Any]
}
