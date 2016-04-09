//
//  UIImage+DropShadow.swift
//  Disco Bathroom
//
//  Created by KG on 4/9/16.
//  Copyright © 2016 Kenneth Gabbara. All rights reserved.
//

import UIKit

extension UIImageView {

    // APPLY DROP SHADOW
    func applyShadow() {
		let layer           = self.layer
		layer.shadowColor   = UIColor.blackColor().CGColor
		layer.shadowOffset  = CGSize(width: 0, height: 1)
		layer.shadowOpacity = 0.4
		layer.shadowRadius  = 2
    }

}