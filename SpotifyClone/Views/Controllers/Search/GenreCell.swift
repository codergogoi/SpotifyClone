//
//  GenreCell.swift
//  SpotifyClone
//
//  Created by JAYANTA GOGOI on 1/21/20.
//  Copyright © 2020 JAYANTA GOGOI. All rights reserved.
//

import UIKit


class GenreCell: CollectionBaseCell {
    
    private let lblGenereType: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont.boldSystemFont(ofSize: 16)
        lbl.text = "Genres Title"
        lbl.textColor = .white
        return lbl
    }()
    
    private let artworkImg: UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFit
        img.image = #imageLiteral(resourceName: "details_tracks_placeholder")
        return img
    }()
    
    
    override func setupView() {
        self.layer.cornerRadius = 5
        self.clipsToBounds = true
        self.backgroundColor = UIColor.randomColor()
        self.addSubview(artworkImg)
        self.addSubview(lblGenereType)
        self.addConstraintWithFormat(formate: "H:|-10-[v0]", views: lblGenereType)
        self.addConstraintWithFormat(formate: "V:|-10-[v0]", views: lblGenereType)
        self.addConstraintWithFormat(formate: "V:[v0(70)]|", views: artworkImg)
        self.addConstraintWithFormat(formate: "H:[v0(70)]", views: artworkImg)
        self.addConstraint(NSLayoutConstraint(item: artworkImg, attribute: .right, relatedBy: .equal, toItem: self, attribute: .right, multiplier: 1, constant: 15))
        self.artworkImg.transform = self.artworkImg.transform.rotated(by: -9)
    }
     
}
