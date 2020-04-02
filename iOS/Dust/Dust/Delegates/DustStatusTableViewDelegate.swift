//
//  DustStatusTableViewDelegate.swift
//  Dust
//
//  Created by Chaewan Park on 2020/04/02.
//  Copyright © 2020 Chaewan Park. All rights reserved.
//

import UIKit

class DustStatusTableViewDelegate: NSObject {
    
    private let viewModel: DustViewModel
    
    init(with viewModel: DustViewModel) {
        self.viewModel = viewModel
    }
}

extension DustStatusTableViewDelegate: UITableViewDelegate {
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        viewModel.changeRowToDisplay(to: indexPath.row)
    }
}
