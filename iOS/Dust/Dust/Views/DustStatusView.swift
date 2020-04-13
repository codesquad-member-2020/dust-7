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
    
    private let gradientLayer = CAGradientLayer()
    
    var viewModel: DustViewModel?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupGradientLayer()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupGradientLayer()
    }
    
    private func setupGradientLayer() {
        gradientLayer.frame = bounds
        gradientLayer.zPosition = -1
        self.layer.addSublayer(gradientLayer)
    }
    
    func updateStationLabel() {
        stationLabel.text = viewModel?.stationName
    }
    
    func updateView() {
        guard let row = viewModel?.rowToDisplay else { return }
        let grade = Int(viewModel?.grade(of: row) ?? "") ?? 0
        statusLabel.text = viewModel?.gradeMessage(of: row)
        concentrationLabel.text = (viewModel?.concentration(of: row) ?? "0") + " µg/㎥"
        statusImageView.image = Self.imageForGrade[grade]
        observationTimeLabel.text = viewModel?.observationTime(of: row)
        gradientLayer.colors = [UIColor.colorForGrade[grade]!.cgColor, UIColor.white.cgColor]
    }
}

extension DustStatusView {
    static let imageForGrade: Dictionary<Int, UIImage> = [0: UIImage.Grade.placeholder,
                                                          1: UIImage.Grade.one,
                                                          2: UIImage.Grade.two,
                                                          3: UIImage.Grade.three,
                                                          4: UIImage.Grade.four]
}
