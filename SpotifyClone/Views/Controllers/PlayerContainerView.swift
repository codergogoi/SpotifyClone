//
//  PlayerContainerView.swift
//  SpotifyClone
//
//  Created by JAYANTA GOGOI on 1/2/20.
//  Copyright © 2020 JAYANTA GOGOI. All rights reserved.
//

import UIKit



class PlayerContainerView : UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.rgba(r: 0, g: 0, b: 0, a: 0.8)
        viewControllers = [
            addNavigationCongtroller(vc: HomeViewController(), title: "Home", icon: #imageLiteral(resourceName: "tb_home")) ,
            addNavigationCongtroller(vc: HomeViewController(), title: "Search", icon: #imageLiteral(resourceName: "tb_search")) ,
            addNavigationCongtroller(vc: HomeViewController(), title: "Your Library", icon: #imageLiteral(resourceName: "tb_library")) ,
            addNavigationCongtroller(vc: HomeViewController(), title: "Premium", icon: #imageLiteral(resourceName: "tb_icon_premium")) ,
            ]
//        self.setupView()
        
        tabBar.barTintColor =  UIColor.rgba(r: 40, g: 40, b: 40, a: 1)
        tabBar.tintColor = .white
        tabBar.isTranslucent = false
        
        UITabBar.appearance().backgroundColor = UIColor.rgba(r: 40, g: 40, b: 40, a: 1)
        
    }
    
    
    func addNavigationCongtroller(vc: UIViewController, title: String, icon: UIImage ) -> UINavigationController {
        
        let navController = UINavigationController(rootViewController: vc)
        navController.tabBarItem.title = title
        navController.tabBarItem.image = icon
        
        return navController
    }
    
    
    func setupView(){
           
           let view = UIView()
            view.backgroundColor = UIColor.rgba(r: 40, g: 40, b: 40, a: 1)
           self.view.addSubview(view)
           self.view.addConstraintWithFormat(formate: "H:|[v0]|", views: view)
           self.view.addConstraintWithFormat(formate: "V:[v0(60)]-83.5-|", views: view)
          
       }
    
}
