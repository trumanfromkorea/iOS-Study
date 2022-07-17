//
//  CustomNetworkError.swift
//  WaterAppDemo
//
//  Created by 장재훈 on 2022/07/18.
//

import Foundation

enum CustomNetworkError: Error {
    case failGetData
    case failParseData
    case emptyData

    var description: String {
        switch self {
        case .failGetData:
            return "데이터 가져오기 에러"
        case .failParseData:
            return "데이터 파싱 에러"
        case .emptyData:
            return "유효하지 않은 데이터"
        }
    }
}
