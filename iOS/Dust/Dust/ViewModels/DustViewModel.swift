//
//  DustViewModel.swift
//  Dust
//
//  Created by Chaewan Park on 2020/03/30.
//  Copyright © 2020 Chaewan Park. All rights reserved.
//

import Foundation

class DustViewModel {
    func requestDustStatusOfCurrentLocation(x: Double, y: Double) {
        Networking.requestNearestStation(x: x, y: y) { result in
            switch result {
            case .failure: UpdateEvent.requestFailed.post()
            case let .success(station):
                UpdateEvent.station(name: station.name).post()
                Networking.requestDustStatus(station: station.name) { result in
                    switch result {
                    case .failure: UpdateEvent.requestFailed.post()
                    case let .success(response): UpdateEvent.dustStatus(response.observations).post()
                    }
                }
            }
        }
    }
}
