//
//  detailViewController.swift
//  gym
//
//  Created by ac1ra on 10/12/2019.
//  Copyright © 2019 ac1ra. All rights reserved.
//

import UIKit

class detailViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet var tableView: UITableView!
    @IBOutlet var headerView: gymDetailHeaderView!
    
    @IBAction func exit(segue:UIStoryboardSegue){
        dismiss(animated: true, completion: nil)
    }
    
    @IBOutlet var ratingImageView: UIImageView!
    
    @IBAction func rateGym(segue: UIStoryboardSegue){
        if let rating = segue.identifier{
            self.gymDetails.rating = rating
            self.ratingImageView.image = UIImage(named: rating)
        }
        dismiss(animated: true, completion: nil)
    }
    
    var gymDetails = gym()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none

        headerView.headerImageView.image = UIImage(named: gymDetails.image)
        
        headerView.nameLabel.text = gymDetails.name
        headerView.typeLabel.text = gymDetails.type
        headerView.heartImageView.isHidden = (gymDetails.isVisited) ? false : true
        
        headerView.heartImageView.image = UIImage(named: "heart-tick")
        
        // Do any additional setup after loading the view.
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.tintColor = .white
        
        //manage to hide on the navigationBar
        navigationController?.hidesBarsOnSwipe = false
        
        tableView.contentInsetAdjustmentBehavior = .never
        
        navigationItem.largeTitleDisplayMode = .never

    }

    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: detailIconTextCell.self), for: indexPath) as! detailIconTextCell
            cell.iconImageView.image = UIImage(named: "phone")
            cell.cellTextLabel.text = gymDetails.phone
            cell.selectionStyle = .none
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: detailIconTextCell.self), for: indexPath) as! detailIconTextCell
            cell.iconImageView.image = UIImage(named: "map")
            cell.cellTextLabel.text = gymDetails.local
            cell.selectionStyle = .none
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: gymTextCell.self), for: indexPath) as! gymTextCell
            cell.descriptionLabel.text = gymDetails.description
            cell.selectionStyle = .none
            return cell
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: gymDetailSeparatorCell.self),for: indexPath) as! gymDetailSeparatorCell
            cell.titleLabel.text = "how to get here"
            cell.selectionStyle = .none
            
            return cell
        case 4:
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: gymDetailMapCell.self),for: indexPath) as! gymDetailMapCell
            cell.selectionStyle = .none
            
            cell.configurate(location: gymDetails.local)
            return cell

            
        default:
            fatalError("Failed to instantiate")
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showMap" {
            let destinationController = segue.destination as! mapViewController
            destinationController.gyms = gymDetails
        } else if segue.identifier == "showReview"{
            let destinationContorller = segue.destination as! reviewViewController
            destinationContorller.rgyms = gymDetails
        }
    }
}
