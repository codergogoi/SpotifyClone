//
//  ShufflePlayHeaderaCell.swift
//  SpotifyClone
//
//  Created by JAYANTA GOGOI on 1/18/20.
//  Copyright © 2020 JAYANTA GOGOI. All rights reserved.
//

import UIKit

class ShufflePlayHeaderaCell: UICollectionReusableView {
    
    let halfBgView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.rgba(r: 0, g: 0, b: 0, a: 1)
        return view
    }()

    let btnShufflePlay: UIButton = {
        let btn = UIButton()
        btn.layer.backgroundColor = UIColor.rgba(r: 85, g: 182, b: 97, a: 1).cgColor
        btn.setTitle("SHUFFLE PLAY", for: .normal)
        btn.layer.cornerRadius = 25
        btn.setTitleColor(.white, for: .normal)
        return btn
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(halfBgView)
        addSubview(btnShufflePlay)
        addConstraintWithFormat(formate: "H:|[v0]|", views: halfBgView)
        addConstraintWithFormat(formate: "V:[v0(50)]|", views: halfBgView)
        addConstraintWithFormat(formate: "H:[v0(200)]", views: btnShufflePlay)
        addConstraintWithFormat(formate: "V:[v0(50)]", views: btnShufflePlay)
        addConstraint(NSLayoutConstraint(item: btnShufflePlay, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: btnShufflePlay, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0))

    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
