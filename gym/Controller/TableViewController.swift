//
//  TableViewController.swift
//  gym
//
//  Created by ac1ra on 30/11/2019.
//  Copyright © 2019 ac1ra. All rights reserved.
//

import UIKit
import CoreData

class TableViewController: UITableViewController, NSFetchedResultsControllerDelegate {
    
    var gyms: [gymMO] = []
    var fetchResultController: NSFetchedResultsController<gymMO>!
    
    
    @IBAction func unwindToHome(segue:UIStoryboardSegue){
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.navigationBar.prefersLargeTitles = true
        
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.backgroundColor = UIColor(red: 0, green: 100, blue: 241)
        
      tableView.backgroundView = emptyGymView
        tableView.backgroundView?.isHidden = true
        
        if let customFont = UIFont(name: "Rubik-Medium", size: 10.0) {
            navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor:UIColor(red: 231.0/255.0, green: 76.0/255.0, blue: 210.0/255.0, alpha: 1.0), NSAttributedString.Key.font: customFont]
        }
        // fetch data from data store
        let fetchRequest: NSFetchRequest<gymMO> = gymMO.fetchRequest()
        let sortDescriptor = NSSortDescriptor(key: "name", ascending: true)
        fetchRequest.sortDescriptors = [sortDescriptor]
        
        if let appDelegate = (UIApplication.shared.delegate as? AppDelegate){
            let context = appDelegate.persistentContainer.viewContext
            fetchResultController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
            fetchResultController.delegate = self
            
            do{
                try fetchResultController.performFetch()
                if let fetchedObjects = fetchResultController.fetchedObjects{
                    gyms = fetchedObjects
                    
                }
                } catch {
                    print("error with fetch")
                }
            return context
            }
    }

    // MARK: - Table view data source
//
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = false
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        if gyms.count > 0 {
            tableView.backgroundView?.isHidden = true
            tableView.separatorStyle = .singleLine
        } else {
            tableView.backgroundView?.isHidden = false
            tableView.separatorStyle = .none
        }
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
        if let gymImage = gyms[indexPath.row].image {
            cell.thumbnailImageView.image = UIImage(data: gymImage as Data)
        }
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
        
        
        for name in gyms[indexPath.row].name! {
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
            let defaultText = "Just checking in at" + self.gyms[indexPath.row].name!
            
            let activityController: UIActivityViewController
            if let gymImage = self.gyms[indexPath.row].image, let imageToShare = UIImage(data: gymImage as Data){
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
            let clickText = "Clicked" + self.gyms[indexPath.row].name!
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
    
    @IBOutlet var emptyGymView: UIImageView!
    
    
}
