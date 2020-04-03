//
//  UIColorExtension.swift
//  Dust
//
//  Created by Chaewan Park on 2020/04/02.
//  Copyright © 2020 Chaewan Park. All rights reserved.
//

import UIKit

extension UIColor {
    static let detailTextGray = UIColor(named: "detailTextGray")!
    static let goodBlue = UIColor(named: "goodBlue")!
    static let moderateGreen = UIColor(named: "moderateGreen")!
    static let unhealthyOrange = UIColor(named: "unhealthyOrange")!
    static let hazardousRed = UIColor(named: "hazardousRed")!
}

extension UIColor {
    static let colorForGrade: Dictionary<Int, UIColor> = [0: .white,
                                                          1: .goodBlue,
                                                          2: .moderateGreen,
                                                          3: .unhealthyOrange,
                                                          4: .hazardousRed]
}
