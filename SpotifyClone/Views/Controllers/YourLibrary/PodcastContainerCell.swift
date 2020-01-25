//
//  PodcastContainerCell.swift
//  SpotifyClone
//
//  Created by JAYANTA GOGOI on 1/25/20.
//  Copyright © 2020 JAYANTA GOGOI. All rights reserved.
//

import UIKit

class PodCastGenericCell: CollectionBaseCell{
    
    let lblTitle: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont.boldSystemFont(ofSize: 25)
        lbl.textAlignment = .center
        lbl.textColor = .white
        lbl.text = "Looking for something to listen to?"
        lbl.numberOfLines = 0
        lbl.lineBreakMode = .byWordWrapping
        lbl.noAutoConst()
        return lbl
    }()
    
    let btnBrowse: UIButton = {
        let btn = UIButton()
        btn.backgroundColor = UIColor.white
        btn.layer.cornerRadius = 25
        btn.setTitle("BROWSE PODCASTS", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.noAutoConst()
        return btn
    }()

    override func setupView() {
        
        addSubview(lblTitle)
        addSubview(btnBrowse)
        
        lblTitle.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -40).isActive = true
        lblTitle.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        lblTitle.heightAnchor.constraint(equalToConstant: 70).isActive = true
        lblTitle.widthAnchor.constraint(equalToConstant: 320).isActive = true
        btnBrowse.topAnchor.constraint(equalTo: lblTitle.bottomAnchor, constant: 20).isActive = true
        btnBrowse.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        btnBrowse.widthAnchor.constraint(equalToConstant: 300).isActive = true
        btnBrowse.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        
    }
}



class PodcastContainerCell: CollectionBaseCell {
    
    let btnEpisodes: UIButton = {
        let btn = UIButton()
        btn.noAutoConst()
        return btn
    }()
    
    let btnDownloads: UIButton = {
        let btn = UIButton()
        btn.noAutoConst()
        return btn
    }()
    
    let btnShows: UIButton = {
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
    
    let identifier = "podcaseIdentifier"
    
    override func setupView() {
        setNormalTitle()
        btnEpisodes.setAttributedTitle(attrText(title: "Episodes", color: .white), for: .normal)
        addSubview(btnEpisodes)
        addSubview(btnDownloads)
        addSubview(btnShows)
        
        btnEpisodes.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        btnEpisodes.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10).isActive = true
        btnEpisodes.heightAnchor.constraint(equalToConstant: 40).isActive = true
        btnEpisodes.widthAnchor.constraint(equalToConstant: 80).isActive = true
        
        btnDownloads.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        btnDownloads.leadingAnchor.constraint(equalTo: self.btnEpisodes.trailingAnchor, constant: 10).isActive = true
        btnDownloads.heightAnchor.constraint(equalToConstant: 40).isActive = true
        btnDownloads.widthAnchor.constraint(equalToConstant: 100).isActive = true

        btnShows.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        btnShows.leadingAnchor.constraint(equalTo: self.btnDownloads.trailingAnchor, constant: 10).isActive = true
        btnShows.heightAnchor.constraint(equalToConstant: 40).isActive = true
        btnShows.widthAnchor.constraint(equalToConstant: 80).isActive = true
               
        
        btnEpisodes.addTarget(self, action: #selector(onTapEpisodes), for: .touchUpInside)
        btnDownloads.addTarget(self, action: #selector(onTapDownloads), for: .touchUpInside)
        btnShows.addTarget(self, action: #selector(onTapShow), for: .touchUpInside)
        
        
        addSubview(collectionView)
        collectionView.register(PodCastGenericCell.self, forCellWithReuseIdentifier: identifier)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.topAnchor.constraint(equalTo: btnEpisodes.bottomAnchor).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 60).isActive = true
        
    }
    
    private func setNormalTitle(){
        btnEpisodes.setAttributedTitle(attrText(title: "Episodes", color: .lightGray), for: .normal)
        btnDownloads.setAttributedTitle(attrText(title: "Downloads", color: .lightGray), for: .normal)
        btnShows.setAttributedTitle(attrText(title: "Shows", color: .lightGray), for: .normal)
        
    }
    
    private func attrText(title: String, color: UIColor)-> NSAttributedString{
        let attrString = NSAttributedString(string: "\(title)", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 18), NSAttributedString.Key.foregroundColor: color])
        return attrString
    }
    
    
    @objc private func onTapEpisodes(){
        setNormalTitle()
        btnEpisodes.setAttributedTitle(attrText(title: "Episodes", color: .white), for: .normal)
        self.collectionView.scrollToItem(at: IndexPath(row: 0, section: 0), at: .centeredHorizontally, animated: true)
    }
    
    @objc private func onTapDownloads(){
           setNormalTitle()
           btnDownloads.setAttributedTitle(attrText(title: "Downloads", color: .white), for: .normal)
            self.collectionView.scrollToItem(at: IndexPath(row: 0, section: 1), at: .centeredHorizontally, animated: true)
       }
    
    @objc private func onTapShow(){
           setNormalTitle()
           btnShows.setAttributedTitle(attrText(title: "Shows", color: .white), for: .normal)
         self.collectionView.scrollToItem(at: IndexPath(row: 0, section: 2), at: .centeredHorizontally, animated: true)
       }
    
}


//MARK: - Collection View Functionality

extension PodcastContainerCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! PodCastGenericCell
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return collectionView.bounds.size
    }
    
    
}
