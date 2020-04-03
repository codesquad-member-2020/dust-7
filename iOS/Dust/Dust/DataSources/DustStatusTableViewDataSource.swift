//
//  DustStatusTableViewDataSource.swift
//  Dust
//
//  Created by Chaewan Park on 2020/04/02.
//  Copyright © 2020 Chaewan Park. All rights reserved.
//

import UIKit

class DustStatusTableViewDataSource: NSObject {
    
    private let viewModel: DustViewModel
    
    init(with viewModel: DustViewModel) {
        self.viewModel = viewModel
        super.init()
    }
}

extension DustStatusTableViewDataSource: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.observationCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: DustStatusCell.reuseIdentifier, for: indexPath) as? DustStatusCell else { return UITableViewCell() }
        let grade = Int(viewModel.grade(of: indexPath.row)) ?? 0
        cell.setupLabel(to: viewModel.concentration(of: indexPath.row))
        cell.setupBar(to: CGFloat(viewModel.concentrationPercent(of: indexPath.row)))
        cell.setupBarColer(to: UIColor.colorForGrade[grade])
        return cell
    }
}
