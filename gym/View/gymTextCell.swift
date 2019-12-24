//
//  gymTextCell.swift
//  gym
//
//  Created by ac1ra on 24/12/2019.
//  Copyright © 2019 ac1ra. All rights reserved.
//

import UIKit

class gymTextCell: UITableViewCell {
    
    @IBOutlet var descriptionLabel: UILabel!{
        didSet{
            descriptionLabel.numberOfLines = 0
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
