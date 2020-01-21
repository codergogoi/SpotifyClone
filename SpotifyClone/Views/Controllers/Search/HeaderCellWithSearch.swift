//
//  HeaderCellWithSearch.swift
//  SpotifyClone
//
//  Created by JAYANTA GOGOI on 1/21/20.
//  Copyright © 2020 JAYANTA GOGOI. All rights reserved.
//

import UIKit


class HeaderCellWithSearch: UICollectionReusableView {
    
   private let lblCategory: UILabel = {
       let lbl = UILabel()
       lbl.text = "Search"
       lbl.font = UIFont.boldSystemFont(ofSize: 30)
       lbl.textColor = .white
       return lbl
   }()

    let txtSearch: UITextField = {
        let txt = UITextField()
        txt.placeholder = "Search"
        return txt
    }()
   
    fileprivate func setupViews() {
        addSubview(lblCategory)
        let bgView = UIView()
        bgView.layer.cornerRadius = 5
        bgView.backgroundColor = .white
        addSubview(bgView)
        
        addConstraintWithFormat(formate: "H:|-20-[v0]", views: lblCategory)
        addConstraintWithFormat(formate: "H:|-20-[v0]-20-|", views: bgView)
        addConstraintWithFormat(formate: "V:|[v0(30)]-20-[v1]|", views: lblCategory, bgView)
    }
    
    override init(frame: CGRect) {
       super.init(frame: frame)
        setupViews()
   }
    
    
   
   required init?(coder: NSCoder) {
       super.init(coder: coder)
   }
    
}
