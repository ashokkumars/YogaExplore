//
//  ChatsViewController.swift
//  YogaExplore
//
//  Created by Ashok Kumar on 10/10/20.
//  Copyright © 2020 Ashok Kumar. All rights reserved.
//

import UIKit

class ChatsViewController: UIViewController {
    
    @IBOutlet weak var informationLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        informationLabel.attributedText = getMessage()
    }
    
    fileprivate func getMessage() -> NSAttributedString {
        
        let _description = NSMutableAttributedString()
        
        let title = NSAttributedString(string: Constants.Generic.chat_screen_title, attributes: [NSAttributedString.Key.font : UIFont.bold(ofSize: 22), NSAttributedString.Key.foregroundColor: UIColor.palova])
        
        let message = NSAttributedString(string: Constants.Generic.message, attributes: [NSAttributedString.Key.font : UIFont.regular(ofSize: 16), NSAttributedString.Key.foregroundColor: UIColor.suva])
        
        _description.append(title)
        _description.append(NSAttributedString(string: "\n\n\n"))
        _description.append(message)
        
        return _description
    }
    
}
