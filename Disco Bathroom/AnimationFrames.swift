//
//  AnimationFrames.swift
//  Disco Bathroom
//
//  Created by KG on 4/9/16.
//  Copyright © 2016 Kenneth Gabbara. All rights reserved.
//
import UIKit

class AnimationFrames {
    
    class func createFrames() -> [UIImage] {
        
        // Setup "Now Playing" Animation Bars
        var animationFrames = [UIImage]()
        for i in 0...3 {
            if let image = UIImage(named: "NowPlayingBars-\(i)") {
                animationFrames.append(image)
            }
        }
        
        for i in (0...3).reverse() {
            if let image = UIImage(named: "NowPlayingBars-\(i)") {
                animationFrames.append(image)
            }
        }
        
        return animationFrames
    }
    
}