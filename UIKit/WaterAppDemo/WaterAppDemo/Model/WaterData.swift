//
//  WaterData.swift
//  WaterAppDemo
//
//  Created by 장재훈 on 2022/07/13.
//

import Foundation

struct ResponseData: Codable {
    var getDrinkWaterTKAWY: TKAWY
}

struct TKAWY: Codable {
    var header: WaterHeader
    var rows: Int?
    var numOfRows: Int
    var pageNo: Int
    var totalCount: Int
    var item: [WaterData]
}

struct WaterHeader: Codable {
    var code: String
    var message: String
}

struct WaterData: Codable, Hashable {
    var name: String
    var inspectionAgency: String
    var sampleDate: String

    enum CodingKeys: String, CodingKey {
        case name = "ENTRPS_NM"
        case inspectionAgency = "CHCK_INSTT"
        case sampleDate = "TKAWY_DE"
    }
}
