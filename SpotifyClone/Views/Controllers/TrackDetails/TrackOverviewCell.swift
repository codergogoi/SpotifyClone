//
//  TrackOverviewCell.swift
//  SpotifyClone
//
//  Created by JAYANTA GOGOI on 1/18/20.
//  Copyright © 2020 JAYANTA GOGOI. All rights reserved.
//

import UIKit


class TrackOverviewCell: CollectionBaseCell{
    
    override func setupView() {
        self.backgroundColor = UIColor.rgba(r: 0, g: 0, b: 0, a: 0.8)
        title.text = "Kyon"
        title.lineBreakMode = .byTruncatingTail
        title.font = UIFont.systemFont(ofSize: 16)
        title.numberOfLines = 1
        subTitle.text = "papon angarag Mahanta"
        subTitle.lineBreakMode = .byTruncatingTail
        subTitle.numberOfLines = 1
        subTitle.font =  UIFont.systemFont(ofSize: 14)
        subTitle.textColor = UIColor.lightGray
        
        btnOnTapAction.setImage(#imageLiteral(resourceName: "vertical_dots"), for: .normal )
        addSubview(title)
        addSubview(subTitle)
        addSubview(btnOnTapAction)
        addConstraintWithFormat(formate: "H:|-10-[v0]-48-|", views: title)
        addConstraintWithFormat(formate: "H:|-10-[v0]-48-|", views: subTitle)
        addConstraintWithFormat(formate: "H:[v0(38)]-10-|", views: btnOnTapAction)
        addConstraintWithFormat(formate: "V:|-5-[v0][v1(15)]", views: title, subTitle)
        addConstraintWithFormat(formate: "V:|-5-[v0]-5-|", views: btnOnTapAction)
        btnOnTapAction.addTarget(self, action: #selector(onTapShare(_:)), for: .touchUpInside)
        
    }
    
    @objc func onTapShare(_ sender: UIButton){
        sender.onTapAnimation()
    }
    
}
