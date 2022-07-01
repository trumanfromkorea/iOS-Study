//
//  Food.swift
//  TableViewApp
//
//  Created by 장재훈 on 2022/07/01.
//

import Foundation

enum FoodType: String, CaseIterable {
    case American
    case Chinese
    case Korean
    case Japanese
}

struct Food {
    let name: String
    var price: Int
}

extension Food {
    static let menu: [FoodType: [Food]] = [
        .American: [
            Food(name: "햄버거", price: 5000),
            Food(name: "피자", price: 18000),
            Food(name: "아메리카노", price: 41000),
        ],
        .Chinese: [
            Food(name: "탕수육", price: 18000),
        ],
        .Korean: [
            Food(name: "비빔밥", price: 8000),
            Food(name: "돼지갈비", price: 20000),
        ],
        .Japanese: [
            Food(name: "스시", price: 20000),
            Food(name: "스윙스(돈까스)", price: 5000),
        ],
    ]
}
