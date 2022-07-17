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
    func request(api: API, completion: @escaping (Result<ResponseData, CustomNetworkError>) -> Void)
    func getRequest(_ api: API, completion: @escaping (Result<ResponseData, CustomNetworkError>) -> Void)
    func postRequest()
}

// 네트워크 요청 담당 싱글톤 인스턴스
class NetworkManager: NetworkService {
    static let shared = NetworkManager()

    private init() {}

    // Request type 판별 후 요청하는 메소드
    func request(api: API, completion: @escaping (Result<ResponseData, CustomNetworkError>) -> Void) {
        if api.method == .get {
            getRequest(api) { result in
                switch result {
                case let .success(responseData):
                    completion(.success(responseData))
                case let .failure(error):
                    completion(.failure(error))
                }
            }
        } else if api.method == .post {
            postRequest()
        }
    }

    // Get request 전송하는 메소드
    func getRequest(_ api: API, completion: @escaping (Result<ResponseData, CustomNetworkError>) -> Void) {
        AF.request(api.url, method: .get)
            .validate()
            .responseData { response in
                guard let data = response.data else {
                    completion(.failure(.failGetData))
                    return
                }

                var responseData: ResponseData?

                do {
                    responseData = try JSONDecoder().decode(ResponseData.self, from: data)
                } catch {
                    print("test2")
                    completion(.failure(.failParseData))
                }

                if let responseData = responseData {
                    completion(.success(responseData))
                }
            }
    }

    // Post request 전송하는 메소드
    func postRequest() {
        print("empty post request executed")
    }
}
