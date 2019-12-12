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
    @IBOutlet var gymTypeLabel: UILabel!
    @IBOutlet var gymLocalLabel: UILabel!
    
    
    var gymDetails = gym()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        gymImageView.image = UIImage(named: gymDetails.image)
        
        gymNameLabel.text = gymDetails.name
        gymTypeLabel.text = gymDetails.type
        gymLocalLabel.text = gymDetails.local
        
        
        // Do any additional setup after loading the view.
        
        navigationItem.largeTitleDisplayMode = .never
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
