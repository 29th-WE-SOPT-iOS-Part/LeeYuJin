//
//  TabBarController.swift
//  Youtube-Clone
//
//  Created by 이유진 on 2021/10/22.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setTabBar()
        
    }
    
    func setTabBar(){
        guard let homeVC = self.storyboard?.instantiateViewController(identifier: "HomeVC"),
              let shortsVC = self.storyboard?.instantiateViewController(identifier: "ShortsVC"),
              let additionVC = self.storyboard?.instantiateViewController(identifier: "AdditionVC"),
              let subscribeVC = self.storyboard?.instantiateViewController(identifier: "SubscribeVC"),
              let libraryVC = self.storyboard?.instantiateViewController(identifier: "LibraryVC")
              else {return}
        
        homeVC.tabBarItem.title = "홈"
        homeVC.tabBarItem.image = UIImage(named: "homeIcon")
        homeVC.tabBarItem.selectedImage = UIImage(named: "homeIconFill")
        
        shortsVC.tabBarItem.title = "Shorts"
        shortsVC.tabBarItem.image = UIImage(named: "shortsIcon")
        shortsVC.tabBarItem.selectedImage = UIImage(named: "shortsIcon")
        
        additionVC.tabBarItem.title = "추가"
        additionVC.tabBarItem.image = UIImage(named: "plusCircleIcon")
        
        subscribeVC.tabBarItem.title = "구독"
        subscribeVC.tabBarItem.image = UIImage(named: "subscriptionsIcon")
        subscribeVC.tabBarItem.selectedImage = UIImage(named: "subscriptionsIconFill")
        
        libraryVC.tabBarItem.title = "보관함"
        libraryVC.tabBarItem.image = UIImage(named: "libraryIcon")
        libraryVC.tabBarItem.selectedImage = UIImage(named: "libraryIconFill")
        
        self.tabBar.tintColor = .black
        setViewControllers([homeVC,shortsVC,additionVC,subscribeVC,libraryVC], animated: true)
        
        
        
        
    }
    

   

}
