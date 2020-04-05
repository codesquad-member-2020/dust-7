//
//  ForecastViewController.swift
//  Dust
//
//  Created by Chaewan Park on 2020/03/29.
//  Copyright © 2020 Chaewan Park. All rights reserved.
//

import UIKit

class ForecastViewController: UIViewController {
    
    @IBOutlet weak var forecastMessageLabel: UILabel!
    @IBOutlet weak var gradeForecastLabel: UILabel!
    @IBOutlet weak var forecastImageView: UIImageView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    private let observers = Observers()
    private let viewModel = ForecastMessageViewModel(with: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addViewUpdatingObservers()
        
        activityIndicator.color = .white
        activityIndicator.hidesWhenStopped = true
        activityIndicator.startAnimating()
        
        viewModel.updateNotify { [weak self] message in
           guard let message = message else { return }
           self?.gradeForecastLabel.text = message.local
           self?.forecastMessageLabel.text = message.overall
        }
        
        requestForecast()
    }
    
    deinit {
        observers.removeObservers()
    }
    
    private func addViewUpdatingObservers() {
        observers.addObserver(forName: .forecastMessageDidUpdate) { [weak self] in
            guard let event = $0 as? UpdateEvent else { return }
            if case let .forecast(forecast) = event {
                self?.viewModel.update(message: (forecast.message, forecast.gradeForEachRegion))
            }
        }
        
        observers.addObserver(forName: .forecastGIFDidUpdate) { [weak self] in
            guard let event = $0 as? UpdateEvent else { return }
            if case .forecastGIF = event {
                //self?.updateForecastGIF()
                self?.activityIndicator.stopAnimating()
            }
        }
    }
}

extension ForecastViewController {
    func requestForecast() {
        Networking.requestForecast { result in
            switch result {
            case .failure: UpdateEvent.requestFailed.post()
            case let .success(response):
                guard let forecast = response.forecasts.first else { return }
                UpdateEvent.forecast(forecast).post()
            }
        }
    }
}
