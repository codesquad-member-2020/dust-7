//
//  Endpoints.swift
//  Dust
//
//  Created by Chaewan Park on 2020/03/30.
//  Copyright © 2020 Chaewan Park. All rights reserved.
//

import Foundation

class Endpoints {
    static let baseURL = "https://21e023d0-0dde-4ff5-993d-87fc91154991.mock.pstmn.io/"
    
    static let nearestStationRequestURL = "\(baseURL)/location"
    static let dustStatusRequestURL = "\(baseURL)/dust-status"
    static let forecastRequestURL = "\(baseURL)/forecast"
}
