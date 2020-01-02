//
//  CollectionBaseCell.swift
//  SpotifyClone
//
//  Created by JAYANTA GOGOI on 1/1/20.
//  Copyright © 2020 JAYANTA GOGOI. All rights reserved.
//

import UIKit

class CollectionBaseCell: UICollectionViewCell {
    
    let title: UILabel = {
       
        let  lbl = UILabel()
        lbl.text = "Title Place Holder"
        lbl.font =  UIFont.systemFont(ofSize: 18, weight: .bold)
        return lbl
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setupView(){
        
    }
    
    
    
}

