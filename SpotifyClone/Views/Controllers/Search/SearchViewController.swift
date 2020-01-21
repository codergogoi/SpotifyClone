//
//  SearchViewController.swift
//  SpotifyClone
//
//  Created by JAYANTA GOGOI on 1/16/20.
//  Copyright © 2020 JAYANTA GOGOI. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {

    var delegate: PlayerControllerDelegate?
    let identifierSearchField = "searchFieldIdentifier"
    let identifierHeader = "headerCell"
    let identifierGenre = "genreCell"
    
    let categories = ["Your top genres", "Browse all"]
    
       let spacing: CGFloat = 16
       
       let collectionView: UICollectionView = {
           let layout = UICollectionViewFlowLayout()
           layout.scrollDirection =  .vertical
           layout.sectionInset = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
           layout.minimumLineSpacing = 16
           layout.minimumInteritemSpacing = 16
           let collView = UICollectionView(frame: .zero, collectionViewLayout: layout)
           return collView
       }()
       
       let headerView: UIView = {
           let view = UIView()
           view.backgroundColor = .lightGray
           return view
       }()
       
       
       override func viewDidLoad() {
           super.viewDidLoad()

           view.addSubview(collectionView)
           view.addConstraintWithFormat(formate: "H:|[v0]|", views: collectionView)
           view.addConstraintWithFormat(formate: "H:|[v0]|", views: collectionView)
           
           self.view.addSubview(collectionView)
           self.view.addConstraintWithFormat(formate: "H:|[v0]|", views: collectionView)
           self.view.addConstraintWithFormat(formate: "V:|[v0]|", views: collectionView)
           collectionView.register(GenreCell.self, forCellWithReuseIdentifier: identifierGenre)
           collectionView.register(HeaderCellWithSearch.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier:identifierSearchField)
           collectionView.register(SearchHeaderTitle.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: identifierHeader)
           collectionView.delegate = self
           collectionView.dataSource = self
           
           collectionView.addSubview(headerView)
           collectionView.addConstraintWithFormat(formate: "H:|[v0]|", views: headerView)
           collectionView.addConstraintWithFormat(formate: "V:|[v0(100)]", views: headerView)
           
       }
    
}


//MARK: - Collection View Functionality

extension SearchViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
            
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return section == 0 ? 0 : ( section == 1 ? 4 : 16)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifierGenre, for: indexPath) as! GenreCell
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let numbersOfRow: CGFloat = 2
        let spaceBetweenCell: CGFloat = 16
        
        let totalSpacing = (2 * self.spacing) + ((numbersOfRow - 1) * spaceBetweenCell)
        
        let width = (collectionView.bounds.width - totalSpacing) / numbersOfRow
        
        return CGSize(width: width, height: 90)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        
        if kind == UICollectionView.elementKindSectionHeader {
            
            if indexPath.section == 0{
                let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: identifierSearchField, for: indexPath) as! HeaderCellWithSearch
                return headerView
            }
               
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: identifierHeader, for: indexPath) as! SearchHeaderTitle
            headerView.category = self.categories[indexPath.section - 1]
            return headerView
        
        }
        return UICollectionReusableView()
        
    }
     
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        
        return CGSize(width: collectionView.frame.size.width, height: section == 0 ? 100 : 40)
        
    }
    

    
}


