//
//  FoodModel.swift
//  JsonTestApp
//
//  Created by 장재훈 on 2022/07/01.
//

import Foundation

struct FoodList: Codable {
    var foods: [Food]
}

struct Food: Codable {
    var name: String
    var price: Int
}
