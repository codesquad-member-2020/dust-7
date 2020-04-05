//
//  ForecastMessageViewModel.swift
//  Dust
//
//  Created by Chaewan Park on 2020/04/03.
//  Copyright © 2020 Chaewan Park. All rights reserved.
//

import Foundation

protocol ViewModelBinding {
    associatedtype Data
}

class ForecastMessageViewModel: ViewModelBinding {
    
    typealias Data = (overall: String, local: String)?
    
    private var message: Data = nil {
        didSet { changeHandler(message) }
    }
    private var changeHandler: (Data) -> Void
    
    init(with message: Data, handler: @escaping (Data) -> Void = { _ in }) {
        self.changeHandler = handler
        self.message = message
        changeHandler(message)
    }
    
    func update(message: Data) {
        self.message = message
    }
    
    func updateNotify(handler: @escaping (Data) -> Void) {
        self.changeHandler = handler
    }
}
