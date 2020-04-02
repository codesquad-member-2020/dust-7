//
//  ForecastViewModel.swift
//  Dust
//
//  Created by Chaewan Park on 2020/04/03.
//  Copyright © 2020 Chaewan Park. All rights reserved.
//

import Foundation

class ForecastViewModel {
    
    private(set) var forecast: Forecast? = nil {
        didSet { UpdateEvent.forecastMessage.post() }
    }
    
    func requestForecast() {
        Networking.requestForecast { [weak self] result in
            switch result {
            case .failure: UpdateEvent.requestFailed.post()
            case let .success(response):
                self?.forecast = response.forecasts.first
                Networking.requestForecastGIF(response.forecasts.first?.gifImage ?? "") { result in
                    switch result {
                    case .failure: UpdateEvent.requestFailed.post()
                    case let .success(response): return
                    }
                }
            }
        }
    }
}
