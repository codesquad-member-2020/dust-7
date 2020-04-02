//
//  DustViewController.swift
//  Dust
//
//  Created by Chaewan Park on 2020/03/29.
//  Copyright © 2020 Chaewan Park. All rights reserved.
//

import UIKit

class DustViewController: UIViewController {
    
    @IBOutlet weak var dustStatusTableView: UITableView!
    
    private let observers = Observers()
    private let dustViewModel = DustViewModel()
    
    private var locationManagerDelegate: LocationManagerDelegate?
    private var dustStatusTableViewDelegate: DustStatusTableViewDelegate?
    private var dustStatusTableViewDataSource: DustStatusTableViewDataSource?
    
    private let alertController: UIAlertController = {
        let alert = UIAlertController(title: UserFacingMessage.networkErrorAlertTitle,
                                      message: UserFacingMessage.networkErrorAlertMessage,
                                      preferredStyle: .alert)
        let alertAction = UIAlertAction(title: UserFacingMessage.ok, style: .cancel, handler: nil)
        alert.addAction(alertAction)
        return alert
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addViewUpdatingObservers()
        setupDelegates()
        
        dustStatusTableView.dataSource = dustStatusTableViewDataSource
        dustStatusTableView.rowHeight = 25
    }
    
    deinit {
        observers.removeObservers()
    }
    
    private func setupDelegates() {
        locationManagerDelegate = LocationManagerDelegate(with: dustViewModel)
        dustStatusTableViewDelegate = DustStatusTableViewDelegate(with: dustViewModel)
        dustStatusTableViewDataSource = DustStatusTableViewDataSource(with: dustViewModel)
    }
    
    private func addViewUpdatingObservers() {
        observers.addObserver(forName: .stationDidUpdate) { [weak self] in
            guard let event = $0 as? UpdateEvent else { return }
            if case .station = event {
            }
        }
        
        observers.addObserver(forName: .dustStatusDidUpdate) { [weak self] in
            guard let event = $0 as? UpdateEvent else { return }
            if case .dustStatus = event {
                self?.dustStatusTableView.reloadData()
            }
        }
        
        observers.addObserver(forName: .requestDidFailed) { [weak self] _ in
            guard let alert = self?.alertController else { return }
            self?.present(alert, animated: true)
        }
        
        observers.addObserver(forName: .displayedRowDidChanged) { [weak self] _ in
            
        }
    }
}
