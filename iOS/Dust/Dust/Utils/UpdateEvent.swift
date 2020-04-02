//
//  UpdateEvent.swift
//  Dust
//
//  Created by Chaewan Park on 2020/03/30.
//  Copyright © 2020 Chaewan Park. All rights reserved.
//

import Foundation

enum UpdateEvent {
    case station
    case dustStatus
    case requestFailed
    case displayedRow
    
    func post() {
        switch self {
        case .station: UpdateEvent.center.post(name: .stationDidUpdate, object: self)
        case .dustStatus: UpdateEvent.center.post(name: .dustStatusDidUpdate, object: self)
        case .requestFailed: UpdateEvent.center.post(name: .requestDidFailed, object: self)
        case .displayedRow: UpdateEvent.center.post(name: .displayedRowDidChanged, object: self)
        }
    }
}

extension UpdateEvent {
    static let center = NotificationCenter.default
}

extension Notification.Name {
    static let stationDidUpdate = Notification.Name(rawValue: "stationDidUpdate")
    static let dustStatusDidUpdate = Notification.Name(rawValue: "dustStatusDidUpdate")
    static let requestDidFailed = Notification.Name(rawValue: "requestFailed")
    static let displayedRowDidChanged = Notification.Name(rawValue: "displayedRowDidChanged")
}
