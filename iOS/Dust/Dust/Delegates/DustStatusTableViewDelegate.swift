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
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        guard let tableView = scrollView as? UITableView,
            let firstIndexPath = tableView.indexPathsForVisibleRows?.first else { return }
        viewModel.changeRowToDisplay(to: firstIndexPath.row)
    }
}
