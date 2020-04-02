//
//  Endpoints.swift
//  Dust
//
//  Created by Chaewan Park on 2020/03/30.
//  Copyright © 2020 Chaewan Park. All rights reserved.
//

import Foundation

class Endpoints {
    static let baseURL = "http://15.165.113.21:8080"
    
    static let nearestStationRequestURL = "\(baseURL)/location"
    static let dustStatusRequestURL = "\(baseURL)/dust-status"
    static let forecastRequestURL = "\(baseURL)/forecast"
}
