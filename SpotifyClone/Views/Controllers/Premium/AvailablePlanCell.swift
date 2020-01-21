//
//  AvailablePlanCell.swift
//  SpotifyClone
//
//  Created by JAYANTA GOGOI on 1/21/20.
//  Copyright © 2020 JAYANTA GOGOI. All rights reserved.
//

import UIKit


class AvailablePlanCell: UICollectionViewCell {
    
     let lblPlanName: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont.boldSystemFont(ofSize: 30)
        lbl.textAlignment = .center
        lbl.text = "Premium Individual"
        lbl.textAlignment = .center
        lbl.textColor = .white
        return lbl
    }()
    
    let lblCurrentPlan: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont.systemFont(ofSize: 16)
        lbl.textColor = .white
        lbl.textAlignment = .center
        lbl.numberOfLines = 0
        lbl.lineBreakMode = .byWordWrapping
        lbl.text = "try. Premium for 3 moinths. Add free music. Unlimited skiping. More choice as per your rotating genre."
        return lbl
    }()
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let bgView = UIView()
        bgView.backgroundColor = UIColor.randomColor()
        bgView.layer.cornerRadius = 10
        self.addSubview(bgView)
        self.addConstraintWithFormat(formate: "H:|-10-[v0]-10-|", views: bgView)
        self.addConstraintWithFormat(formate: "V:|-10-[v0]-10-|", views: bgView)

        self.addSubview(lblPlanName)
        self.addSubview(lblCurrentPlan)
        self.addConstraintWithFormat(formate: "H:|-20-[v0]-20-|", views: lblPlanName)
        self.addConstraintWithFormat(formate: "H:|-20-[v0]-20-|", views: lblCurrentPlan)
        self.addConstraintWithFormat(formate: "V:|-40-[v0][v1]-30-|", views: lblPlanName, lblCurrentPlan)

    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
}

