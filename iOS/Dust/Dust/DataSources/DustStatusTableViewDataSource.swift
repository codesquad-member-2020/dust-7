//
//  DustStatusTableViewDataSource.swift
//  Dust
//
//  Created by Chaewan Park on 2020/04/02.
//  Copyright © 2020 Chaewan Park. All rights reserved.
//

import UIKit

class DustStatusTableViewDataSource: NSObject {
    private var observations = [DustObservation]()
    
    func setObservations(to observations: [DustObservation]) {
        self.observations = observations
    }
}

extension DustStatusTableViewDataSource: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        observations.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: DustStatusCell.reuseIdentifier, for: indexPath) as? DustStatusCell, let concentration = Int(observations[indexPath.row].concentration) else { return UITableViewCell() }
        cell.setupBar(to: CGFloat(concentration))
        return cell
    }
}
