//
//  UINavigationController+Ext.swift
//  gym
//
//  Created by ac1ra on 14/01/2020.
//  Copyright © 2020 ac1ra. All rights reserved.
//

import UIKit

extension UINavigationController{
    open override var childForStatusBarStyle: UIViewController?{
        return topViewController
    }
}
