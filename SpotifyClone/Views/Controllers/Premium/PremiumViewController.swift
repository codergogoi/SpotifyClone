//
//  PremiumViewController.swift
//  SpotifyClone
//
//  Created by JAYANTA GOGOI on 1/21/20.
//  Copyright © 2020 JAYANTA GOGOI. All rights reserved.
//

import UIKit

class PremiumViewController: UIViewController {
  
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collView.backgroundColor = UIColor.rgba(r: 0, g: 0, b: 0, a: 1)
        return collView
    }()
   
    let identifierPlanSelect = "planSelectionSuggestion"
    let identifierCurrentPlan = "currentPlan"
    let identifierAvailablePlan = "availablePlan"
    
    fileprivate func setupCollectionView(){
        view.addSubview(collectionView)
        view.addConstraintWithFormat(formate: "H:|[v0]|", views: collectionView)
        view.addConstraintWithFormat(formate: "V:|[v0]|", views: collectionView)
        collectionView.register(PlanSelectionCell.self, forCellWithReuseIdentifier: identifierPlanSelect)
        collectionView.register(CurrentPlanCell.self, forCellWithReuseIdentifier: identifierCurrentPlan)
        collectionView.register(AvailablePlanCell.self, forCellWithReuseIdentifier: identifierAvailablePlan)
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
    }
}


//MARK: - Collection View Functionality

extension PremiumViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return section == 2 ? 3 : 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.section == 2 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifierAvailablePlan, for: indexPath) as! AvailablePlanCell
            return cell
        }else if indexPath.section == 1 {
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifierCurrentPlan, for: indexPath) as! CurrentPlanCell
            return cell
        }
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifierPlanSelect, for: indexPath) as! PlanSelectionCell
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    
        return CGSize(width: collectionView.frame.size.width, height: indexPath.section == 0 ? 400 : (indexPath.section == 1 ? 90 : 180))
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    
        return 20
    }
    
     

    
}
