//
//  Registration2ViewController.swift
//  Taxi Driver App
//
//  Created by user on 08.05.2021.
//

import UIKit
import MobileCoreServices

class Registration2ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var brandCarTitleDropDown: UILabel!
    @IBOutlet weak var brandCarViewDropDown: UIView!
    
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    
   
    let titleArray = ["Спереду", "Ззаду" ,"Збоку" ,"В салоні"]
    
    let brandCarDropDown = DropDownManager()
    let brandCarList = ["Lanos", "BMW", "Skoda", "Lada", "Volkswagen", "Mercedes-Benz"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        scrollView.setContentOffset(CGPoint(x: 0, y: scrollView.contentSize.height - scrollView.bounds.size.height), animated: true)
        
    
        backButton.layer.cornerRadius = 10
        backButton.layer.borderWidth = 1.0
        backButton.layer.borderColor = UIColor.black.cgColor
        nextButton.layer.cornerRadius = 10
        
        navigationItem.backButtonTitle = ""
    
       
        brandCarTitleDropDown.text = "Виберіть марку автомобіля"
        brandCarDropDown.addDropDown(textDropDown: brandCarTitleDropDown, viewDropDown: brandCarViewDropDown, listDropDown: brandCarList)
        // Do any additional setup after loading the view.
    }
    

    @IBAction func brandButtonDropDownPressed(_ sender: UIButton) {
        brandCarDropDown.dropDown.show()
    }
    @IBAction func backButtonPressed(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    func actionSheet() {
        let alert = UIAlertController(title: "Chose photo", message: nil, preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Open camera", style: .default, handler: { (handler) in
            self.openCamera()
          
          
        }))
        alert.addAction(UIAlertAction(title: "Chose from gallery", style: .default, handler: { (handler) in
            self.openGallery()
            
            
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .default, handler: { (handler) in
            
        }))
        self.present(alert, animated: true, completion: nil)
    }
    func openCamera() {
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            let image = UIImagePickerController()
            image.allowsEditing = true
            image.delegate = self
            image.sourceType = .camera
            image.mediaTypes = [kUTTypeImage as String]
            self.present(image, animated: true, completion: nil)
           
        }
    }
    
    func openGallery()  {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
            let image = UIImagePickerController()
            image.allowsEditing = true
            image.delegate = self
            self.present(image, animated: true, completion: nil)
            
        }
    
    }
}

