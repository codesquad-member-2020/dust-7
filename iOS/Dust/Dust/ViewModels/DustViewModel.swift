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
    
    private var rowToDisplay = 0 {
        didSet { UpdateEvent.displayedRow.post() }
    }
    
    private var maxConcentration = 150.0
    
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
    
    func changeRowToDisplay(to row: Int) {
        rowToDisplay = row
    }
    
    func concentration(of row: Int) -> String {
        return observations[row].concentration
    }
    
    func concentrationPercent(of row: Int) -> Double {
        guard let concentration = Int(observations[row].concentration) else { return 0 }
        return Double(concentration) / maxConcentration
    }
    
    func grade(of row: Int) -> String {
        return observations[row].grade
    }
}
