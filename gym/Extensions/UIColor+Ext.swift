//
//  UIColor+Ext.swift
//  gym
//
//  Created by ac1ra on 13/01/2020.
//  Copyright © 2020 ac1ra. All rights reserved.
//

import UIKit

extension UIColor{
    convenience init(red: Int, green:Int, blue:Int) {
        let redValue = CGFloat(red) / 255.0
        let blueValue = CGFloat(blue) / 255.0
        let greenValue = CGFloat(green) / 255.0
        
        self.init(red: redValue, green: greenValue, blue: blueValue, alpha: 1.0)
    }
}
