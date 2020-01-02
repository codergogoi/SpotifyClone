//
//  HomeViewController.swift
//  SpotifyClone
//
//  Created by JAYANTA GOGOI on 1/2/20.
//  Copyright © 2020 JAYANTA GOGOI. All rights reserved.
//

import UIKit

enum SectionType{
    case RecentlyPlayed
    case HeavyRotation
    case MadeForYou
    case Recomandation
    case PopularSongs
    case TopMusics
    case FavArtist
}



class HomeViewController : UIViewController {
    
    let NavbarView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(white: 0.9, alpha: 1.0)
        return view
    }()
    
    var heightConst = NSLayoutConstraint()
    
    var isCollapse = false
    
    let tracksCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection =  .vertical
        let collView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        return collView
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        self.view.backgroundColor =  UIColor.rgba(r: 20, g: 20, b: 20, a: 1)
         UITabBar.appearance().backgroundColor = UIColor.rgba(r: 40, g: 40, b: 40, a: 1)
    
        self.view.addSubview(tracksCollectionView)
        self.view.addConstraintWithFormat(formate: "H:|[v0]|", views: tracksCollectionView)
        self.view.addConstraintWithFormat(formate: "V:|[v0]|", views: tracksCollectionView)
        tracksCollectionView.register(RecentyPlayedCell.self, forCellWithReuseIdentifier: "cell")
        tracksCollectionView.delegate = self
        tracksCollectionView.dataSource = self
        
    }
     
    
    func onUpdateNavBar(_ swipeUp: Bool = false){
        
        self.NavbarView.removeConstraint(self.heightConst)
        
        UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.9, options: .curveEaseInOut, animations: {
            
                if swipeUp {
                    self.heightConst = self.NavbarView.heightAnchor.constraint(equalToConstant: 100)
                }else{
                    self.heightConst = self.NavbarView.heightAnchor.constraint(equalToConstant: 160)
                }
               
               self.NavbarView.addConstraint(self.heightConst)
               
            self.view.layoutIfNeeded()
            
        }, completion: nil)
        
    }
    
    private func setupCollectionView(){
        
    }
    
}
 


//MARK: - Collection View Functionality

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! RecentyPlayedCell
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionView.frame.size.width, height: 240)
    }
    
    
}
