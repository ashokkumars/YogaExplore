//
//  TabbarController.swift
//  YogaExplore
//
//  Created by Ashok Kumar on 06/10/20.
//  Copyright © 2020 Ashok Kumar. All rights reserved.
//

import UIKit

class TabbarController: UITabBarController {

    @IBOutlet weak var customTabbar: CustomTabbar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidLayoutSubviews() {
        
        if Constants().shouldRepositionTabbar {
            var frame = tabBar.frame
            frame.origin.y = view.frame.height / 2
            tabBar.frame = frame
        }
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        tabBar.frame.size.height = tabBar.frame.size.height + 20
        tabBar.frame.origin.y = view.frame.height - tabBar.frame.size.height
        
        if Constants.safeAreaInsets == 0 {
            UITabBarItem.appearance().titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -10)
        } else {
            UITabBarItem.appearance().titlePositionAdjustment = UIOffset(horizontal: 0, vertical: 0)
        }
    }
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        Animator().animateTabbar(tabbarController: self, view: self.view)
    }

}

