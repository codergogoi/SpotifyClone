//
//  HomeViewModel.swift
//  SpotifyClone
//
//  Created by JAYANTA GOGOI on 1/2/20.
//  Copyright © 2020 JAYANTA GOGOI. All rights reserved.
//

import UIKit

struct HomeViewModel {
    
    private var categories: [MusicCategory] = []
    
    init(){
        
        self.categories = [
            MusicCategory(type: .RecentlyPlayed, sectionHeight: 240),
            MusicCategory(type: .HeavyRotation, sectionHeight: 280),
            MusicCategory(type: .MadeForYou, sectionHeight: 280)
        ]
    }
    
    var numbersOfSection: Int {
        return self.categories.count
    }
    
    
    func categoryForSection(section: Int) -> MusicCategory {
        return self.categories[section]
    }
    
    func sectionHeight(section: Int)-> CGFloat{
        return self.categories[section].sectionHeight
    }
    
    
}
