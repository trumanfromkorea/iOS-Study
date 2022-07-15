//
//  WaterData.swift
//  WaterAppDemo
//
//  Created by 장재훈 on 2022/07/13.
//

import Foundation

struct WaterData: Codable {
    var name: String
    var inspectionAgency: String
    var sampleDate: String
    
    enum CodingKeys: String, CodingKey {
        case name = "ENTPRS_NM"
        case inspectionAgency = "CHCK_INSTT"
        case sampleDate = "WTRSMPLE_DE"
    }
}
