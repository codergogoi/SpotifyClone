//
//  PlayerContainerView.swift
//  SpotifyClone
//
//  Created by JAYANTA GOGOI on 1/2/20.
//  Copyright © 2020 JAYANTA GOGOI. All rights reserved.
//

import UIKit
import MediaPlayer


class PlayerContainerView : UITabBarController {
    
    var viewModel = PlayerContainerViewModel()
    
    var player: StreamingPlayer!
    var miniPlayer: MiniPlayer!
    var miniPlayerHightConst = NSLayoutConstraint()
    
    var isPlaying = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTabViewControllers()
        self.setupMiniPlayer()
        self.setupPlayer()
        self.playNow()
        
    }
    
    
    /* Setup TabViewControllers  : by - Jayanta
     * @parameters required: N/A
     * @return type or Object: Void
     */
    private func setupTabViewControllers(){
        self.view.backgroundColor = UIColor.rgba(r: 0, g: 0, b: 0, a: 0.8)
            self.view.layer.insertSublayer(UIColor.gradientBg(self.view), at: 0)
            let homeController = HomeViewController()
            homeController.onTapAction = {
                print("hello")
            }
        
           viewControllers = [
            addNavigationCongtroller(vc: HomeViewController(), title: "Home", icon: #imageLiteral(resourceName: "tb_home")) ,
               addNavigationCongtroller(vc: SearchViewController(), title: "Search", icon: #imageLiteral(resourceName: "tb_search")) ,
               addNavigationCongtroller(vc: homeController, title: "Your Library", icon: #imageLiteral(resourceName: "tb_library")) ,
               addNavigationCongtroller(vc: homeController, title: "Premium", icon: #imageLiteral(resourceName: "tb_icon_premium")) ,
               ]
            
           tabBar.barTintColor =  UIColor.rgba(r: 40, g: 40, b: 40, a: 1)
           tabBar.tintColor = .white
           tabBar.isTranslucent = false
        UITabBar.appearance().backgroundColor = UIColor.rgba(r: 40, g: 40, b: 40, a: 1)
    }
    
    
    private func addNavigationCongtroller(vc: UIViewController, title: String, icon: UIImage ) -> UINavigationController {
        let navController = UINavigationController(rootViewController: vc)
        navController.tabBarItem.title = title
        navController.tabBarItem.image = icon
        return navController
    }
    
    /* Setup Player while Tap on Track  : by - Jayanta
     * @parameters required: n/a
     * @return type or Object: void
     */
    private func setupMiniPlayer(){
        miniPlayer = MiniPlayer()
        self.view.addSubview(miniPlayer)
        self.view.addConstraintWithFormat(formate: "H:|[v0]|", views: miniPlayer)
        if self.isSafeArea(){ // iPhone 10 or above
           self.view.addConstraintWithFormat(formate: "V:[v0]-83.5-|", views: miniPlayer)
        }else{ // iphone 8 or below
            self.view.addConstraintWithFormat(formate: "V:[v0]-49-|", views: miniPlayer)
        }
        miniPlayerHightConst = miniPlayer.heightAnchor.constraint(equalToConstant: 60)
        miniPlayer.addConstraint(miniPlayerHightConst)
        miniPlayer.isHidden = false
        handleMiniPlayerCallBacks()
    }
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        print("selected View Controller \(item)")
    }
    
}

//MARK: - MiniPlayer Callback
extension PlayerContainerView {
    
    private func handleMiniPlayerCallBacks(){
        
        //todo: connect with popup modal
        miniPlayer.didMakeFavorite = { [weak self] in
            
            print("Did Make fav .. show modal ")
        }
        
        miniPlayer.didTapOnPlayPause = { [weak self] isPlaying in
            
            self?.isPlaying =  isPlaying
            
        }
        
        
    }
    
}


//MARK: - Player Configure
extension PlayerContainerView{
 
    
    private func setupPlayer(){
        setSession()
        UIApplication.shared.beginReceivingRemoteControlEvents()
        _ = becomeFirstResponder()
        self.player = StreamingPlayer()
    }
        
    private func setSession(){
        
        do{
            try AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.playback)
        }catch let sessionErr{
            print(sessionErr.localizedDescription)
        }
    }
    
    private func setupNotifications(){
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(handleInterruption(notification:)), name: AVAudioSession.interruptionNotification, object: nil)
    }
    
    @objc func handleInterruption(notification: Notification){
           
           guard let userInfo = notification.userInfo, let typeValue = userInfo[AVAudioSessionInterruptionOptionKey] as? UInt, let notificationType = AVAudioSession.InterruptionType(rawValue: typeValue) else {
               return
           }
           
           if notificationType == .began {
               self.player.pauseAudio()
           }else if notificationType == .ended {
               self.player.playAudio()
           }
           
       }
    
    override func becomeFirstResponder() -> Bool {
        return true
    }
    
    
}

//MARK: - Player Control
extension PlayerContainerView{
    
    func playNow(){
        self.player.playStream(fileURL: "http://jayantagogoi.com/app/ios/music_app/tracks/bensound-allthat.mp3")
        self.changePlayerUI()
    }
    
    func pausePlay(){
        
    }
    
    override func remoteControlReceived(with event: UIEvent?) {
        
        if event?.type == UIEvent.EventType.remoteControl{
                    
           if event?.subtype == .some(.remoteControlPause) {
               self.player.pauseAudio()
           }else if event?.subtype == .some(.remoteControlPlay) {
               self.player.playAudio()
           }else if event?.subtype  == .some(.remoteControlNextTrack){
                // play next track
           }else if event?.subtype == .some(.remoteControlPreviousTrack){
                //play previous Track
            }
        }
    }
    
    
    private func changePlayerUI(){
        
        if self.player.avPlayer.rate > 0 {
            //pause Button
        }else{
            // play button
        }
    }
    
}

//MARK: - Player Container Delegate
extension PlayerContainerView: PlayerControllerDelegate {
    
    func onTapTrack() {
        print("Working  as expected")
    }
    
}

