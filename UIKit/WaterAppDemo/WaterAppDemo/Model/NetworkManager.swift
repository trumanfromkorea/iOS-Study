//
//  NetworkManager.swift
//  WaterAppDemo
//
//  Created by 장재훈 on 2022/07/15.
//

import Alamofire
import Foundation

enum Method {
    case get
    case post
}

protocol NetworkService {
    func request(api: API)
    func getRequest(_ api: API)
    func postRequest()
}

class NetworkManager: NetworkService {
    static let shared = NetworkManager()

    private init() {}

    func request(api: API) {
        switch api.method {
        case .get:
            getRequest(api)
        case .post:
            postRequest()
        }
    }

    func getRequest(_ api: API) {
        AF.request(api.url, method: .get, parameters: api.queryParams)
            .validate()
            .responseData { response in
                switch response.result {
                case .success:
                    self.parseResponseData(response.data)
                case let .failure(error):
                    print(">> GET ERROR : \(error)")
                }
            }
    }

    func parseResponseData(_ data: Data?) {
        guard let data = data else {
            return
        }

        var responseData: ResponseData?

        do {
            responseData = try JSONDecoder().decode(ResponseData.self, from: data)
        } catch let error {
            print(">> DECODE ERROR : \(error)")
        }

        print(responseData)
    }

    func postRequest() {
        print("post request")
    }
}
