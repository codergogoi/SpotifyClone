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
        lbl.font =  UIFont.systemFont(ofSize: 16, weight: .bold)
        lbl.textColor = .white
        lbl.lineBreakMode = .byTruncatingTail
        lbl.noAutoConst()
        return lbl
    }()
    
    let subTitle: UILabel = {
        let  lbl = UILabel()
        lbl.font =  UIFont.systemFont(ofSize: 14, weight: .bold)
        lbl.textColor = UIColor.rgba(r: 216, g: 216, b: 216, a: 1)
        lbl.lineBreakMode = .byTruncatingTail
        lbl.noAutoConst()
       return lbl
    }()
    
    let imgArtwork: UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFit
        img.noAutoConst()
        return img
    }()
    
    let btnOnTapAction: UIButton = {
        let btn = UIButton()
        btn.noAutoConst()
        return btn
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

