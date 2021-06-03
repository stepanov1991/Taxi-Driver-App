//
//  Registration3ViewController.swift
//  Taxi Driver App
//
//  Created by user on 27.05.2021.
//

import UIKit
import MobileCoreServices

class Registration3ViewController: PhotoViewController {
    
    @IBOutlet weak var driverLicenseImageView: UIImageView!
    
    
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var sendButton: UIButton!
    
    let documentArray = ["Сторона 1","Сторона 2"]
    var service = ""
    //   let photoManager = PhotoManager()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Документи"
        
        backButton.layer.cornerRadius = 10
        backButton.layer.borderWidth = 1.0
        backButton.layer.borderColor = UIColor.black.cgColor
        
        sendButton.layer.cornerRadius = 10
        
    }
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func driverLicenseAddImageButtonPressed(_ sender: UIButton) {
        driverLicenseImageView.image = super.getImage()
        actionSheet()
        
        
    }
    @IBAction func sendButtonPressed(_ sender: UIButton) {
        let alert = UIAlertController(title: "Реєстрація успішна", message: "Очікуйте на дзвінок від адмістрітора служби \(Singelton.shared.service)", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Закрити", style: .cancel, handler: { (handler) in
            
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    //MARK: - Add pfoto functions
    
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
        driverLicenseImageView.image = super.getImage()
        
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

