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

    func getDataList(completion: @escaping (Result<ResponseData, CustomNetworkError>) -> Void) {
        let queryParams: [String: Any] = [
            "serviceKey": ServerInfo.serviceKey,
            "resultType": "json",
        ]

        var api = APIData(method: Method.get, url: ServerInfo.serverURL)
        api.setQueryParams(queryParams)

        networkManager.request(api: api) { result in
            switch result {
            case let .success(responseData):
                completion(.success(responseData))
            case let .failure(error):
                completion(.failure(error))
            }
        }
    }
}
