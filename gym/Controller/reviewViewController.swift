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
    
    @IBOutlet var rateButtons: [UIButton]! = []
    
    var rgyms = gym()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(rgyms)
        backgroundImageView.image = UIImage(named: rgyms.image)
        
        let blurEffect = UIBlurEffect(style: .extraLight)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        backgroundImageView.addSubview(blurEffectView)
        
        let moveRightTransform = CGAffineTransform(translationX: 600, y: 0)
        
        // Do any additional setup after loading the view.
        for ratebutton in rateButtons {
            
            ratebutton.transform = moveRightTransform
            ratebutton.alpha = 0
        }
    }
    override func viewWillAppear(_ animated: Bool) {
//        UIView.animate(withDuration: 2.0){
        UIView.animate(withDuration: 0.4, delay: 0.1, options: [], animations: {
            self.rateButtons[0].alpha = 1.0
            self.rateButtons[0].transform = .identity
            },completion: nil)
        UIView.animate(withDuration: 0.4, delay: 0.1, options: [], animations: {
            self.rateButtons[1].alpha = 1.0
            self.rateButtons[1].transform = .identity
            },completion: nil)
        UIView.animate(withDuration: 0.4, delay: 0.1, options: [], animations: {
            self.rateButtons[2].alpha = 1.0
            self.rateButtons[2].transform = .identity
            },completion: nil)
        UIView.animate(withDuration: 0.4, delay: 0.1, options: [], animations: {
            self.rateButtons[3].alpha = 1.0
            self.rateButtons[3].transform = .identity
            },completion: nil)
        UIView.animate(withDuration: 0.4, delay: 0.1, options: [], animations: {
            self.rateButtons[4].alpha = 1.0
            self.rateButtons[4].transform = .identity
            },completion: nil)
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
