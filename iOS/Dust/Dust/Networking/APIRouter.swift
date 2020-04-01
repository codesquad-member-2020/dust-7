//
//  APIRouter.swift
//  Dust
//
//  Created by Chaewan Park on 2020/03/30.
//  Copyright © 2020 Chaewan Park. All rights reserved.
//

import Foundation

enum APIRouter {
    case station(x: Double, y: Double)
    case dust(station: String)
    
    private var path: String {
        switch self {
        case .station: return Endpoints.nearestStationRequestURL
        case .dust: return Endpoints.dustStatusRequestURL
        }
    }
    
    private var query: String {
        switch self {
        case let .station(x: x, y: y): return "location=\(x),\(y)"
        case let .dust(station: station): return "\(station)/dust-status"
        }
    }
    
    var url: URL? {
        guard var urlComponents = URLComponents(string: path) else { return nil }
        urlComponents.query = query
        return urlComponents.url
    }
}
