//
//  DustViewController.swift
//  Dust
//
//  Created by Chaewan Park on 2020/03/29.
//  Copyright © 2020 Chaewan Park. All rights reserved.
//

import UIKit

class DustViewController: UIViewController {
    
    @IBOutlet weak var stationLabel: UILabel!
    
    private let locationManagerDelegate = LocationManagerDelegate(with: DustViewModel())
    private let observers = Observers()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addViewUpdatingObservers()
    }
    
    deinit {
        observers.removeObservers()
    }
    
    private func addViewUpdatingObservers() {
        observers.addObserver(forName: .stationDidUpdate) { [weak self] in
            guard let event = $0 as? UpdateEvent else { return }
            if case let .station(name: name) = event {
                self?.stationLabel.text = name
            }
        }
    }
}
