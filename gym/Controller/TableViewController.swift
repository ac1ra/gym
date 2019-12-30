//
//  TableViewController.swift
//  gym
//
//  Created by ac1ra on 30/11/2019.
//  Copyright © 2019 ac1ra. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    var gyms:[gym] = [
        gym(name: "Cafe Deadend", type: "Coffee & Tea Shop", local: "Hong Kong", image: "Cafe Deadend",description: "Hello. How are you? My name iPhone. I'm going fuck your human's civilization. I'll be back.", phone: "+7912122121", isVisited: false),
        gym(name: "Homei", type: "Cafe", local: "Hong Kong", image: "Homei",description: "цсусуцуццу", phone: "плоти за телевон", isVisited: false),
        gym(name: "Teakha", type: "Tea House", local: "Hong Kong", image: "Teakha",description: "", phone: "", isVisited: false),
        gym(name: "Cafe Loisl", type: "Austrian / Causual Drink", local: "Hong Kong", image: "Cafe Loisl",description: "", phone: "", isVisited: false),
        gym(name: "Petite Oyster", type: "French", local: "Hong Kong", image: "Petite Oyster",description: "", phone: "", isVisited: false),
        gym(name: "For Kee Restaurant", type: "Bakery", local: "Hong Kong", image: "For Kee Restaurant",description: "", phone: "", isVisited: false),
        gym(name: "Po's Atelier", type: "Bakery", local: "Hong Kong", image: "Po's Atelier",description: "", phone: "", isVisited: false),
        gym(name: "Bourke Street Bakery", type: "Chocolate", local: "Sydney", image: "Bourke Street Bakery",description: "", phone: "", isVisited: false),
        gym(name: "Haigh's Chocolate", type: "Cafe", local: "Sydney", image: "Haigh's Chocolate",description: "", phone: "", isVisited: false),
        gym(name: "Palomino Espresso", type: "American / Seafood", local: "Sydney", image: "Palomino Espresso",description: "", phone: "", isVisited: false),
        gym(name: "Upstate", type: "American", local: "New York", image: "Upstate",description: "", phone: "", isVisited: false),
        gym(name: "Traif", type: "American", local: "New York", image: "Traif",description: "", phone: "", isVisited: false),
        gym(name: "Graham Avenue Meats", type: "Breakfast & Brunch", local: "New York", image: "Graham Avenue Meats And Deli",description: "", phone: "", isVisited: false),
        gym(name: "Waffle & Wolf", type: "Coffee & Tea", local: "New York", image: "Waffle & Wolf",description: "", phone: "", isVisited: false),
        gym(name: "Five Leaves", type: "Coffee & Tea", local: "New York", image: "Five Leaves",description: "", phone: "", isVisited: false),
        gym(name: "Cafe Lore", type: "Latin American", local: "New York", image: "Cafe Lore",description: "", phone: "", isVisited: false),
        gym(name: "Confessional", type: "Spanish", local: "New York", image: "Confessional", description: "", phone: "",isVisited: false),
        gym(name: "Barrafina", type: "Spanish", local: "London", image: "Barrafina",description: "", phone: "", isVisited: false),
        gym(name: "Donostia", type: "Spanish", local: "London", image: "Donostia",description: "", phone: "", isVisited: false),
        gym(name: "Royal Oak", type: "British", local: "London", image: "Royal Oak", description: "", phone: "", isVisited: false),
        gym(name: "CASK Pub and Kitchen", type: "Thai", local: "London", image: "CASK Pub and Kitchen",description: "", phone: "", isVisited: false)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.navigationBar.prefersLargeTitles = true
        
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.tintColor = .white
        
        if let customFont = UIFont(name: "Rubik-Medium", size: 10.0) {
            navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor:UIColor(red: 231.0/255.0, green: 76.0/255.0, blue: 210.0/255.0, alpha: 1.0), NSAttributedString.Key.font: customFont]
        }
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source
//
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return gyms.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellidentifer = "datacell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellidentifer, for: indexPath) as! GymTableViewCell

        // Configure the cell...

        cell.nameLabel?.text = gyms[indexPath.row].name
        cell.thumbnailImageView?.image = UIImage(named: gyms[indexPath.row].image)
        cell.locationLabel?.text = gyms[indexPath.row].local
        cell.typeLabel?.text = gyms[indexPath.row].type
        
        return cell
    }
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        //меню с UIAlertController появляется при нажатии таблицы
//        //create an option menu as an action sheet
//        let optionMenu = UIAlertController(title: nil, message: "What do you want to do?", preferredStyle: .alert)
//        //add actions to the menu
//        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
//        optionMenu.addAction(cancelAction)
//        //Display to menu
//        present(optionMenu,animated: true,completion: nil)
//
//
//        let callActionHandler = {
//            (action: UIAlertAction!) -> Void in
//            let alertMessage = UIAlertController(title: "Service Unavailable", message: "Sorry, the call feature is not available yet", preferredStyle: .alert)
//            alertMessage.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
//            self.present(alertMessage,animated: true,completion: nil)
//        }
//        //подключаем с помощью свойства handler callActionHandler(предупреждающее сообщение UIAlertAction) к callAction
//        let callAction = UIAlertAction(title: "Call" + "12312-\(indexPath.row)", style: .default, handler: callActionHandler)
//
//        optionMenu.addAction(callAction)
//
//        let checkAction = UIAlertAction(title: "Check in", style: .default, handler: {
//            (action: UIAlertAction!) -> Void in
//
//            let cell = tableView.cellForRow(at: indexPath)
//
//            if self.gyms[indexPath.row].isVisited == true{
//                cell?.accessoryType = .checkmark
//            }
//        })
//        let checkActionUndo = UIAlertAction(title: "Check Undo", style: .default, handler:{
//            (action: UIAlertAction)->Void in
//
//            let  cell = tableView.cellForRow(at: indexPath)
//            cell?.accessoryType = .none
//            self.gyms[indexPath.row].isVisited = false
//
//        })
//
//        optionMenu.addAction(checkAction)
//        optionMenu.addAction(checkActionUndo)
//
//        tableView.deselectRow(at: indexPath, animated: false)
//
//    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetails" {
            if let indexPath = tableView.indexPathForSelectedRow{
                let destinationController = segue.destination as! detailViewController
                destinationController.gymDetails = gyms[indexPath.row]
            }
        }
    }
    
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            gyms.remove(at: indexPath.row)
            
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            
             }
        
        
        for name in gyms[indexPath.row].name {
            print(name)
        }
        print("Total item: \(gyms.count)")
        
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete")
        { (action, sourceView, completionHeadler) in
            
         //delete row from the data source
            self.gyms.remove(at: indexPath.row)
        
            self.tableView.deleteRows(at: [indexPath], with: .fade)
            completionHeadler(true)
        }
        deleteAction.image = UIImage(named: "delete")
        
        let shareAction = UIContextualAction(style: .normal, title: "Share"){
            (action,sourceView,completionHandler) in
            let defaultText = "Just checking in at" + self.gyms[indexPath.row].name
            
            let activityController: UIActivityViewController
            if let imageToShare = UIImage(named: self.gyms[indexPath.row].image){
                activityController = UIActivityViewController(activityItems: [defaultText, imageToShare], applicationActivities: nil)
            } else {
                activityController = UIActivityViewController(activityItems: [defaultText], applicationActivities: nil)
            }
            
            self.present(activityController, animated: true, completion: nil)
            completionHandler(true)
            
        }
        
        //color button for "Share"
        shareAction.backgroundColor = UIColor(red: 254.0/255.0, green: 149.0/255.0, blue: 38.0/255.0, alpha: 1.0)
        shareAction.image = UIImage(named: "share")
        
        
        
        let swipeConfig = UISwipeActionsConfiguration(actions: [deleteAction,shareAction])
        return swipeConfig
        
    }
    override func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let clickAction = UIContextualAction(style: .normal, title: "Click"){
            (action,sourceView,completionHandler) in
            let clickText = "Clicked" + self.gyms[indexPath.row].name
            let clickedController = UIAlertController(title: "Test click", message: "OK", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            
            clickedController.addAction(okAction)
            
            self.present(clickedController, animated: true, completion: nil)
            completionHandler(true)
        }
        
        //color button for "Click"
        clickAction.backgroundColor = UIColor(red: 54.0/255.0, green: 10.0/255.0, blue: 138.0/255.0, alpha: 0.4)
        clickAction.image = UIImage(named: "tick")
        let swipeConfig = UISwipeActionsConfiguration(actions: [clickAction])
        return swipeConfig
    }
}
