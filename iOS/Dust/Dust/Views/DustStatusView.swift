//
//  DustGotoHell.swift
//  Dust
//
//  Created by Chaewan Park on 2020/04/02.
//  Copyright © 2020 Chaewan Park. All rights reserved.
//

import UIKit

class DustStatusView: UIView {
    @IBOutlet var statusImageView: UIImageView!
    @IBOutlet var statusLabel: UILabel!
    @IBOutlet var concentrationLabel: UILabel!
    @IBOutlet var observationTimeLabel: UILabel!
    @IBOutlet var stationLabel: UILabel!
    
    var viewModel: DustViewModel?
    
    func updateStationLabel() {
        stationLabel.text = viewModel?.stationName
    }
    
    func updateView() {
        guard let row = viewModel?.rowToDisplay else { return }
        statusLabel.text = viewModel?.gradeMessage(of: row)
        concentrationLabel.text = (viewModel?.concentration(of: row) ?? "0") + " µg/㎥"
        statusImageView.image = Self.imageForGrade[viewModel?.grade(of: row) ?? "0"]
    }
}

extension DustStatusView {
    static let imageForGrade: Dictionary<String, UIImage> = ["0": .placeholder,
                                                             "1": .good,
                                                             "2": .moderate,
                                                             "3": .unhealthy,
                                                             "4": .hazardous]
}
