//
//  NetworkManager.swift
//  WaterAppDemo
//
//  Created by 장재훈 on 2022/07/15.
//

import Foundation

enum Method {
    case get
    case post
}

protocol API {
    var urlComponent: URLComponents { get }
    var method: Method { get }
}

class NetworkManager {
    static let shared = NetworkManager()

    private init() {}

    func request(api: API) {
        switch api.method {
        case .get:
            getRequest(api.urlComponent)
        case .post:
            postRequest()
        }
    }
    
    private func getRequest(_ urlComponent: URLComponents) {
        
    }
    
    private func postRequest() {
        
    }
}
