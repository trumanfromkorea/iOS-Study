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
}

struct APIData: API {
    var method: Method
    var url: String
}

extension APIData {
    mutating func setQueryParams(_ queryParams: [String: Any]) {
        guard !queryParams.isEmpty else {
            return
        }
        
        self.url += "?"
        
        for (key, val) in queryParams {
            self.url += "\(key)=\(val)&"
        }
        
        self.url.removeLast()
    }
}
