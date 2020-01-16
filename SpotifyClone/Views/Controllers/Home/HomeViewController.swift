//
//  HomeViewController.swift
//  SpotifyClone
//
//  Created by JAYANTA GOGOI on 1/2/20.
//  Copyright © 2020 JAYANTA GOGOI. All rights reserved.
//

import UIKit

class HomeViewController : UIViewController {
    
    var delegate: PlayerControllerDelegate?
    var viewModel: HomeViewModel!
    
    var onTapAction: (()->())?
    
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
        collView.backgroundColor = .clear
        return collView
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .red

        self.viewModel = HomeViewModel()
         
        self.navigationController?.navigationBar.isHidden = true
        self.view.backgroundColor = UIColor.clear
        
        UITabBar.appearance().backgroundColor = UIColor.rgba(r: 40, g: 40, b: 40, a: 1)
    
        self.view.addSubview(tracksCollectionView)
        self.view.addConstraintWithFormat(formate: "H:|[v0]|", views: tracksCollectionView)
        self.view.addConstraintWithFormat(formate: "V:|[v0]|", views: tracksCollectionView)
        tracksCollectionView.register(RecentyPlayedCell.self, forCellWithReuseIdentifier: SectionType.RecentlyPlayed.rawValue)
        tracksCollectionView.register(HeavyRotationCell.self, forCellWithReuseIdentifier: SectionType.HeavyRotation.rawValue)
        tracksCollectionView.register(MadeForYouCell.self, forCellWithReuseIdentifier: SectionType.MadeForYou.rawValue)
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
    
   
    
}
 


//MARK: - Collection View Functionality

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return self.viewModel.numbersOfSection
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        let dataModel = self.viewModel.categoryForSection(section: indexPath.section)
        
        switch dataModel.type {
            case .HeavyRotation:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SectionType.HeavyRotation.rawValue, for: indexPath) as! HeavyRotationCell
                return cell
            case .MadeForYou:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SectionType.MadeForYou.rawValue, for: indexPath) as! MadeForYouCell
                return cell
            default:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SectionType.RecentlyPlayed.rawValue, for: indexPath) as! RecentyPlayedCell
                cell.onTapSelection = { [weak self] in
                    self?.viewTrackDetails()
                }
                return cell
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
       return CGSize(width: collectionView.frame.size.width, height: self.viewModel.sectionHeight(section: indexPath.section))
        
    }

  
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        return 50
    }
    
}


extension HomeViewController {
    
    private func viewTrackDetails(){
        self.delegate?.onTapTrack()
        let trackDetailsVC = TrackDetailsViewController()
        self.navigationController?.pushViewController(trackDetailsVC, animated: true)
    }
    
    
}
