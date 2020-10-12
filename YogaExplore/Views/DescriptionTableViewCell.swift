//
//  DescriptionTableViewCell.swift
//  YogaExplore
//
//  Created by Ashok Kumar on 10/10/20.
//  Copyright © 2020 Ashok Kumar. All rights reserved.
//

import UIKit

class DescriptionTableViewCell: UITableViewCell {

    @IBOutlet weak var descriptionLabel: InsetLabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
