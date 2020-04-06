//
//  ForecastImageViewModel.swift
//  Dust
//
//  Created by Chaewan Park on 2020/04/06.
//  Copyright © 2020 Chaewan Park. All rights reserved.
//

import Foundation

class ForecastImageViewModel: ViewModelBinding {
    typealias Key = Data?
    
    private var animatedImage: Key = nil {
        didSet { changeHandler(animatedImage) }
    }
    
    private var changeHandler: (Key) -> Void
    
    init(with animatedImage: Key, handler: @escaping (Key) -> Void = { _ in }) {
        self.changeHandler = handler
        self.animatedImage = animatedImage
        changeHandler(animatedImage)
    }
    
    func update(animatedImage: Key) {
        self.animatedImage = animatedImage
    }
    
    func updateNotify(handler: @escaping (Key) -> Void) {
        self.changeHandler = handler
    }
}
