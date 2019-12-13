//
//  GymTableViewCell.swift
//  gym
//
//  Created by ac1ra on 30/11/2019.
//  Copyright © 2019 ac1ra. All rights reserved.
//

import UIKit

class GymTableViewCell: UITableViewCell {

    @IBOutlet var thumbnailImageView: UIImageView!
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var locationLabel: UILabel!
    @IBOutlet var typeLabel: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
