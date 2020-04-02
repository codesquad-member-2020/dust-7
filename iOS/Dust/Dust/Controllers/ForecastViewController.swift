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
    
    private let observers = Observers()
    private let viewModel = ForecastViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addViewUpdatingObservers()
        viewModel.requestForecast()
    }
    
    deinit {
        observers.removeObservers()
    }
    
    private func updateView() {
        forecastMessageLabel.text = viewModel.forecast?.message
        gradeForecastLabel.text = viewModel.forecast?.gradeForEachRegion
    }
    
    private func addViewUpdatingObservers() {
        observers.addObserver(forName: .forecastMessageDidUpdate) { [weak self] in
            guard let event = $0 as? UpdateEvent else { return }
            if case .forecastMessage = event {
                self?.updateView()
            }
        }
    }
}
