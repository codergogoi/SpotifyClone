//
//  ViewExtensions.swift
//  SpotifyClone
//
//  Created by JAYANTA GOGOI on 1/1/20.
//  Copyright © 2020 JAYANTA GOGOI. All rights reserved.
//

import UIKit


extension UIView{
    
    func noAutoConst(){
           self.translatesAutoresizingMaskIntoConstraints = false
    }
       
    func addConstraintWithFormat(formate: String, views: UIView...){
        
        var viewDiectionary = [String: UIView]()
        
        for (index, view) in views.enumerated(){
            let key = "v\(index)"
            viewDiectionary[key] = view
            view.translatesAutoresizingMaskIntoConstraints = false
        }
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: formate, options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: viewDiectionary))
        
    }
    
    func shakeWarning(){
        
        DispatchQueue.main.async {
            
            let anim = CAKeyframeAnimation(keyPath: "position.x")
            anim.values = [ 0.0, 20.0, -20.0, 10.0, 0.0];
            anim.keyTimes = [0.1,0.3,0.6,0.9,1.2]
            anim.duration = 0.3;
            anim.isAdditive = true;
            self.layer.add(anim, forKey: "shake")
        }
        
    }
    
    func makeShadowView(){
        
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.shadowOpacity = 0.2
        self.layer.shadowOffset = CGSize(width: -1, height: 1)
        self.layer.shadowRadius = 2
        
        self.layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
        self.layer.shouldRasterize = true
        self.layer.rasterizationScale = UIScreen.main.scale
        
        self.layer.backgroundColor = UIColor.white.cgColor  //UIColor.init(red: 172/255, green: 24/255, blue: 19/255, alpha: 1).cgColor
        self.layer.cornerRadius = 0
        self.layer.borderWidth = 0
    }
    
}
