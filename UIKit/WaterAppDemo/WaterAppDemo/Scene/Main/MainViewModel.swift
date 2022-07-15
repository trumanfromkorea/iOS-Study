//
//  MainViewModel.swift
//  WaterAppDemo
//
//  Created by 장재훈 on 2022/07/16.
//

import Foundation

class MainViewModel {
    private var networkManager: NetworkService!

    init(_ networkManager: NetworkService) {
        self.networkManager = networkManager
    }

    func getDataList() {
        let apiKey = "9pf41LSuG2XHOFg0ebOKNyhRH7DfqMevft4TT83j8jzWwI0qbodqkVfkFyOdimpCmqd8OuU1szNqKII%2FdZkPVg%3D%3D"
        
        let url = "http://apis.data.go.kr/1480523/Dwqualityservice/getDrinkWaterTKAWY?serviceKey=\(apiKey)&resultType=json"
        
        
        let queryParams: [String: Any] = [:]
//        [
//            "serviceKey": apiKey,
//            "resultType": "json",
//        ]
        
        let api = APIData(method: Method.get, url: url, queryParams: queryParams)

        networkManager.request(api: api)
    }
}
