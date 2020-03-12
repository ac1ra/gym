//
//  WalkthroughViewController.swift
//  gym
//
//  Created by ac1ra on 02/03/2020.
//  Copyright © 2020 ac1ra. All rights reserved.
//

import UIKit

class WalkthroughViewController: UIViewController {
    
    var walkthroughPageViewController: WalkthroughContentViewController?
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination
        if let pageViewController = destination as? WalkthroughContentViewController{
            walkthroughPageViewController = pageViewController
        }
        
    }
    
    @IBOutlet var pageControl: UIPageControl!
    @IBOutlet var nextButton: UIButton!{
        didSet{
            nextButton.layer.cornerRadius = 25.0
            nextButton.layer.masksToBounds = true
        }
    }
    @IBAction func nextButtonTapped(sender:UIButton){
        if let index = walkthroughPageViewController?.currentIndex {
            switch index {
            case 0...1:
                walkthroughPageViewController?.fowardPage()
            case 2:
                dismiss(animated: true, completion: nil)
            default:
                break
            }
        }
        updateUI()
    }
    @IBAction func pushNotification(_ sender: UIButton) {
        prepareNotification()
        
    }
    @IBOutlet var skipButton:UIButton!
    @IBAction func skipBttnTapped(sender:UIButton){
        dismiss(animated: true, completion: nil)
    }
    func prepareNotification(){
        //create user notification
        let content = UNMutableNotificationContent()
        content.title = "Try new food today"
        content.body = "I recommend you to check out"
        content.sound = UNNotificationSound.default
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 10, repeats: false)
        let request = UNNotificationRequest(identifier: "gym.gymSuggestion", content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
        
    }
    func updateUI() {
        if let index = walkthroughPageViewController?.currentIndex {
            switch index {
            case 0...1:
                nextButton.setTitle("NEXT", for: .normal)
                skipButton.isHidden = false
            case 2:
                nextButton.setTitle("GET STARTED", for: .normal)
                skipButton.isHidden = true
            default:
                break
            }
            pageControl.currentPage = index
        }
    }
}
