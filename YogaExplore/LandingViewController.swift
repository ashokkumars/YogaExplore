//
//  LandingViewController.swift
//  YogaExplore
//
//  Created by Ashok Kumar on 06/10/20.
//  Copyright © 2020 Ashok Kumar. All rights reserved.
//

import UIKit

class LandingViewController: UIViewController {

    @IBOutlet weak var startButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        startButton.layer.cornerRadius = startButton.frame.height / 2
        startButton.layer.masksToBounds = false
        startButton.dropShadow(color: UIColor.palova, opacity: 0.7, offSet: CGSize(width: 0, height: 4), radius: 6.0, scale: true)
    }
    

    @IBAction func didTapStartButton(_ sender: UIButton) {
        performSegue(withIdentifier: "LaunchYoga", sender: nil)
    }
}
