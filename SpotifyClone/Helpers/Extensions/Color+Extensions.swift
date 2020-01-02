//
//  ColorExtensions.swift
//  SpotifyClone
//
//  Created by JAYANTA GOGOI on 1/1/20.
//  Copyright © 2020 JAYANTA GOGOI. All rights reserved.
//

import Foundation
import UIKit

extension UIColor{
    
    class func rgba(r: Float, g: Float, b: Float,a: Float) -> UIColor{
        return UIColor(red: CGFloat(r/255), green: CGFloat(g/255), blue: CGFloat(b/255), alpha: CGFloat(a))
    }
    
}

