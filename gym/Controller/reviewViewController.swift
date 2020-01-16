//
//  reviewViewController.swift
//  gym
//
//  Created by ac1ra on 16/01/2020.
//  Copyright © 2020 ac1ra. All rights reserved.
//

import UIKit

class reviewViewController: UIViewController {

    @IBOutlet var backgroundImageView: UIImageView!
    
    var gyms = gym()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        backgroundImageView.image = UIImage(named: gyms.image)
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
