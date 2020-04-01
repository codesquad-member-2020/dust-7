//
//  LocationManagerDelegate.swift
//  Dust
//
//  Created by Chaewan Park on 2020/03/30.
//  Copyright © 2020 Chaewan Park. All rights reserved.
//

import Foundation
import CoreLocation

class LocationManagerDelegate: NSObject {
    
    private let locationManager = CLLocationManager()
    
    private let viewModel: DustViewModel
    
    init(with viewModel: DustViewModel) {
        self.viewModel = viewModel
        super.init()
        locationManager.delegate = self
        locationManager.startUpdatingLocation()
    }
}

extension LocationManagerDelegate: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status != .authorizedAlways || status != .authorizedWhenInUse {
            manager.requestWhenInUseAuthorization()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let coordinate = locations.first?.coordinate else { return }
        manager.stopUpdatingLocation()
        viewModel.fineNearestStationByCoordinate(x: coordinate.latitude, y: coordinate.longitude)
    }
}
