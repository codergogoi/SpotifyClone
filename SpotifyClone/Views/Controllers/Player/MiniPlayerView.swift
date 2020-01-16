//
//  MiniPlayerView.swift
//  SpotifyClone
//
//  Created by JAYANTA GOGOI on 1/16/20.
//  Copyright © 2020 JAYANTA GOGOI. All rights reserved.
//

import UIKit

class MiniTrackTitleCell: CollectionBaseCell{
    
    override func setupView() {
        title.font = UIFont.systemFont(ofSize: 11)
        title.textColor = .white
        title.textAlignment = .center
        addSubview(title)
        addConstraintWithFormat(formate: "H:|[v0]|", views: title)
        addConstraintWithFormat(formate: "V:|[v0]|", views: title)
    }
}

class MiniPlayer: UIView {
    
    var didMakeFavorite: (()->())?
    var didTapOnPlayPause: ((Bool)->())?
    
    var isPlaying = false
    
    let identifier = "miniplayerTrackCell"
    
    let btnMakeFav: UIButton = {
        let btn = UIButton()
        btn.setBackgroundImage(#imageLiteral(resourceName: "fav_icon"), for: .normal)
        return btn
    }()
    
    let btnPlayPause: UIButton = {
        let btn = UIButton()
        btn.setBackgroundImage(#imageLiteral(resourceName: "play_white_outline"), for: .normal)
        btn.setBackgroundImage(#imageLiteral(resourceName: "paus_white_outline"), for: .selected)
        return btn
    }()
    
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection =  .horizontal
        let collView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collView.backgroundColor = .clear
        collView.showsHorizontalScrollIndicator = false
        return collView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupCollectionView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setupView(){
        self.backgroundColor = UIColor.rgba(r: 40, g: 40, b: 40, a: 1)
        addSubview(btnMakeFav)
        addSubview(collectionView)
        addSubview(btnPlayPause)
        addConstraintWithFormat(formate: "V:[v0(32)]", views: btnMakeFav)
        addConstraintWithFormat(formate: "V:[v0(32)]", views: btnPlayPause)
        addConstraintWithFormat(formate: "V:|[v0]|", views: collectionView)
        addConstraintWithFormat(formate: "H:|-10-[v0(32)]-10-[v1]-10-[v2(32)]-10-|", views: btnMakeFav, collectionView, btnPlayPause)
        addConstraint(NSLayoutConstraint(item: btnMakeFav, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: btnPlayPause, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0))

        btnMakeFav.addTarget(self, action: #selector(onTapMakeFav(_:)), for: .touchUpInside)
        btnPlayPause.addTarget(self, action: #selector(onTapPlayPause(_:)), for: .touchUpInside)
    }
    
    private func setupCollectionView(){
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(MiniTrackTitleCell.self, forCellWithReuseIdentifier: identifier)
    }
    
    
}

//MARK: - OnTap Actions
extension MiniPlayer {
    
    @objc func onTapMakeFav(_ sender: UIButton){
        sender.onTapAnimation()
        self.didMakeFavorite?()
    }
    
    @objc func onTapPlayPause(_ sender: UIButton){
        sender.onTapAnimation()
        self.isPlaying.toggle()
        sender.setBackgroundImage( self.isPlaying ? #imageLiteral(resourceName: "paus_white_outline") : #imageLiteral(resourceName: "play_white_outline") , for: .normal)
        self.didTapOnPlayPause?(self.isPlaying)
    }
   
}


//MARK: - Collection View Functionality

extension MiniPlayer: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! MiniTrackTitleCell
        cell.title.text = "Track Title wil display here \(indexPath.row)"
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // check for negetive value to get rid from negetive layout constraint size issue
        return CGSize(width: collectionView.frame.size.width > 0 ? collectionView.frame.size.width : 0 , height: collectionView.frame.size.height > 0 ? collectionView.frame.size.height : 0)
    }
    
    
}
