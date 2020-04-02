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
    
    private(set) var forecastGIF: NSObject? = nil {
        didSet { UpdateEvent.forecastGIF.post() }
    }
    
    func requestForecast() {
        Networking.requestForecast { [weak self] result in
            switch result {
            case .failure: UpdateEvent.requestFailed.post()
            case let .success(response):
                let forecast = response.forecasts.first
                self?.forecast = forecast
                Networking.requestForecastGIF(forecast?.gifImage ?? "") { [weak self] result in
                    switch result {
                    case .failure: UpdateEvent.requestFailed.post()
                    case let .success(response): self?.forecastGIF = GIFImage().create(with: response)
                    }
                }
            }
        }
    }
}
