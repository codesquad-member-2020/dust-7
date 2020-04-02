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
    @IBOutlet weak var dustStatusTableView: UITableView!
    
    private let locationManagerDelegate = LocationManagerDelegate(with: DustViewModel())
    private let observers = Observers()
    
    private var observations = [DustObservation]()
    
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
        
        dustStatusTableView.dataSource = self
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
        
        observers.addObserver(forName: .dustStatusDidUpdate) { [weak self] in
            guard let event = $0 as? UpdateEvent else { return }
            if case let .dustStatus(observations) = event {
                self?.observations = observations
                self?.dustStatusTableView.reloadData()
            }
        }
        
        observers.addObserver(forName: .requestFailed) { [weak self] _ in
            guard let alert = self?.alertController else { return }
            self?.present(alert, animated: true)
        }
    }
}

extension DustViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        observations.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: DustStatusCell.reuseIdentifier, for: indexPath) as? DustStatusCell, let concentration = Int(observations[indexPath.row].concentration) else { return UITableViewCell() }
        cell.setupBar(to: CGFloat(concentration))
        return cell
    }
}
