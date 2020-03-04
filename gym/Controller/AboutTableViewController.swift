//
//  AboutTableViewController.swift
//  gym
//
//  Created by ac1ra on 04/03/2020.
//  Copyright © 2020 ac1ra. All rights reserved.
//

import UIKit

class AboutTableViewController: UITableViewController {

    var sectionTitles = ["feedback", "Follow us"]
    
    var sectionContent = [[(image: "store", text: "Rate us on App Store", link: "https://www.apple.com/ios/app-store/"), (image: "chat", text: "Tell us your feedback", link: "http://www.appcoda.com/contact")], [(image: "twitter", text: "Twitter", link: "https://twitter.com/appcodamobile"), (image: "facebook", text: "Facebook", link: "https://facebook.com/appcodamobile"), (image: "instagram", text: "Instagram", link: "https://www.instagram.com/appcodadotcom")]]
    
    var images = [ ["store", "chat"], ["twitter", "facebook", "instagram"] ]
    var text = [ ["Rate us on App Store", "Tell us your feedback"], ["Twitter", "Facebook", "Instagram"] ]
    var links = [ ["https://www.apple.com/ios/app-store/", "http://www.appcoda.com/contact"], ["https://twitter.com/appcodamobile", "https://facebook.com/appcodamobile", "https://www.instagram.com/appcodadotcom"] ]
    var record = (image: "twitter", text:"Twitter", link: "https://twitter.com")
    
    let section0 = [(image: "store", text: "Rate us on App Store", link: "https://www.apple.com/ios/app-store/"), (image: "chat", text: "Tell us your feedback", link: "http://www.appcoda.com/contact")]

    let section1 = [(image: "twitter", text: "Twitter", link: "https://twitter.com/appcodamobile"), (image: "facebook", text: "Facebook", link: "https://facebook.com/appcodamobile"), (image: "instagram", text: "Instagram", link: "https://www.instagram.com/appcodadotcom")]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        tableView.cellLayoutMarginsFollowReadableWidth = true
    navigationController?.navigationBar.prefersLargeTitles = true
    //configure navigation bar appearance
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        if let custiomFont = UIFont(name: "Rubik-Medium", size: 40.0) {
            navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor:UIColor(red: 231, green: 76, blue: 60), NSAttributedString.Key.font:custiomFont]
        }
        tableView.tableFooterView = UIView()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return sectionTitles.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return sectionContent[section].count
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionTitles[section]
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AboutCell", for: indexPath)

        // Configure the cell...
        let cellData = sectionContent[indexPath.section][indexPath.row]
        cell.textLabel?.text = cellData.text
        cell.imageView?.image = UIImage(named: cellData.image)
        
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let link = sectionContent[indexPath.section][indexPath.row].link
        switch indexPath.section {
        case 0:
            if indexPath.row == 0 {
                if let url = URL(string: link) {
            UIApplication.shared.open(url)
                    }
            }
            else if indexPath.row == 1{
                performSegue(withIdentifier: "showWebView", sender: self)
            }
        default:
            break
        }
        tableView.deselectRow(at: indexPath, animated: false)
    }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
