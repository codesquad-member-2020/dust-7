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
        case observations = "responseMessage"
    }
}

struct DustObservation: Decodable {
    
    let time: String
    let grade: String
    let concentration: String
    
    enum CodingKeys: String, CodingKey {
        case time = "dataTime"
        case grade = "pm10Grade"
        case concentration = "pm10Value"
    }
}
