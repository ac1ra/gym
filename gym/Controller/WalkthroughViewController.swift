//
//  WalkthroughViewController.swift
//  gym
//
//  Created by ac1ra on 02/03/2020.
//  Copyright © 2020 ac1ra. All rights reserved.
//

import UIKit

class WalkthroughViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBOutlet var pageControl: UIPageControl!
    @IBOutlet var nextButton: UIButton!{
        didSet{
            nextButton.layer.cornerRadius = 25.0
            nextButton.layer.masksToBounds = true
        }
    }
    @IBOutlet var skipButton:UIButton!

    
}
