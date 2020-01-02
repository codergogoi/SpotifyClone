//
//  Button+Extensions.swift
//  SpotifyClone
//
//  Created by JAYANTA GOGOI on 1/1/20.
//  Copyright © 2020 JAYANTA GOGOI. All rights reserved.
//

import UIKit

extension UIButton{

    func onTapAnimation(){
        
        DispatchQueue.main.async {
            let anim = CAKeyframeAnimation(keyPath: "transform.scale")
            anim.values = [0.9,0.8,1.1,1.0]
            anim.keyTimes = [0.1,0.3,0.6,0.9,1.2]
            anim.duration = 0.3
            self.layer.add(anim, forKey:"scale")
        }
 
    }
    
}

extension UITableViewCell {
    
    func onTapAnimation(){
        
        DispatchQueue.main.async {
            
            let anim = CAKeyframeAnimation(keyPath: "transform.scale")
            anim.values = [0.9,0.8,1.1,1.0]
            anim.keyTimes = [0.1,0.3,0.6,0.9,1.2]
            anim.duration = 0.3
            self.layer.add(anim, forKey:"scale")
            
        }
    }
    
    func shakeView(){
        
        DispatchQueue.main.async {
            
            let anim = CAKeyframeAnimation(keyPath: "position.x")
            anim.values = [ 0.0, 20.0, -20.0, 10.0, 0.0];
            anim.keyTimes = [0.1,0.3,0.6,0.9,1.2]
            anim.duration = 0.3;
            anim.isAdditive = true;
            self.layer.add(anim, forKey: "shake")
        }
        
    }
}
 
extension UICollectionViewCell {
    
    func onTapAnimation(){
        
        DispatchQueue.main.async {
            
            let anim = CAKeyframeAnimation(keyPath: "transform.scale")
            anim.values = [0.9,0.8,1.1,1.0]
            anim.keyTimes = [0.1,0.3,0.6,0.9,1.2]
            anim.duration = 0.3
            self.layer.add(anim, forKey:"scale")
            
        }
    }
    
    func shakeView(){
        
        DispatchQueue.main.async {
            
            let anim = CAKeyframeAnimation(keyPath: "position.x")
            anim.values = [ 0.0, 20.0, -20.0, 10.0, 0.0];
            anim.keyTimes = [0.1,0.3,0.6,0.9,1.2]
            anim.duration = 0.3;
            anim.isAdditive = true;
            self.layer.add(anim, forKey: "shake")
        }
    }
}


class CustomAnimView: UIView {

    func onTapAnimation(){
        
        DispatchQueue.main.async {
            
            let anim = CAKeyframeAnimation(keyPath: "transform.scale")
            anim.values = [0.9,0.8,1.1,1.0]
            anim.keyTimes = [0.1,0.3,0.6,0.9,1.2]
            anim.duration = 0.3
            self.layer.add(anim, forKey:"scale")
        
        }
    }
}

extension UIView {
    func onTapPaymentViewAnimation(){
        
        DispatchQueue.main.async {
            
            let anim = CAKeyframeAnimation(keyPath: "transform.scale")
            anim.values = [0.1,0.3,0.5,0.7,1.0]
            anim.duration = 0.3
            self.layer.add(anim, forKey:"scale")
            
        }
        
    }
    
    func onTapViewAnimation(){

        DispatchQueue.main.async {
            
            let anim = CAKeyframeAnimation(keyPath: "transform.scale")
            anim.values = [0.9,0.8,1.1,1.0]
            anim.keyTimes = [0.1,0.3,0.6,0.9,1.2]
            anim.duration = 0.3
            self.layer.add(anim, forKey:"scale")
            
        }
        
    }
    
    func onAppearAnimation(){
        
        DispatchQueue.main.async {
            
            let anim = CAKeyframeAnimation(keyPath: "transform.scale.y")
            anim.values = [0.1,1.5,0.2,0.9,0.5,1.0]
            anim.keyTimes = [0.1,0.3,0.6,0.9,1.2]
            anim.duration = 0.5
            self.layer.add(anim, forKey:"scale.y")
        }
    }
    
    func onErrorAnimation(){
        
        DispatchQueue.main.async {
            
            let anim = CAKeyframeAnimation(keyPath: "transform.scale")
            anim.values = [0.1,0.2,0.5,0.2,0.1]
            anim.keyTimes = [0.1,0.3,0.6,0.9,1.2]
            anim.duration = 0.5
            self.layer.add(anim, forKey:"scale")
        }
    }
    
}


extension UILabel{
    
    func onTapAnimation(){
        
        DispatchQueue.main.async {
            
            let anim = CAKeyframeAnimation(keyPath: "transform.scale")
            anim.values = [0.9,0.8,1.1,1.0]
            anim.keyTimes = [0.1,0.3,0.6,0.9,1.2]
            anim.duration = 0.3
            self.layer.add(anim, forKey:"scale")

        }
        
    }
}

