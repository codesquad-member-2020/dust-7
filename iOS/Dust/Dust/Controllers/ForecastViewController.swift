//
//  ForecastViewController.swift
//  Dust
//
//  Created by Chaewan Park on 2020/03/29.
//  Copyright © 2020 Chaewan Park. All rights reserved.
//

import UIKit

class ForecastViewController: UIViewController {
    
    private let forecastViewModel = ForecastViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        forecastViewModel.requestForecast()
    }
}
