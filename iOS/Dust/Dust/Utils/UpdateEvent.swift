//
//  UpdateEvent.swift
//  Dust
//
//  Created by Chaewan Park on 2020/03/30.
//  Copyright © 2020 Chaewan Park. All rights reserved.
//

import Foundation

enum UpdateEvent {
    case station(name: String)
    
    func post() {
        switch self {
        case .station(name: _): UpdateEvent.center.post(name: .stationDidUpdate, object: self)
        }
    }
}

extension UpdateEvent {
    static let center = NotificationCenter.default
}

extension Notification.Name {
    static let stationDidUpdate = Notification.Name(rawValue: "stationDidUpdate")
}
