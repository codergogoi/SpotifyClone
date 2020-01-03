//
//  TrackDetailsViewController.swift
//  SpotifyClone
//
//  Created by JAYANTA GOGOI on 1/2/20.
//  Copyright © 2020 JAYANTA GOGOI. All rights reserved.
//

import UIKit

class TrackDetailsViewController: UIViewController {
    
    let navigationView: UIView = {
        let view = UIView()
        return view
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    
    private func setupViews(){
        self.view.backgroundColor = UIColor.rgba(r: 0, g: 0, b: 0, a: 0.8)
        self.view.layer.insertSublayer(UIColor.gradientBg(self.view), at: 0)
        self.view.addSubview(navigationView)
        self.view.addConstraintWithFormat(formate: "H:|[v0]|", views: navigationView)
        self.view.addConstraintWithFormat(formate: "V:|[v0(100)]", views: navigationView)
        
        let btnBack = UIButton()
        btnBack.setBackgroundImage(#imageLiteral(resourceName: "back_arrow"), for: .normal)
        btnBack.addTarget(self, action: #selector(onTapBack), for: .touchUpInside)
        
        self.navigationView.addSubview(btnBack)
        self.navigationView.addConstraintWithFormat(formate: "H:|-20-[v0(30)]", views: btnBack)
        self.navigationView.addConstraintWithFormat(formate: "V:|-60-[v0(30)]", views: btnBack)
    }
    
    @objc func onTapBack(){
        self.navigationController?.popViewController(animated: true)
        
    }
    
    
}
