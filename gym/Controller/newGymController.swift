//
//  newGymController.swift
//  gym
//
//  Created by ac1ra on 22/01/2020.
//  Copyright © 2020 ac1ra. All rights reserved.
//

import UIKit
import CoreData

class newGymController: UITableViewController, UITextFieldDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate {

    var gum: gymMO!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Configure navigation bar appearance
        
        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.backgroundColor = UIColor(red: 0, green: 100, blue: 241)
        
        if let customFont = UIFont(name: "Rubik-Medium", size: 35.0) {
            navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor(red: 231, green: 76, blue: 60), NSAttributedString.Key.font: customFont]
        }
    }

    // MARK: - Table view data source
    
    @IBOutlet var nameTextField: roundedTextField! {
        didSet{
            nameTextField.tag = 1
            nameTextField.becomeFirstResponder()
            nameTextField.delegate = self
        }
    }
    @IBOutlet var typeTextField: roundedTextField!{
        didSet{
            typeTextField.tag = 2
            typeTextField.delegate = self
        }
    }
    @IBOutlet var addressTextField: roundedTextField!{
        didSet{
            addressTextField.tag = 3
            addressTextField.delegate = self
        }
    }
    @IBOutlet var phoneTextField: roundedTextField!{
        didSet{
            phoneTextField.tag = 4
            phoneTextField.delegate = self
        }
    }

    @IBOutlet var descriptionTextView: UITextView!{
        didSet{
            descriptionTextView.tag = 5
            descriptionTextView.layer.cornerRadius = 5.0
            descriptionTextView.layer.masksToBounds = true
            descriptionTextView.delegate = self as? UITextViewDelegate
        }
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let nextTextField = view.viewWithTag(textField.tag + 1){
            textField.resignFirstResponder()
            nextTextField.becomeFirstResponder()
        
        }
        return true
    }
    
    @IBAction func saveButton(_ sender: Any) {
        if let appDelegate = (UIApplication.shared.delegate as? AppDelegate){
            
            gum = gymMO(context: appDelegate.persistentContainer.viewContext)
            gum.name = nameTextField.text
            gum.type = typeTextField.text
            gum.local = addressTextField.text
            gum.phone = phoneTextField.text
            gum.summary = descriptionTextView.text
            gum.isVisited = false
            
            if let gumImage = photoImageView.image{
                gum.image = gumImage.pngData()
            }
            
            print("Saving data to context ...")
            appDelegate.saveContext()
        }
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            let photoSourceRequestController = UIAlertController(title: "", message: "Choose your photo source", preferredStyle: .actionSheet)
            
            let cameraAction = UIAlertAction(title: "Camera", style: .default, handler: {
                (action) in
                if UIImagePickerController.isSourceTypeAvailable(.camera){
                    let imagePicker = UIImagePickerController()
                    imagePicker.allowsEditing = false
                    imagePicker.sourceType = .camera
                    
                    self.present(imagePicker,animated: true, completion: nil)
                    
                    imagePicker.delegate = self
                }
            })
            let photoLibraryAction = UIAlertAction(title: "Photo library", style: .default, handler: {
                (action) in
                if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
                    let imagePicker = UIImagePickerController()
                    imagePicker.allowsEditing = false
                    imagePicker.sourceType = .photoLibrary
                    
                    self.present(imagePicker,animated: true,completion: nil)
                    
                    imagePicker.delegate = self
                }
            })
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            
            photoSourceRequestController.addAction(cameraAction)
            photoSourceRequestController.addAction(photoLibraryAction)
            photoSourceRequestController.addAction(cancelAction)
            
            present(photoSourceRequestController,animated: true,completion: nil)
        }
    }
    
    @IBOutlet var photoImageView: UIImageView!
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info:[UIImagePickerController.InfoKey:Any]) {
        
        if let selectedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            photoImageView.image = selectedImage
            photoImageView.contentMode = .scaleAspectFill
            photoImageView.clipsToBounds = true
        }
        let leadingContrast = NSLayoutConstraint(item: photoImageView as Any, attribute: .leading, relatedBy: .equal, toItem: photoImageView.superview, attribute: .leading, multiplier: 1, constant: 0)
        leadingContrast.isActive = true
        
        let trailingContrast = NSLayoutConstraint(item: photoImageView as Any, attribute: .trailing, relatedBy: .equal, toItem: photoImageView.superview, attribute: .trailing, multiplier: 1, constant: 0)
        trailingContrast.isActive = true
        
        let topContrast = NSLayoutConstraint(item: photoImageView as Any, attribute: .top, relatedBy: .equal, toItem: photoImageView.superview, attribute: .top, multiplier: 1, constant: 0)
        topContrast.isActive = true
        
        let bottomContrast = NSLayoutConstraint(item: photoImageView as Any, attribute: .bottom, relatedBy: .equal, toItem: photoImageView.superview, attribute: .bottom, multiplier: 1, constant: 0)
        bottomContrast.isActive = true
        
        
        dismiss(animated: true, completion: nil)
    }
}
