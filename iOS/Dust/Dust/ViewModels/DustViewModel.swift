//
//  DustViewModel.swift
//  Dust
//
//  Created by Chaewan Park on 2020/03/30.
//  Copyright © 2020 Chaewan Park. All rights reserved.
//

import Foundation

class DustViewModel {
    func fineNearestStationByCoordinate(x: Double, y: Double) {
        Networking.requestNearestStation(x: x, y: y) { result in
            switch result {
            case .failure: return
            case let .success(station): UpdateEvent.station(name: station.name).post()
            }
        }
        
        Networking.requestDustStatus(station: "강남대로") { result in
            switch result {
            case .failure: return
            case let .success(response): return
            }
        }
    }
}
