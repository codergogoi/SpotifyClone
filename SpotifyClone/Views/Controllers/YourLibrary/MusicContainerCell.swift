//
//  LibraryContainerCell.swift
//  SpotifyClone
//
//  Created by JAYANTA GOGOI on 1/25/20.
//  Copyright © 2020 JAYANTA GOGOI. All rights reserved.
//

import UIKit

class PlayListCell: CollectionBaseCell{
    
    override func setupView() {
        
        addSubview(imgArtwork)
        addSubview(title)
        addSubview(subTitle)
        
        
        imgArtwork.image = #imageLiteral(resourceName: "details_tracks_placeholder")
        title.text = "Liked Songs"
        subTitle.text = "12 songs"
        subTitle.font = UIFont.systemFont(ofSize: 12)
        
        imgArtwork.widthAnchor.constraint(equalToConstant: 80).isActive = true
        imgArtwork.heightAnchor.constraint(equalToConstant: 80).isActive = true
        imgArtwork.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        imgArtwork.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
       
        title.centerYAnchor.constraint(equalTo: imgArtwork.centerYAnchor).isActive = true
        title.leadingAnchor.constraint(equalTo: imgArtwork.trailingAnchor, constant: 10).isActive = true
        title.heightAnchor.constraint(equalToConstant: 25).isActive = true
        title.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10).isActive = true
        subTitle.topAnchor.constraint(equalTo: self.title.bottomAnchor).isActive = true
        subTitle.heightAnchor.constraint(equalToConstant: 18).isActive = true
        subTitle.leadingAnchor.constraint(equalTo: imgArtwork.trailingAnchor, constant: 10).isActive = true
        
    }
    
}


class MusicContainerCell: CollectionBaseCell {
    
     let btnPlayList: UIButton = {
          let btn = UIButton()
          btn.noAutoConst()
          return btn
      }()
      
      let btnArtists: UIButton = {
          let btn = UIButton()
          btn.noAutoConst()
          return btn
      }()
      
      let btnAlbums: UIButton = {
          let btn = UIButton()
          btn.noAutoConst()
          return btn
      }()
      
      let collectionView: UICollectionView = {
          let layout = UICollectionViewFlowLayout()
          layout.scrollDirection = .horizontal
          let collView = UICollectionView(frame: .zero, collectionViewLayout: layout)
          collView.isPagingEnabled = true
          collView.showsHorizontalScrollIndicator = false
          collView.backgroundColor = .clear
          collView.noAutoConst()
          return collView
      }()
      
      let identifier = "musicIdentifier"
      
      override func setupView() {
          setNormalTitle()
          btnPlayList.setAttributedTitle(attrText(title: "Playlists", color: .white), for: .normal)
          addSubview(btnPlayList)
          addSubview(btnArtists)
          addSubview(btnAlbums)
          
          btnPlayList.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
          btnPlayList.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10).isActive = true
          btnPlayList.heightAnchor.constraint(equalToConstant: 40).isActive = true
          btnPlayList.widthAnchor.constraint(equalToConstant: 80).isActive = true
          
          btnArtists.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
          btnArtists.leadingAnchor.constraint(equalTo: self.btnPlayList.trailingAnchor, constant: 10).isActive = true
          btnArtists.heightAnchor.constraint(equalToConstant: 40).isActive = true
          btnArtists.widthAnchor.constraint(equalToConstant: 100).isActive = true

          btnAlbums.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
          btnAlbums.leadingAnchor.constraint(equalTo: self.btnArtists.trailingAnchor, constant: 10).isActive = true
          btnAlbums.heightAnchor.constraint(equalToConstant: 40).isActive = true
          btnAlbums.widthAnchor.constraint(equalToConstant: 80).isActive = true
                 
          
          btnPlayList.addTarget(self, action: #selector(onTapEpisodes), for: .touchUpInside)
          btnArtists.addTarget(self, action: #selector(onTapDownloads), for: .touchUpInside)
          btnAlbums.addTarget(self, action: #selector(onTapShow), for: .touchUpInside)
          
          
          addSubview(collectionView)
          collectionView.register(PlayListCell.self, forCellWithReuseIdentifier: identifier)
          collectionView.delegate = self
          collectionView.dataSource = self
          collectionView.topAnchor.constraint(equalTo: btnPlayList.bottomAnchor).isActive = true
          collectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
          collectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
          collectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 60).isActive = true
          
      }
      
      private func setNormalTitle(){
          btnPlayList.setAttributedTitle(attrText(title: "Playlists", color: .lightGray), for: .normal)
          btnArtists.setAttributedTitle(attrText(title: "Artists", color: .lightGray), for: .normal)
          btnAlbums.setAttributedTitle(attrText(title: "Albums", color: .lightGray), for: .normal)
          
      }
      
      private func attrText(title: String, color: UIColor)-> NSAttributedString{
          let attrString = NSAttributedString(string: "\(title)", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 18), NSAttributedString.Key.foregroundColor: color])
          return attrString
      }
      
      
      @objc private func onTapEpisodes(){
          setNormalTitle()
          btnPlayList.setAttributedTitle(attrText(title: "Playlists", color: .white), for: .normal)
          self.collectionView.scrollToItem(at: IndexPath(row: 0, section: 0), at: .centeredHorizontally, animated: true)
      }
      
      @objc private func onTapDownloads(){
             setNormalTitle()
             btnArtists.setAttributedTitle(attrText(title: "Artists", color: .white), for: .normal)
              self.collectionView.scrollToItem(at: IndexPath(row: 0, section: 1), at: .centeredHorizontally, animated: true)
         }
      
      @objc private func onTapShow(){
             setNormalTitle()
             btnAlbums.setAttributedTitle(attrText(title: "Albums", color: .white), for: .normal)
           self.collectionView.scrollToItem(at: IndexPath(row: 0, section: 2), at: .centeredHorizontally, animated: true)
         }
    
}


//MARK: - Collection View Functionality

extension MusicContainerCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 15
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! PlayListCell
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionView.bounds.size.width, height: 80)
    }
    
    
}
