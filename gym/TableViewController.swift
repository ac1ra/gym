//
//  TableViewController.swift
//  gym
//
//  Created by ac1ra on 30/11/2019.
//  Copyright © 2019 ac1ra. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    var gymNames = ["Cafe Deadend", "Homei", "Teakha", "Cafe Loisl", "Petite Oyster", "For Kee Restaurant", "Po's Atelier", "Bourke Street Bakery", "Haigh's Chocolate", "Palomino Espresso", "Upstate", "Traif", "Graham Avenue Meats And Deli", "Waffle & Wolf", "Five Leaves", "Cafe Lore", "Confessional", "Barrafina", "Donostia", "Royal Oak", "CASK Pub and Kitchen"]
    var gymImages = ["Cafe Deadend", "Homei", "Teakha", "Cafe Loisl", "Petite Oyster", "For Kee Restaurant", "Po's Atelier", "Bourke Street Bakery", "Haigh's Chocolate", "Palomino Espresso", "Upstate", "Traif", "Graham Avenue Meats And Deli", "Waffle & Wolf", "Five Leaves", "Cafe Lore", "Confessional", "Barrafina", "Donostia", "Royal Oak", "CASK Pub and Kitchen"]
    var gymLocations = ["Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Sydney", "Sydney", "Sydney", "New York", "New York", "New York", "New York", "New York", "New York", "New York", "London", "London", "London", "London"]
    var gymTypes = ["Coffee & Tea Shop", "Cafe", "Tea House", "Austrian / Causual Drink", "French", "Bakery", "Bakery", "Chocolate", "Cafe", "American / Seafood", "American", "American", "Breakfast & Brunch", "Coffee & Tea", "Coffee & Tea", "Latin American", "Spanish", "Spanish", "Spanish", "British", "Thai"]
    
    var gymVisited = Array(repeating: false, count: 21)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.navigationBar.prefersLargeTitles = true
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
        return gymNames.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "datacell", for: indexPath) as! GymTableViewCell

        // Configure the cell...

        cell.nameLabel?.text = gymNames[indexPath.row]
        cell.thumbnailImageView?.image = UIImage(named: gymNames[indexPath.row])
        cell.locationLabel?.text = gymLocations[indexPath.row]
        cell.typeLabel?.text = gymTypes[indexPath.row]
        
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //меню с UIAlertController появляется при нажатии таблицы
        //create an option menu as an action sheet
        let optionMenu = UIAlertController(title: nil, message: "What do you want to do?", preferredStyle: .alert)
        //add actions to the menu
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        optionMenu.addAction(cancelAction)
        //Display to menu
        present(optionMenu,animated: true,completion: nil)
    
        
        let callActionHandler = {
            (action: UIAlertAction!) -> Void in
            let alertMessage = UIAlertController(title: "Service Unavailable", message: "Sorry, the call feature is not available yet", preferredStyle: .alert)
            alertMessage.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alertMessage,animated: true,completion: nil)
        }
        //подключаем с помощью свойства handler callActionHandler(предупреждающее сообщение UIAlertAction) к callAction
        let callAction = UIAlertAction(title: "Call" + "12312-\(indexPath.row)", style: .default, handler: callActionHandler)
        
        optionMenu.addAction(callAction)
        
        let checkAction = UIAlertAction(title: "Check in", style: .default, handler: {
            (action: UIAlertAction!) -> Void in
            
            let cell = tableView.cellForRow(at: indexPath)
            
            if self.gymVisited[indexPath.row] == true{
                cell?.accessoryType = .checkmark
            } else if self.gymVisited[indexPath.row] == false{
                cell?.accessoryType = .none
            }

            
//            self.gymVisited[indexPath.row] = true

//            switch self.gymVisited[indexPath.row] {
//            case false:
//                cell?.accessoryType = .none
//            case true:
//                cell?.accessoryType = .checkmark
//            }
            
        })
        let checkActionUndo = UIAlertAction(title: "Check Undo", style: .default, handler:{
            (action: UIAlertAction)->Void in
            
            let  cell = tableView.cellForRow(at: indexPath)
            cell?.accessoryType = .none
            self.gymVisited[indexPath.row] = false
            
        })
        
        optionMenu.addAction(checkAction)
        optionMenu.addAction(checkActionUndo)
        
        tableView.deselectRow(at: indexPath, animated: false)
        
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            gymNames.remove(at: indexPath.row)
            gymLocations.remove(at: indexPath.row)
            gymTypes.remove(at: indexPath.row)
            gymImages.remove(at: indexPath.row)
            gymVisited.remove(at: indexPath.row)
            
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            
             }
        
        for name in gymNames {
            print(name)
        }
        print("Total item: \(gymNames.count)")
        
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete")
        { (action, sourceView, completionHeadler) in
            
         //delete row from the data source
            self.gymNames.remove(at: indexPath.row)
            self.gymTypes.remove(at: indexPath.row)
            self.gymLocations.remove(at: indexPath.row)
            self.gymVisited.remove(at: indexPath.row)
            self.gymImages.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .fade)
            completionHeadler(true)
        }
        deleteAction.image = UIImage(named: "delete")
        
        let shareAction = UIContextualAction(style: .normal, title: "Share"){
            (action,sourceView,completionHandler) in
            let defaultText = "Just checking in at" + self.gymNames[indexPath.row]
            
            let activityController: UIActivityViewController
            if let imageToShare = UIImage(named: self.gymImages[indexPath.row]){
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
            let clickText = "Clicked" + self.gymNames[indexPath.row]
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
    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

}
