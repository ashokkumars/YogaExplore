//
//  Animation.swift
//  YogaExplore
//
//  Created by Ashok Kumar on 11/10/20.
//  Copyright © 2020 Ashok Kumar. All rights reserved.
//

import UIKit

class Animator: NSObject {

    func animateTabbar(tabbarController: UITabBarController, view: UIView) {
        
        let frame = tabbarController.tabBar.frame
        
        if frame.origin.y != view.frame.height - tabbarController.tabBar.frame.size.height {
            
            UIView.animate(
                withDuration: 0.5,
                delay: 0 ,
                usingSpringWithDamping: 1.0,
                initialSpringVelocity: 0.25,
                options: [.curveEaseInOut],
                animations: {
                    tabbarController.tabBar.frame = CGRect(x: 0, y: view.frame.height - tabbarController.tabBar.frame.size.height, width: tabbarController.tabBar.frame.width, height: tabbarController.tabBar.frame.height)
            })
        }
    }
}
