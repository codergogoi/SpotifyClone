//
//  TrackHeaderCell.swift
//  SpotifyClone
//
//  Created by JAYANTA GOGOI on 1/18/20.
//  Copyright © 2020 JAYANTA GOGOI. All rights reserved.
//

import UIKit


class TrackDetailsHeaderCell: UICollectionReusableView {
    
    let imgArtwork: UIImageView = {
           let img = UIImageView()
           img.contentMode = .scaleAspectFit
           img.image = #imageLiteral(resourceName: "details_tracks_placeholder")
           return img
       }()
       
       let lblTracktitle: UILabel = {
           let lbl = UILabel()
           lbl.text = "This is Papon"
           lbl.font = UIFont.boldSystemFont(ofSize: 30)
           lbl.textColor = .white
           lbl.textAlignment = .center
          
           return lbl
       }()
       
       let lblLikeCount: UILabel = {
           let lbl = UILabel()
           lbl.text = "by Spotify . 6,838 Likes"
           lbl.font = UIFont.systemFont(ofSize: 16)
           lbl.textColor = .lightGray
           lbl.textAlignment = .center
           return lbl
       }()
       
       let artworkView: UIView = {
           let view = UIView()
           return view
       }()
       
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupArtworkView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    
    private func setupArtworkView(){
        addSubview(artworkView)
        addConstraintWithFormat(formate: "H:|[v0]|", views: artworkView)
        addConstraintWithFormat(formate: "V:|[v0]|", views: artworkView)
        artworkView.addSubview(imgArtwork)
        artworkView.addSubview(lblTracktitle)
        artworkView.addSubview(lblLikeCount)
        artworkView.addConstraintWithFormat(formate: "H:[v0(210)]", views: imgArtwork)
        artworkView.addConstraintWithFormat(formate: "H:|-20-[v0]-20-|", views: lblTracktitle)
        artworkView.addConstraintWithFormat(formate: "H:|-20-[v0]-20-|", views: lblLikeCount)
        artworkView.addConstraintWithFormat(formate: "V:|-10-[v0(210)]-20-[v1]-10-[v2(12)]", views: imgArtwork, lblTracktitle, lblLikeCount)
        artworkView.addConstraint(NSLayoutConstraint(item: imgArtwork, attribute: .centerX, relatedBy: .equal, toItem: artworkView, attribute: .centerX, multiplier: 1, constant: 0))
           
       }
}
