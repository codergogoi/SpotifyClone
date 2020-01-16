//
//  ViewController+Extensions.swift
//  SpotifyClone
//
//  Created by JAYANTA GOGOI on 1/16/20.
//  Copyright © 2020 JAYANTA GOGOI. All rights reserved.
//

import UIKit


extension UIViewController {
    
     func isSafeArea() -> Bool{
        if #available(iOS 11.0, *) {
            if UIApplication.shared.keyWindow?.safeAreaInsets.bottom ?? 0.0 > 0.0 {
                return true
            } else {
               return false
            }
        } else {
            return false
        }
        
    }
    
}
