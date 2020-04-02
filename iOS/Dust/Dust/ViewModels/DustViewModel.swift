//
//  DustViewModel.swift
//  Dust
//
//  Created by Chaewan Park on 2020/03/30.
//  Copyright © 2020 Chaewan Park. All rights reserved.
//

import Foundation

class DustViewModel {
    
    private var stationName = "" {
        didSet { UpdateEvent.station.post() }
    }
    
    private var observations = [DustObservation]() {
        didSet { UpdateEvent.dustStatus.post() }
    }
    
    var observationCount: Int {
        return observations.count
    }
    
    func requestDustStatusOfCurrentLocation(x: Double, y: Double) {
        Networking.requestNearestStation(x: x, y: y) { [weak self] result in
            switch result {
            case .failure: UpdateEvent.requestFailed.post()
            case let .success(station):
                self?.stationName = station.name
                Networking.requestDustStatus(station: station.name) { [weak self] result in
                    switch result {
                    case .failure: UpdateEvent.requestFailed.post()
                    case let .success(response): self?.observations = response.observations
                    }
                }
            }
        }
    }
    
    func concentration(of number: Int) -> Int {
        return Int(observations[number].concentration) ?? 0
    }
}
