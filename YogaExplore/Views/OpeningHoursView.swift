//
//  OpeningHoursView.swift
//  YogaExplore
//
//  Created by Ashok Kumar on 10/10/20.
//  Copyright © 2020 Ashok Kumar. All rights reserved.
//

import UIKit

class OpeningHoursView: UIView {

    @IBOutlet var view: UIView!
    @IBOutlet weak var openingHours: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadViewFromNib()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        loadViewFromNib()
    }
    
    private func loadViewFromNib() {
        let nib = UINib(nibName: Constants.CustomCell.OpeningHoursView.rawValue, bundle: nil)
        view = nib.instantiate(withOwner: self, options: nil).first as? UIView
        view.fixInView(self)
        addSubview(view)
    }
}
