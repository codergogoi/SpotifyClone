//
//  HeavyRotationCell.swift
//  SpotifyClone
//
//  Created by JAYANTA GOGOI on 1/2/20.
//  Copyright © 2020 JAYANTA GOGOI. All rights reserved.
//

import UIKit

  
class HeavyRotationTrackCell: CollectionBaseCell {
      override func setupView() {
          self.addSubview(imgArtwork)
          self.addSubview(title)
          self.addSubview(subTitle)
          self.addConstraintWithFormat(formate: "H:|[v0]|", views: imgArtwork)
          self.addConstraintWithFormat(formate: "H:|-10-[v0]-10-|", views: title)
          self.addConstraintWithFormat(formate: "H:|-10-[v0]-10-|", views: subTitle)
          self.addConstraintWithFormat(formate: "V:|[v0]-5-[v1(20)]-5-[v2(15)]|", views: imgArtwork, title, subTitle)
      
          updateUI()
      }
      
      private func updateUI(){
          
          imgArtwork.image = #imageLiteral(resourceName: "collection_default")
          title.text = "Baah Milkha Bgagg(nice song"
          subTitle.text = "Shankar-Ehsaan Loy and others"
          
      }
}


class HeavyRotationCell: CollectionBaseCell {
    
    let lblSectionTitle: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont.boldSystemFont(ofSize: 26)
        lbl.text = "Your Heavy rotation"
        lbl.textColor = .white
        return lbl
    }()
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collView.contentInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
        collView.showsHorizontalScrollIndicator = false
        collView.backgroundColor = .clear
        return collView
    }()
    
    override func setupView() {
        self.addSubview(lblSectionTitle)
        self.addSubview(collectionView)
        self.collectionView.register(HeavyRotationTrackCell.self, forCellWithReuseIdentifier: "heavyTrackCell")
        self.addConstraintWithFormat(formate: "H:|[v0]|", views: collectionView)
        self.addConstraintWithFormat(formate: "H:|-15-[v0]|", views: lblSectionTitle)
        self.addConstraintWithFormat(formate: "V:|-10-[v0(40)]-20-[v1]|", views: lblSectionTitle, collectionView)
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
    }
    
}


//MARK: - Collection View Functionality

extension HeavyRotationCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "heavyTrackCell", for: indexPath) as! HeavyRotationTrackCell
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionView.frame.size.height - 40, height: collectionView.frame.size.height )
    }
    
    
}
