//
//  ForecastResponse.swift
//  Dust
//
//  Created by Chaewan Park on 2020/04/03.
//  Copyright © 2020 Chaewan Park. All rights reserved.
//

import Foundation

struct ForecastResponse: Decodable {
    let forecasts: [Forecast]
    
    enum CodingKeys: String, CodingKey {
        case forecasts = "responseMessage"
    }
}

struct Forecast: Decodable {
    let gifImage: String
    let gradeForEachRegion: String
    let message: String
    
    enum CodingKeys: String, CodingKey {
        case gifImage = "gifFile"
        case gradeForEachRegion = "informGrade"
        case message = "informOverall"
    }
}
