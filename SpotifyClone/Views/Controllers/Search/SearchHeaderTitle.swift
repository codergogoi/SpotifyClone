//
//  SearchHeaderTitle.swift
//  SpotifyClone
//
//  Created by JAYANTA GOGOI on 1/21/20.
//  Copyright © 2020 JAYANTA GOGOI. All rights reserved.
//

import UIKit

class SearchHeaderTitle: UICollectionReusableView {
    
    var category: String?{
       didSet{
           if let category = category{
               self.lblCategory.text = category
           }
       }
    }
    
    private let lblCategory: UILabel = {
        let lbl = UILabel()
        lbl.text = "Genere List"
        lbl.font = UIFont.systemFont(ofSize: 16)
        lbl.textColor = .white
        return lbl
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(lblCategory)
        addConstraintWithFormat(formate: "H:|-10-[v0]", views: lblCategory)
        addConstraintWithFormat(formate: "V:|[v0]|", views: lblCategory)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
