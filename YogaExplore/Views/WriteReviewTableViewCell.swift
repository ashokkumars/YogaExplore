//
//  WriteReviewTableViewCell.swift
//  YogaExplore
//
//  Created by Ashok Kumar on 10/10/20.
//  Copyright © 2020 Ashok Kumar. All rights reserved.
//

import UIKit

class WriteReviewTableViewCell: UITableViewCell {

    @IBOutlet weak var reviewButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        reviewButton.imageEdgeInsets = UIEdgeInsets(top: 7, left: 5, bottom: 7, right: 0)
        reviewButton.imageView?.contentMode = .scaleAspectFit
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
