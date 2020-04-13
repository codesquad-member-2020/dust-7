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
    @IBOutlet weak var localForecastLabel: UILabel!
    @IBOutlet weak var forecastImageView: UIImageView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    private let observers = Observers()
    private let messageViewModel = ForecastMessageViewModel(with: nil)
    private let imageViewModel = ForecastImageViewModel(with: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addViewUpdatingObservers()
        
        activityIndicator.color = .white
        activityIndicator.hidesWhenStopped = true
        activityIndicator.startAnimating()
        
        messageViewModel.updateNotify { [weak self] message in
           guard let message = message else { return }
           self?.localForecastLabel.text = message.local
           self?.forecastMessageLabel.text = message.overall
        }
        
        imageViewModel.updateNotify { [weak self] data in
            guard let data = data else { return }
            self?.forecastImageView.image = AnimatedImage.create(with: data)
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
                self?.messageViewModel.update(message: (forecast.message, forecast.gradeForEachRegion))
                self?.requestImage(with: forecast.gifImage)
            }
        }
        
        observers.addObserver(forName: .forecastImageDidUpdate) { [weak self] in
            guard let event = $0 as? UpdateEvent else { return }
            if case let .forecastImage(data) = event {
                self?.imageViewModel.update(animatedImage: data)
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
    
    func requestImage(with url: String) {
        Networking.requestImage(with: url) { result in
            switch result {
            case .failure: UpdateEvent.requestFailed.post()
            case let .success(response): UpdateEvent.forecastImage(response).post()
            }
        }
    }
}

