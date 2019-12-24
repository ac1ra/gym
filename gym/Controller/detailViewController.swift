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
    
    var gymDetails = gym()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        headerView.headerImageView.image = UIImage(named: gymDetails.image)
        
        headerView.nameLabel.text = gymDetails.name
        headerView.typeLabel.text = gymDetails.type
        headerView.heartImageView.isHidden = (gymDetails.isVisited) ? false : true
        
        headerView.heartImageView.image = UIImage(named: "tick")
        // Do any additional setup after loading the view.
        
        navigationItem.largeTitleDisplayMode = .never
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: gymTextCell.self), for: indexPath) as! detailIconTextCell
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
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: gymTextCell.self), for: indexPath) as! gymTextCell
            cell.description
            cell.descriptionLabel.text = gymDetails.description
            cell.selectionStyle = .none
            return cell
        default:
            fatalError("Failed to instantiate")
        }
    }
}
