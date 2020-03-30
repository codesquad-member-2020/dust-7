//
//  DustViewController.swift
//  Dust
//
//  Created by Chaewan Park on 2020/03/29.
//  Copyright © 2020 Chaewan Park. All rights reserved.
//

import UIKit

class DustViewController: UIViewController {
    
    private let locationManagerDelegate = LocationManagerDelegate(with: DustViewModel())
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
