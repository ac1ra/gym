//
//  detailViewController.swift
//  gym
//
//  Created by ac1ra on 10/12/2019.
//  Copyright © 2019 ac1ra. All rights reserved.
//

import UIKit

class detailViewController: UIViewController {

    @IBOutlet var gymImageView: UIImageView!
    @IBOutlet var gymNameLabel: UILabel!
    
    var gymImageName = ""
    var gymName = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        gymImageView.image = UIImage(named: gymImageName)
        
        gymNameLabel.text = gymName
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
