//
//  LibraryViewController.swift
//  SpotifyClone
//
//  Created by JAYANTA GOGOI on 1/23/20.
//  Copyright © 2020 JAYANTA GOGOI. All rights reserved.
//

import UIKit

class LibraryViewController: UIViewController {

    let btnMusic: UIButton = {
        let btn = UIButton()
        let attrText = NSAttributedString(string: "Music", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 28), NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        btn.setAttributedTitle(attrText, for: .normal)
        btn.noAutoConst()
        return btn
    }()
    
    let btnPodcaste: UIButton = {
       let btn = UIButton()
       let attrText = NSAttributedString(string: "Podcasts", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 28), NSAttributedString.Key.foregroundColor: UIColor.lightGray])
       btn.setAttributedTitle(attrText, for: .normal)
       btn.noAutoConst()
       return btn
   }()
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collView.isPagingEnabled = true
        collView.isScrollEnabled = false
        collView.backgroundColor = .clear
        collView.noAutoConst()
        return collView
    }()
    
    var isMusic = false
    
    let musicIdentifier = "musicIdentifier"
    let podcaseIdentifier = "podcastIdentifier"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        self.didChangeOptions()
        setupView()
        setupCollectionView()
        // Do any additional setup after loading the view.
    }
    
    private func setupView(){
        view.addSubview(btnMusic)
        btnMusic.addTarget(self, action: #selector(onTapMusic(_:)), for: .touchUpInside)
        view.addSubview(btnPodcaste)
        btnPodcaste.addTarget(self, action: #selector(onTapPodcasts(_:)), for: .touchUpInside)
        btnMusic.topAnchor.constraint(equalTo: view.topAnchor, constant: 60).isActive = true
        btnMusic.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        btnMusic.heightAnchor.constraint(equalToConstant: 40).isActive = true
        btnMusic.widthAnchor.constraint(equalToConstant: 100).isActive = true
        btnPodcaste.topAnchor.constraint(equalTo: view.topAnchor, constant: 60).isActive = true
        btnPodcaste.leadingAnchor.constraint(equalTo: btnMusic.trailingAnchor, constant: 5).isActive = true
        btnPodcaste.heightAnchor.constraint(equalToConstant: 40).isActive = true
        btnPodcaste.widthAnchor.constraint(equalToConstant: 140).isActive = true
    }
    
    private func setupCollectionView(){
        view.addSubview(collectionView)
        collectionView.register(MusicContainerCell.self, forCellWithReuseIdentifier: musicIdentifier)
        collectionView.register(PodcastContainerCell.self, forCellWithReuseIdentifier: podcaseIdentifier)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.topAnchor.constraint(equalTo: btnMusic.bottomAnchor, constant: 10).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10).isActive = true
    }
    
    private func didChangeOptions(){
        isMusic.toggle()
        if isMusic {
            self.btnMusic.setAttributedTitle(attrText(title: "Music", color: .white), for: .normal)
            self.btnPodcaste.setAttributedTitle(attrText(title: "Podcasts", color: .lightGray), for: .normal)
        }else{
            self.btnMusic.setAttributedTitle(attrText(title: "Music", color: .lightGray), for: .normal)
            self.btnPodcaste.setAttributedTitle(attrText(title: "Podcasts", color: .white), for: .normal)
        }
    }
    
    private func attrText(title: String, color: UIColor)-> NSAttributedString{
        let attrString = NSAttributedString(string: "\(title)", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 28), NSAttributedString.Key.foregroundColor: color])
        return attrString
    }

}


//MARK: - onTap Actions

extension LibraryViewController {
        
    @objc func onTapMusic(_ sender:  UIButton){
        sender.onTapAnimation()
        self.didChangeOptions()
        collectionView.scrollToItem(at: IndexPath(row: 0, section: 0), at: .centeredHorizontally, animated: true)
    }

    @objc func onTapPodcasts(_ sender:  UIButton){
        sender.onTapAnimation()
        self.didChangeOptions()
        collectionView.scrollToItem(at: IndexPath(row: 0, section: 1), at: .centeredHorizontally, animated: true)

    }
}


//MARK: - Collection View Functionality

extension LibraryViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.section == 0{
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: musicIdentifier, for: indexPath) as! MusicContainerCell
            
            return cell
        }
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: podcaseIdentifier, for: indexPath) as! PodcastContainerCell
                      
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return collectionView.bounds.size
    }
    
    
}
