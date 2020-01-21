//
//  PlanSelectionCell.swift
//  SpotifyClone
//
//  Created by JAYANTA GOGOI on 1/21/20.
//  Copyright © 2020 JAYANTA GOGOI. All rights reserved.
//

import UIKit


class PlanSelectionCell: UICollectionViewCell {
    
    private let lblHeadline: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont.boldSystemFont(ofSize: 16)
        lbl.textAlignment = .center
        lbl.text = "Get more out of your music with Premium"
        lbl.textColor = .white
        return lbl
    }()
    
    let pageController: UIPageViewController = {
        let pc = UIPageViewController(transitionStyle: UIPageViewController.TransitionStyle.scroll, navigationOrientation: UIPageViewController.NavigationOrientation.horizontal, options: nil)
        pc.view.backgroundColor = .lightGray
        return pc
    }()
    
    let pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.tintColor = .lightGray
        pageControl.currentPageIndicatorTintColor = .white
        return pageControl
    }()
    
    let planes = ["Addfree Music", "Offline Listining", "Best quality Audio"]
    
    var availableControllers = [UIViewController]()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.randomColor()
        self.clipsToBounds = true
        self.addSubview(lblHeadline)
        self.addSubview(pageController.view)
        self.addSubview(pageControl)
        self.pageController.delegate = self
        self.pageController.dataSource = self
        self.addConstraintWithFormat(formate: "H:|[v0]|", views: lblHeadline)
        self.addConstraintWithFormat(formate: "V:|-50-[v0(50)][v1]|", views: lblHeadline, pageController.view)
        self.addConstraintWithFormat(formate: "H:|[v0]|", views: pageController.view)
        self.addConstraintWithFormat(formate: "H:|-50-[v0]-50-|", views: pageControl)
        self.addConstraintWithFormat(formate: "V:[v0(40)]-50-|", views: pageControl)
        self.availableControllers = [UIViewController(), UIViewController(), UIViewController()]
        pageController.setViewControllers([planForIndex(index: 0)], direction: .forward, animated: true, completion: nil)
        pageControl.numberOfPages = 3
        
     }
    
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    
}

//MARK: - Create Different Plan Views
extension PlanSelectionCell {
    
    fileprivate func planForIndex(index: Int) -> UIViewController{
        
        let viewController = availableControllers[index]
        viewController.view.backgroundColor = UIColor.randomColor()
        return viewController
        
    }
    
}


extension PlanSelectionCell : UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    
      func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
          
          guard let viewConntrollerIndex = availableControllers.firstIndex(of: viewController) else {
              return nil
          }
          
          let prevIndex = viewConntrollerIndex - 1
          
          guard prevIndex >= 0 else {
              return nil
          }
          
          guard availableControllers.count > prevIndex  else {
              return nil
          }

          return availableControllers[prevIndex]
      }
      
      
      func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
          
          guard let viewConntrollerIndex = availableControllers.firstIndex(of: viewController) else {
                     return nil
                 }
                 
         let nextIndex = viewConntrollerIndex + 1
         
          guard availableControllers.count != nextIndex else {
             return nil
         }
         
         guard availableControllers.count > nextIndex  else {
             return nil
         }

          return availableControllers[nextIndex]
      
      }
      
      func presentationCount(for pageViewController: UIPageViewController) -> Int {

          return self.availableControllers.count
      }

     
      
      func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        
         guard let firstViewController = pageViewController.viewControllers?.first, let firstControllerIndex = availableControllers.firstIndex(of: firstViewController) else {
                return
          }
                 
         self.pageControl.currentPage = firstControllerIndex
          

      }

    
}

