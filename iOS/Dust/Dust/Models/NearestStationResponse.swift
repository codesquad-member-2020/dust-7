//
//  NearestStationResponse.swift
//  Dust
//
//  Created by Chaewan Park on 2020/03/30.
//  Copyright © 2020 Chaewan Park. All rights reserved.
//

import Foundation

struct NearestStationResponse: Decodable {
    let nearestStation: [Station]
    
    enum CodingKeys: String, CodingKey {
        case nearestStation = "message"
    }
    
    var name: String {
        return nearestStation.first?.name ?? ""
    }
}

struct Station: Decodable {
    let name: String
    
    enum CodingKeys: String, CodingKey {
        case name = "stationName"
    }
}
