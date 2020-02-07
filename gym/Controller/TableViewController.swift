//
//  TableViewController.swift
//  gym
//
//  Created by ac1ra on 30/11/2019.
//  Copyright © 2019 ac1ra. All rights reserved.
//

import UIKit
import CoreData

class TableViewController: UITableViewController, NSFetchedResultsControllerDelegate, UISearchResultsUpdating {
    
    var gyms: [gymMO] = []
    
    var searchResults: [gymMO] = []

    var fetchResultController: NSFetchedResultsController<gymMO>!
    
    var searchController: UISearchController!
    
    
    
    @IBAction func unwindToHome(segue:UIStoryboardSegue){
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.navigationBar.prefersLargeTitles = true
        
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.tintColor = .black
   //     navigationController?.navigationBar.backgroundColor = UIColor(red: 0, green: 100, blue: 241)
        
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
                    print("error with fetch", error)
            }
        }
        
        searchController = UISearchController(searchResultsController: nil)
//        self.navigationItem.searchController = searchController
        
        searchController.searchResultsUpdater = self
    searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search gyms..."
        searchController.searchBar.barTintColor = .white
        searchController.searchBar.backgroundImage = UIImage()
        searchController.searchBar.tintColor = UIColor(red: 231, green: 76, blue: 60)
        
        tableView.tableHeaderView = searchController.searchBar
        
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
        
        if searchController.isActive {
            return searchResults.count
        } else{
            return gyms.count
        }
        
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellidentifer = "datacell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellidentifer, for: indexPath) as! GymTableViewCell

        // Determine if we get the restaurant from search result or the original array
        let gum = (searchController.isActive) ? searchResults[indexPath.row] : gyms[indexPath.row]
        
        // Configure the cell...

        cell.nameLabel.text = gyms[indexPath.row].name
        if let gymImage = gyms[indexPath.row].image {
            cell.thumbnailImageView.image = UIImage(data: gymImage as Data)
        }
        cell.locationLabel.text = gyms[indexPath.row].local
        cell.typeLabel.text = gyms[indexPath.row].type
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetails" {
            if let indexPath = tableView.indexPathForSelectedRow{
                let destinationController = segue.destination as! detailViewController
                
//                destinationController.gymDetails = gyms[indexPath.row]
                
                destinationController.gymDetails = (searchController.isActive) ? searchResults[indexPath.row] : gyms[indexPath.row]
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
            
            if let appDelegate = (UIApplication.shared.delegate as? AppDelegate){
                let context = appDelegate.persistentContainer.viewContext
                
                let gymToDelete = self.fetchResultController.object(at: indexPath)
                
                context.delete(gymToDelete)
                
                appDelegate.saveContext()
            }
            
//            self.gyms.remove(at: indexPath.row)
//
//            self.tableView.deleteRows(at: [indexPath], with: .fade)
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
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        if searchController.isActive {
            return false
        } else{
            return true
        }
    }
    
//    @IBOutlet var emptyGymView: UIImageView!
    @IBOutlet var emptyGymView: UIView!
    
    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.beginUpdates()
    }
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath:IndexPath?) {
        switch type {
        case .insert:
            if let newIndexPath = newIndexPath {
                tableView.insertRows(at: [newIndexPath], with: .fade)
            }
        case .delete:
            if let indexPath = indexPath{
                tableView.deleteRows(at: [indexPath], with: .fade)
            }
        case .update:
            if let indexPath = indexPath{
                tableView.reloadRows(at: [indexPath], with: .fade)
            }
        default:
            tableView.reloadData()
        }
        
        if let fetchedObjects = controller.fetchedObjects{
            gyms = fetchedObjects as! [gymMO]
        }
    }
    
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.endUpdates()
    }
    //метод поиска по name в gyms с помощью filter
    func filterContent(for searchText: String) {
        searchResults = gyms.filter({
            (gym) -> Bool in
            if let name = gym.name, let location = gym.local{
                let isMatch = name.localizedCaseInsensitiveContains(searchText) || location.localizedCaseInsensitiveContains(searchText)
                return isMatch
            }
//            else if let location = gym.local{
//                let isLocate = location.localizedCaseInsensitiveContains(searchText)
//            }
            return false
        })
    }
    func updateSearchResults(for searchController: UISearchController) {
        if let searchText = searchController.searchBar.text{
                filterContent(for: searchText)
                tableView.reloadData()
        }
    }
}
