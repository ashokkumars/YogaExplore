//
//  CustomTabbar.swift
//  YogaExplore
//
//  Created by Ashok Kumar on 06/10/20.
//  Copyright © 2020 Ashok Kumar. All rights reserved.
//

import UIKit

@IBDesignable
class CustomTabbar: UITabBar {
    
    private var _view: UIView!
    private var shapeLayer: CALayer?
        
    func addShapeLayer() {
        
        _view = UIView()
        _view.frame = self.bounds
        _view.layer.cornerRadius = 40
        _view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        _view.translatesAutoresizingMaskIntoConstraints = false
        _view.layer.masksToBounds = false
        _view.backgroundColor = UIColor.white
        
        _view.dropShadow(color: UIColor.gray, opacity: 0.1, offSet: CGSize(width: 0, height: -7), radius: 5.0, scale: true)
        self.addSubview(_view)
        self.sendSubviewToBack(_view)
    }
    
    override func draw(_ rect: CGRect) {
        self.addShapeLayer()
    }
}

