//
//  DustStatusCell.swift
//  Dust
//
//  Created by Chaewan Park on 2020/04/02.
//  Copyright © 2020 Chaewan Park. All rights reserved.
//

import UIKit

class DustStatusCell: UITableViewCell {
    
    @IBOutlet weak var concentrationBarView: UIView!
    
    private let maxConcentration = CGFloat(150)
    
    func setupBar(to percent: CGFloat) {
        let multiplier = percent / maxConcentration
        concentrationBarView.frame.size.width = contentView.frame.width * multiplier
    }
}
