//
//  DustStatusResponse.swift
//  Dust
//
//  Created by Chaewan Park on 2020/04/01.
//  Copyright © 2020 Chaewan Park. All rights reserved.
//

import Foundation

struct DustStatusResponse: Decodable {
    let observations: [DustObservation]
    
    enum CodingKeys: String, CodingKey {
        case observations = "items"
    }
}

struct DustObservation: Decodable {
    
    let time: Date
    let amount: Int
    let grade: Int
    
    enum CodingKeys: String, CodingKey {
        case time = "dataTime"
        case amount = "pm10Value"
        case grade = "pm10Grade1h"
    }
}
