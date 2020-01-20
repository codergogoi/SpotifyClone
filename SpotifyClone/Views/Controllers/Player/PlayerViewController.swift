//
//  PlayerViewController.swift
//  SpotifyClone
//
//  Created by JAYANTA GOGOI on 1/16/20.
//  Copyright © 2020 JAYANTA GOGOI. All rights reserved.
//

import UIKit

class TrackArtWorkCell: CollectionBaseCell{
    
    let imgArtworkView: UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFit
        img.image = #imageLiteral(resourceName: "details_tracks_placeholder")
        return img
    }()
    
    override func setupView() {
        self.addSubview(imgArtworkView)
        self.addConstraintWithFormat(formate: "H:|[v0]|", views: imgArtworkView)
        self.addConstraintWithFormat(formate: "V:|[v0]|", views: imgArtworkView)
    }
    
}

class PlayerViewController: UIViewController {
    
    var onDidTapDismiss:(()->())?
    var onDidTapMakeFavorite:(()->())?
    var onDidTapNext:(()->())?
    var onDidTapPrev:(()->())?
    var onDidTapPlayPause:(()->())?
    var onDidTapShuffle:(()->())?
    var onDidTapRepeat:(()->())?
    var onDidTapDevice:(()->())?
    var onDidTapPlayList:(()->())?
    var onDidTapOptions:(()->())?

    let btnDismiss: UIButton = {
        let btn = UIButton()
        btn.setImage(#imageLiteral(resourceName: "down_arrow"), for: .normal)
        return btn
    }()
    
    let lblAlbumName: UILabel = {
        let lbl = UILabel()
        lbl.text = "This is New Album"
        lbl.font = UIFont.systemFont(ofSize: 16)
        lbl.textAlignment = .center
        lbl.textColor = .white
        return lbl
    }()
    
    let btnVerticle: UIButton = {
        let btn = UIButton()
        btn.setImage(#imageLiteral(resourceName: "vertical_dots"), for: .normal)
        return btn
    }()
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collView.backgroundColor = .clear
        return collView
    }()
    
    let identifier = "TrackArtworkIdentifier"
    
    let lblSongTitle: UILabel = {
        let lbl = UILabel()
        lbl.text = "Song Title it will animate if Longer.."
        lbl.font = UIFont.boldSystemFont(ofSize: 25)
        lbl.textColor = .white
        return lbl
    }()
    
    let lblArtistName: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont.systemFont(ofSize: 16)
        lbl.text = "Artist Name as per response"
        lbl.textColor = .white
        return lbl
    }()
    
    let btnMakeFav: UIButton = {
        let btn = UIButton()
        btn.setImage(#imageLiteral(resourceName: "fav_icon"), for: .normal)
        return btn
    }()
    
    //progress bar will be replace with custom component
    let timeProgressBar: UIProgressView = {
        let pb = UIProgressView()
        pb.progressTintColor = .white
        pb.progressViewStyle = .default
        pb.tintColor = UIColor.rgba(r: 255, g: 255, b: 255, a: 0.5)
        return pb
    }()

    let btnShuffle: UIButton = {
        let btn = UIButton()
        btn.setImage(#imageLiteral(resourceName: "shuffle_white"), for: .normal)
        return btn
    }()
    
    let btnRepeat: UIButton = {
       let btn = UIButton()
       btn.setImage(#imageLiteral(resourceName: "repeat_white"), for: .normal)
       return btn
    }()
    
    let btnPrev: UIButton = {
          let btn = UIButton()
          btn.setImage(#imageLiteral(resourceName: "prev_white"), for: .normal)
          return btn
    }()
    
    let btnNext: UIButton = {
          let btn = UIButton()
          btn.setImage(#imageLiteral(resourceName: "next_white"), for: .normal)
          return btn
    }()
    
    let btnPlayPause: UIButton = {
      let btn = UIButton()
      btn.setImage(#imageLiteral(resourceName: "play_white_fill"), for: .normal)
      return btn
    }()
    
    let btnDevice: UIButton = {
          let btn = UIButton()
          btn.setImage(#imageLiteral(resourceName: "device_icon"), for: .normal)
          return btn
    }()
    
    let btnPlaylist: UIButton = {
          let btn = UIButton()
          btn.setImage(#imageLiteral(resourceName: "playlist_icon"), for: .normal)
          return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.rgba(r: 60, g: 6, b: 22, a: 1)
        setupView()
        setupCollectionView()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        self.onDidTapDismiss?()
    }

}


extension PlayerViewController {
    
    private func setupView(){
        
        view.addSubview(btnDismiss)
        view.addSubview(lblAlbumName)
        view.addSubview(btnVerticle)
        view.addSubview(collectionView)
        view.addSubview(lblSongTitle)
        view.addSubview(lblArtistName)
        view.addSubview(btnMakeFav)
        view.addSubview(timeProgressBar)
        view.addSubview(btnShuffle)
        view.addSubview(btnPrev)
        view.addSubview(btnPlayPause)
        view.addSubview(btnNext)
        view.addSubview(btnRepeat)
        view.addSubview(btnDevice)
        view.addSubview(btnPlaylist)
        
        btnDismiss.addTarget(self, action: #selector(onTapDisMiss(_:)), for: .touchUpInside)
        btnVerticle.addTarget(self, action: #selector(onTapOptions(_:)), for: .touchUpInside)
        btnMakeFav.addTarget(self, action: #selector(onTapMakeFav(_:)), for: .touchUpInside)
        btnPlayPause.addTarget(self, action: #selector(onTapPlayPause(_:)), for: .touchUpInside)
        btnNext.addTarget(self, action: #selector(onTapNext(_:)), for: .touchUpInside)
        btnPrev.addTarget(self, action: #selector(onTapPrev(_:)), for: .touchUpInside)
        btnShuffle.addTarget(self, action: #selector(onTapShuffle(_:)), for: .touchUpInside)
        btnRepeat.addTarget(self, action: #selector(onTapRepeat(_:)), for: .touchUpInside)
        btnDevice.addTarget(self, action: #selector(onTapDevice(_:)), for: .touchUpInside)
        btnPlaylist.addTarget(self, action: #selector(onTapPlayList(_:)), for: .touchUpInside)
        
        
        view.addConstraintWithFormat(formate: "H:|-20-[v0(30)][v1][v2(30)]-10-|", views: btnDismiss, lblAlbumName, btnVerticle)
        view.addConstraintWithFormat(formate: "H:|-20-[v0]-20-|", views: collectionView)
        view.addConstraintWithFormat(formate: "H:|-20-[v0]-10-[v1(30)]-20-|", views: lblSongTitle, btnMakeFav)
        view.addConstraintWithFormat(formate: "H:|-20-[v0]-40-|", views: lblArtistName)
        view.addConstraintWithFormat(formate: "H:|-20-[v0]-20-|", views: timeProgressBar)
        view.addConstraintWithFormat(formate: "H:|-20-[v0]-20-|", views: collectionView)
        
        view.addConstraintWithFormat(formate: "H:|-20-[v0(30)]-20-[v1(60)]", views: btnShuffle, btnPrev)
        view.addConstraintWithFormat(formate: "H:[v0(60)]-20-[v1(30)]-20-|", views:  btnNext, btnRepeat)
        
        view.addConstraintWithFormat(formate: "H:[v0(80)]", views: btnPlayPause)

        view.addConstraintWithFormat(formate: "H:|-20-[v0(30)]", views: btnDevice)
        view.addConstraintWithFormat(formate: "H:[v0(30)]-20-|", views: btnPlaylist)

        view.addConstraintWithFormat(formate: "V:|-30-[v0(20)]-30-[v1]-[v2(30)][v3(13)]-20-[v4(20)]-10-[v5(80)]-[v6(30)]-50-|", views: lblAlbumName,collectionView, lblSongTitle, lblArtistName, timeProgressBar, btnPlayPause, btnDevice)
        
        view.addConstraintWithFormat(formate: "V:[v0(30)]", views: btnDismiss)
        view.addConstraintWithFormat(formate: "V:[v0(30)]", views: btnVerticle)
        view.addConstraintWithFormat(formate: "V:[v0(30)]", views: btnMakeFav)
        view.addConstraintWithFormat(formate: "V:[v0(30)]", views: btnShuffle)
        view.addConstraintWithFormat(formate: "V:[v0(30)]", views: btnRepeat)
        view.addConstraintWithFormat(formate: "V:[v0(60)]", views: btnPrev)
        view.addConstraintWithFormat(formate: "V:[v0(60)]", views: btnNext)
        view.addConstraintWithFormat(formate: "V:[v0(30)]", views: btnPlaylist)
        
        view.addConstraint(NSLayoutConstraint(item: btnPlayPause, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: 0))
        
        view.addConstraint(NSLayoutConstraint(item: btnDismiss, attribute: .top, relatedBy: .equal, toItem: lblAlbumName, attribute: .top, multiplier: 1, constant: 0))
        view.addConstraint(NSLayoutConstraint(item: btnVerticle, attribute: .top, relatedBy: .equal, toItem: lblAlbumName, attribute: .top, multiplier: 1, constant: 0))
        view.addConstraint(NSLayoutConstraint(item: btnShuffle, attribute: .centerY, relatedBy: .equal, toItem: btnPlayPause, attribute: .centerY, multiplier: 1, constant: 0))
        view.addConstraint(NSLayoutConstraint(item: btnRepeat, attribute: .centerY, relatedBy: .equal, toItem: btnPlayPause, attribute: .centerY, multiplier: 1, constant: 0))
        view.addConstraint(NSLayoutConstraint(item: btnPrev, attribute: .centerY, relatedBy: .equal, toItem: btnPlayPause, attribute: .centerY, multiplier: 1, constant: 0))
        view.addConstraint(NSLayoutConstraint(item: btnNext, attribute: .centerY, relatedBy: .equal, toItem: btnPlayPause, attribute: .centerY, multiplier: 1, constant: 0))
        view.addConstraint(NSLayoutConstraint(item: btnMakeFav, attribute: .centerY, relatedBy: .equal, toItem: lblSongTitle, attribute: .centerY, multiplier: 1, constant: 0))
        view.addConstraint(NSLayoutConstraint(item: btnPlaylist, attribute: .top, relatedBy: .equal, toItem: btnDevice, attribute: .top, multiplier: 1, constant: 0))
        
    }
    
    private func setupCollectionView(){
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(TrackArtWorkCell.self, forCellWithReuseIdentifier: identifier)
    }
    
}

//MARK: - OnTapActions
extension PlayerViewController {
    
    @objc private func onTapOptions(_ sender: UIButton){
              sender.onTapAnimation()
    }
    
    @objc private func onTapMakeFav(_ sender: UIButton){
                 sender.onTapAnimation()
       }
    
    @objc private func onTapDisMiss(_ sender: UIButton){
           sender.onTapAnimation()
            self.dismiss(animated: true, completion: nil)
    }
    
    
    @objc private func onTapPlayPause(_ sender: UIButton){
        sender.onTapAnimation()
    }
    
    @objc private func onTapNext(_ sender: UIButton){
           sender.onTapAnimation()
    }
    
    @objc private func onTapPrev(_ sender: UIButton){
           sender.onTapAnimation()
       }
    
    
    @objc private func onTapShuffle(_ sender: UIButton){
           sender.onTapAnimation()
       }
 
    @objc private func onTapRepeat(_ sender: UIButton){
           sender.onTapAnimation()
       }

    @objc private func onTapDevice(_ sender: UIButton){
           sender.onTapAnimation()
       }
    @objc private func onTapPlayList(_ sender: UIButton){
           sender.onTapAnimation()
       }
   
}



//MARK: - Collection View Functionality

extension PlayerViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! TrackArtWorkCell
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return collectionView.frame.size
    }
    
    
}
