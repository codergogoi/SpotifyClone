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
    
   class func randomColor()->UIColor {
        
        let r = Float(arc4random_uniform(255))
        let g = Float(arc4random_uniform(255))
        let b = Float(arc4random_uniform(255))
        
        return UIColor(red: CGFloat(r/255), green: CGFloat(g/255), blue: CGFloat(b/255), alpha: 1)
    }
    
    class func gradientBg(_ view : UIView) -> CAGradientLayer{
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.frame.size = view.frame.size
        gradient.colors = [self.rgba(r: 48, g: 2, b: 32, a: 1).cgColor,self.rgba(r: 0, g: 0, b: 0, a: 1).cgColor]
        return gradient
    }
    
}

