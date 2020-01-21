//
//  CurrentPlanCell.swift
//  SpotifyClone
//
//  Created by JAYANTA GOGOI on 1/21/20.
//  Copyright © 2020 JAYANTA GOGOI. All rights reserved.
//

import UIKit


class CurrentPlanCell: UICollectionViewCell {
    
     let lblPlanName: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont.boldSystemFont(ofSize: 20)
        lbl.textAlignment = .center
        lbl.text = "Spotify Free"
        lbl.textColor = .white
        return lbl
    }()
    
    let lblCurrentPlan: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont.systemFont(ofSize: 12)
        lbl.textColor = .white
        lbl.text = "CURRENT PLAN"
        return lbl
    }()
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let bgView = UIView()
        bgView.backgroundColor = UIColor.rgba(r: 40, g: 40, b: 40, a: 1)
        bgView.layer.cornerRadius = 10
        self.addSubview(bgView)
        self.addConstraintWithFormat(formate: "H:|-10-[v0]-10-|", views: bgView)
        self.addConstraintWithFormat(formate: "V:|-10-[v0]-10-|", views: bgView)

        bgView.addSubview(lblPlanName)
        bgView.addSubview(lblCurrentPlan)
        bgView.addConstraintWithFormat(formate: "H:|-20-[v0]", views: lblPlanName)
        bgView.addConstraintWithFormat(formate: "H:[v0]-20-|", views: lblCurrentPlan)
        bgView.addConstraintWithFormat(formate: "V:[v0]", views: lblPlanName)
        bgView.addConstraintWithFormat(formate: "V:[v0]", views: lblCurrentPlan)
        bgView.addConstraint(NSLayoutConstraint(item: lblPlanName, attribute: .centerY, relatedBy: .equal, toItem: bgView, attribute: .centerY, multiplier: 1, constant: 0))
        bgView.addConstraint(NSLayoutConstraint(item: lblCurrentPlan, attribute: .centerY, relatedBy: .equal, toItem: bgView, attribute: .centerY, multiplier: 1, constant: 0))

    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
}

