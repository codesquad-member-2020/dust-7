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
    @IBOutlet weak var concentrationLabel: UILabel!
    
    func setupBar(to percent: CGFloat) {
        concentrationBarView.frame.size.width = contentView.frame.width * percent
    }
    
    func setupLabel(to number: String) {
        concentrationLabel.text = number
    }
}
