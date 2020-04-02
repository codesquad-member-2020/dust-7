//
//  ForecastViewModel.swift
//  Dust
//
//  Created by Chaewan Park on 2020/04/03.
//  Copyright © 2020 Chaewan Park. All rights reserved.
//

import Foundation

class ForecastViewModel {
    
    func requestForecast() {
        Networking.requestForecast { result in
            switch result {
            case .failure: UpdateEvent.requestFailed.post()
            case let .success(response): return
            }
        }
    }
    
}
