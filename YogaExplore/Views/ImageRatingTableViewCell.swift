//
//  ImageRatingTableViewCell.swift
//  YogaExplore
//
//  Created by Ashok Kumar on 07/10/20.
//  Copyright © 2020 Ashok Kumar. All rights reserved.
//

import UIKit

class ImageRatingTableViewCell: UITableViewCell {

    @IBOutlet weak var bannerImageView: UIImageView!
    @IBOutlet weak var ratingView: UIView!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var ratingCount: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
