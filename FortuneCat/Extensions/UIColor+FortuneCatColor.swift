//
//  UIColor+FortuneCatColor.swift
//  FortuneCat
//
//  Created by Kouki Saito on 2015/09/22.
//  Copyright © 2015年 FortuneCat. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    static func positiveColor() -> UIColor {
        return UIColor(red: 88/255, green: 158/255, blue: 255/255, alpha: 1)
    }

    static func negativeColor() -> UIColor {
        return UIColor(red: 255/255, green: 135/255, blue: 23/255, alpha: 1)
    }
    
}