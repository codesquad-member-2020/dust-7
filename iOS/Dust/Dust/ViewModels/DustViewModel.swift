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
            case let .success(response): UpdateEvent.station(name: response.stationName).post()
            }
        }
    }
}
