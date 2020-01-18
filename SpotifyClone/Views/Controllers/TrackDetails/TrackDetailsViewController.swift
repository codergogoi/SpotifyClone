//
//  TrackDetailsViewController.swift
//  SpotifyClone
//
//  Created by JAYANTA GOGOI on 1/2/20.
//  Copyright © 2020 JAYANTA GOGOI. All rights reserved.
//
 
import UIKit
 

class TrackDetailsViewController: UIViewController {
    
    var heightConst = NSLayoutConstraint()
    
    let navigationView: UIView = {
        let view = UIView()
        return view
    }()
    
    let searchFilterView: UIView = {
        let view = UIView()
        return view
    }()
    
    var isHide = true
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection =  .vertical
        layout.sectionHeadersPinToVisibleBounds = true
        let collView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collView.backgroundColor = .clear
        return collView
    }()
    
    let identifierTrackOverview = "trackOverview"
    let identifierHeaderTrackDetails = "headerTrackDetails"
    let identifierHeaderShufflePlay = "headerShufflePlay"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.layer.insertSublayer(UIColor.gradientBg(self.view), at: 0)
        self.view.addSubview(navigationView)
        self.view.addSubview(searchFilterView)
        self.view.addSubview(collectionView)
        self.view.addConstraintWithFormat(formate: "H:|[v0]|", views: navigationView)
        self.view.addConstraintWithFormat(formate: "H:|[v0]|", views: searchFilterView)
        self.view.addConstraintWithFormat(formate: "H:|[v0]|", views: collectionView)
        self.view.addConstraintWithFormat(formate: "V:|[v0(84)]-5-[v1]-5-[v2]|", views: navigationView,searchFilterView,collectionView)
        self.heightConst = searchFilterView.heightAnchor.constraint(equalToConstant: 0)
        searchFilterView.addConstraint(self.heightConst)
        collectionView.register(TrackOverviewCell.self, forCellWithReuseIdentifier: identifierTrackOverview)
        collectionView.register(TrackDetailsHeaderCell.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: identifierHeaderTrackDetails)
        collectionView.register(ShufflePlayHeaderaCell.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: identifierHeaderShufflePlay)
        collectionView.delegate = self
        collectionView.dataSource = self
        
        setupNavigationView()
        setupSearchFilterVeiw()
    }
    
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
           navigationView.addConstraint(NSLayoutConstraint(item: btnFav, attribute: .centerY, relatedBy: .equal, toItem: navigationView, attribute: .centerY, multiplier: 1, constant: 15))
           navigationView.addConstraint(NSLayoutConstraint(item: btnBack, attribute: .centerY, relatedBy: .equal, toItem: navigationView, attribute: .centerY, multiplier: 1, constant: 15))
           
       }
    
    private func setupSearchFilterVeiw(){
        
        let searchBtn = UIButton()
        searchBtn.layer.backgroundColor = UIColor.rgba(r: 255, g: 255, b: 255, a: 0.1).cgColor
        searchBtn.layer.cornerRadius = 5
        searchBtn.tintColor = .white
        searchBtn.contentHorizontalAlignment = .left
        let img = UIImage(named: "tb_search")!
        img.withRenderingMode(.alwaysTemplate)
        let attachment = NSTextAttachment(image: img)
        attachment.bounds = CGRect(x: 0, y: -5, width: 15, height: 15)
        let attrString = NSMutableAttributedString(attributedString: NSAttributedString(attachment: attachment))
        attrString.append(NSAttributedString(string: " Find in playlist", attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 16), NSAttributedString.Key.foregroundColor: UIColor.rgba(r: 255, g: 255, b: 255, a: 0.4)]))
        searchBtn.setAttributedTitle(attrString, for: .normal)
        let filterButton = UIButton()
        filterButton.layer.backgroundColor = UIColor.rgba(r: 255, g: 255, b: 255, a: 0.1).cgColor
        filterButton.layer.cornerRadius = 5
        filterButton.setTitleColor(.white, for: .normal)
        filterButton.setTitle("Filters", for: .normal)
        searchFilterView.addSubview(searchBtn)
        searchFilterView.addSubview(filterButton)
        searchFilterView.addConstraintWithFormat(formate: "H:|-10-[v0]-10-[v1(80)]-10-|", views: searchBtn, filterButton)
        searchFilterView.addConstraintWithFormat(formate: "V:|[v0]|", views: searchBtn)
        searchFilterView.addConstraintWithFormat(formate: "V:|[v0]|", views: filterButton)

    }
    
       @objc func onTapBack(){
           self.navigationController?.popViewController(animated: true)
           
       }

}



//MARK: - Collection View Functionality

extension TrackDetailsViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return section == 0 ? 0 : 20
    }
    
  
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
         
         let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifierTrackOverview, for: indexPath) as! TrackOverviewCell
         
         return cell
     }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionView.frame.size.width, height: 60)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
    
        return CGSize(width: collectionView.frame.size.width, height: section == 0 ? 320 : 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        if kind == UICollectionView.elementKindSectionHeader {
            if indexPath.section == 0 {
                if let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: identifierHeaderTrackDetails, for: indexPath) as? TrackDetailsHeaderCell {
                    return header
                }
                
            }else{
                if let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: identifierHeaderShufflePlay, for: indexPath) as? ShufflePlayHeaderaCell {
                   return header
               }
            }
            
        }
        return UICollectionReusableView()
        
    }
    
   
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
                
        if scrollView.panGestureRecognizer.translation(in: scrollView.subviews.last).y > 100 { // > 0 swipe down
            if self.isHide{
                self.isHide = false
                self.heightConst.constant = 40
                
                UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseOut, animations: {
                    self.view.layoutIfNeeded()
                }, completion: nil)
            }
        }else{ // swipe up
            if !self.isHide{
                self.isHide = true
            self.heightConst.constant = 0
            UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseOut, animations: {
                self.view.layoutIfNeeded()
            }, completion: nil)        }
        }
        
    }

    
}
