//
//  TrackDetailsViewController.swift
//  SpotifyClone
//
//  Created by JAYANTA GOGOI on 1/2/20.
//  Copyright © 2020 JAYANTA GOGOI. All rights reserved.
//

import UIKit


class TrackOverviewCell: CollectionBaseCell{
    
    
    override func setupView() {
        title.text = "Kyon"
        title.lineBreakMode = .byTruncatingTail
        title.font = UIFont.systemFont(ofSize: 16)
        title.numberOfLines = 1
        subTitle.text = "papon"
        subTitle.lineBreakMode = .byTruncatingTail
        subTitle.numberOfLines = 1
        subTitle.font =  UIFont.systemFont(ofSize: 12)
        subTitle.textColor = UIColor.rgba(r: 0, g: 0, b: 0, a: 0.4)
        btnOnTapAction.setImage(#imageLiteral(resourceName: "vertical_dots"), for: .normal )
        addSubview(title)
        addSubview(subTitle)
        addSubview(btnOnTapAction)
        addConstraintWithFormat(formate: "H:|[v0]-48-|", views: title)
        addConstraintWithFormat(formate: "H:|[v0]-48-|", views: subTitle)
        addConstraintWithFormat(formate: "H:[v0(38)]-10-|", views: btnOnTapAction)
        addConstraintWithFormat(formate: "V:|-5-[v0]-10-[v1(10)]", views: title, subTitle)
        addConstraintWithFormat(formate: "V:|-5-[v0]-5-|", views: btnOnTapAction)
        btnOnTapAction.addTarget(self, action: #selector(onTapShare(_:)), for: .touchUpInside)
        
    }
    
    @objc func onTapShare(_ sender: UIButton){
        sender.onTapAnimation()
        
    }
    
}


class TrackDetailsViewController: UIViewController {
    
    let navigationView: UIView = {
        let view = UIView()
        return view
    }()
    
    let searchView: UIView = {
        let view = UIView()
        view.backgroundColor = .brown
        return view
    }()
    
    let imgArtwork: UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFit
        img.image = #imageLiteral(resourceName: "details_tracks_placeholder")
        return img
    }()
    
    let lblTracktitle: UILabel = {
        let lbl = UILabel()
        lbl.text = "This is Papon"
        lbl.font = UIFont.boldSystemFont(ofSize: 20)
        lbl.textColor = .white
        lbl.textAlignment = .center
       
        return lbl
    }()
    
    let lblLikeCount: UILabel = {
        let lbl = UILabel()
        lbl.text = "by Spotify . 6,838 Likes"
        lbl.font = UIFont.systemFont(ofSize: 10)
        lbl.textColor = .lightGray
        lbl.textAlignment = .center
        return lbl
    }()
    
    let artworkView: UIView = {
        let view = UIView()
        return view
    }()
    
    
    let tracksCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection =  .vertical
        let collView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collView.backgroundColor = .clear
        return collView
    }()
    
    
    
    let identifier = "trackOverview"
    
    var searchViewHeightConst = NSLayoutConstraint()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupNavigationView()
        setupArtworkView()
        setupCollectionView()
    }
    
    
    private func setupViews(){
        
        self.view.backgroundColor = UIColor.rgba(r: 0, g: 0, b: 0, a: 0.8)
        self.view.layer.insertSublayer(UIColor.gradientBg(self.view), at: 0)
        
        view.addSubview(navigationView)
        view.addSubview(searchView)
        view.addSubview(artworkView)
        view.addSubview(tracksCollectionView)
        
        view.addConstraintWithFormat(formate: "H:|[v0]|", views: navigationView)
        view.addConstraintWithFormat(formate: "H:|[v0]|", views: searchView)
        view.addConstraintWithFormat(formate: "H:|[v0]|", views: artworkView)
        view.addConstraintWithFormat(formate: "H:|-10-[v0]-10-|", views: tracksCollectionView)
        
        //setup navigation view standalone
        view.addConstraintWithFormat(formate: "V:|-32-[v0(60)]", views: navigationView)
        view.addConstraintWithFormat(formate: "V:|-83-[v0]-10-[v1(300)]-10-[v2]-10-|", views: searchView,artworkView,tracksCollectionView)
        searchViewHeightConst = searchView.heightAnchor.constraint(equalToConstant: 0)
        searchView.addConstraint(searchViewHeightConst)
        
    }
    
    //todo: Later  on make an extension for Navigation
    private func setupNavigationView(){
        let btnBack = UIButton()
        btnBack.setBackgroundImage(#imageLiteral(resourceName: "back_arrow"), for: .normal)
        btnBack.addTarget(self, action: #selector(onTapBack), for: .touchUpInside)
        
        let btnFav = UIButton()
        btnFav.setBackgroundImage(#imageLiteral(resourceName: "fav_icon"), for: .normal)
        btnFav.addTarget(self, action: #selector(onTapBack), for: .touchUpInside)
        
        navigationView.addSubview(btnFav)
        navigationView.addSubview(btnBack)
        navigationView.addConstraintWithFormat(formate: "H:|-20-[v0(29)]", views: btnBack)
        navigationView.addConstraintWithFormat(formate: "H:[v0(32)]-10-|", views: btnFav)
        navigationView.addConstraintWithFormat(formate: "V:[v0(32)]", views: btnFav)
        navigationView.addConstraintWithFormat(formate: "V:[v0(29)]", views: btnBack)
        navigationView.addConstraint(NSLayoutConstraint(item: btnFav, attribute: .centerY, relatedBy: .equal, toItem: navigationView, attribute: .centerY, multiplier: 1, constant: 0))
        navigationView.addConstraint(NSLayoutConstraint(item: btnBack, attribute: .centerY, relatedBy: .equal, toItem: navigationView, attribute: .centerY, multiplier: 1, constant: 0))
        
    }
    
    private func setupArtworkView(){
        
        artworkView.addSubview(imgArtwork)
        artworkView.addSubview(lblTracktitle)
        artworkView.addSubview(lblLikeCount)
        artworkView.addConstraintWithFormat(formate: "H:[v0(160)]", views: imgArtwork)
        artworkView.addConstraintWithFormat(formate: "H:|-20-[v0]-20-|", views: lblTracktitle)
        artworkView.addConstraintWithFormat(formate: "H:|-20-[v0]-20-|", views: lblLikeCount)
        artworkView.addConstraintWithFormat(formate: "V:|-10-[v0(160)]-20-[v1][v2(12)]", views: imgArtwork, lblTracktitle, lblLikeCount)
        artworkView.addConstraint(NSLayoutConstraint(item: imgArtwork, attribute: .centerX, relatedBy: .equal, toItem: artworkView, attribute: .centerX, multiplier: 1, constant: 0))
        
    }
    
    private func setupCollectionView(){
        
        tracksCollectionView.delegate = self
        tracksCollectionView.dataSource = self
        tracksCollectionView.register(TrackOverviewCell.self, forCellWithReuseIdentifier: identifier)
        
    }
    
    
    @objc func onTapBack(){
        self.navigationController?.popViewController(animated: true)
        
    }
    
    
}


//MARK: - Track Collection View Functionality

extension TrackDetailsViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! TrackOverviewCell
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionView.frame.size.width, height: 40)
    }
    
    
}
