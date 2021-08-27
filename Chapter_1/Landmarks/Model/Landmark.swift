//
//  Landmark.swift
//  Landmarks
//
//  Created by 박성수 on 2021/08/27.
//

import Foundation
import SwiftUI
import CoreLocation

// 구조체, json, dict 랑 닮았음
struct Landmark: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var park: String
    var state: String
    var description: String
    
    // read the name of the image from the data
    private var imageName: String
    var image: Image {
        Image(imageName)
    }
    
    // latitude & longitude
    private var coordinates: Coordinates
    
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude
        )
    }
    
    struct Coordinates: Hashable, Codable {
        var latitude: Double
        var longitude: Double
    }
}
