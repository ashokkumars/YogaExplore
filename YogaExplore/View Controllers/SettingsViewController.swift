//
//  SettingsViewController.swift
//  YogaExplore
//
//  Created by Ashok Kumar on 10/10/20.
//  Copyright © 2020 Ashok Kumar. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var informationLabel: UILabel!
    @IBOutlet weak var tabbarSwitch: UISwitch!
    @IBOutlet weak var backbuttonSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        informationLabel.attributedText = getMessage()
        
        setupViews()
    }
    
    fileprivate func getMessage() -> NSAttributedString {
        
        let _description = NSMutableAttributedString()
        
        let title = NSAttributedString(string: Constants.Generic.settings_screen_title, attributes: [NSAttributedString.Key.font : UIFont.bold(ofSize: 22), NSAttributedString.Key.foregroundColor: UIColor.palova])
        
        let message = NSAttributedString(string: Constants.Generic.message, attributes: [NSAttributedString.Key.font : UIFont.regular(ofSize: 16), NSAttributedString.Key.foregroundColor: UIColor.suva])
        
        _description.append(title)
        _description.append(NSAttributedString(string: "\n\n\n"))
        _description.append(message)
        
        return _description
    }
    
    fileprivate func setupViews() {
        tabbarSwitch.onTintColor = UIColor.palova
        tabbarSwitch.tintColor = UIColor.palova
        backbuttonSwitch.tintColor = UIColor.palova
        backbuttonSwitch.onTintColor = UIColor.palova
        
        tabbarSwitch.setOn(!Constants().shouldRepositionTabbar, animated: false)
        backbuttonSwitch.setOn(Constants().shouldMoveBackButtonWithImage, animated: false)
    }
    
    @IBAction func didChangeTabbarSwitch(_ sender: UISwitch) {
        Constants().shouldRepositionTabbar = !sender.isOn
    }
    
    @IBAction func didChangeBackButtonSwitch(_ sender: UISwitch) {
        Constants().shouldMoveBackButtonWithImage = sender.isOn
    }
}
