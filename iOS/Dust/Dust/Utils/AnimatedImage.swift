//
//  AnimatedImage.swift
//  Dust
//
//  Created by Chaewan Park on 2020/04/03.
//  Copyright © 2020 Chaewan Park. All rights reserved.
//

import UIKit

class AnimatedImage: UIImage {
    
    static func create(with data: Data) -> UIImage? {
        guard let source = CGImageSourceCreateWithData(data as CFData, nil) else { return nil }
        let count = CGImageSourceGetCount(source)
        var images = [UIImage]()
        for i in 0..<count {
            if let image = CGImageSourceCreateImageAtIndex(source, i, nil) {
                images.append(UIImage(cgImage: image))
            }
        }
        return UIImage.animatedImage(with: images, duration: 10)
    }
}
