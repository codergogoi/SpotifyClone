//
//  HeavyRotationCell.swift
//  SpotifyClone
//
//  Created by JAYANTA GOGOI on 1/2/20.
//  Copyright © 2020 JAYANTA GOGOI. All rights reserved.
//

import UIKit


class HeavyRotationCell: CollectionBaseCell {
    
    override func setupView() {
        self.addSubview(imgArtwork)
        self.addSubview(title)
        self.addSubview(subTitle)
        
    }
    
}
