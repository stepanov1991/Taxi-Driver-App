//
//  Registration2ViewController.swift
//  Taxi Driver App
//
//  Created by user on 08.05.2021.
//

import UIKit
import MobileCoreServices

class Registration2ViewController: PhotoViewController {
    
    
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    
    @IBOutlet weak var carPhotoTableView: UITableView!
    
    
    let titleArray = ["Спереду", "Ззаду" ,"Збоку" ,"В салоні"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        carPhotoTableView.dataSource = self
        carPhotoTableView.delegate = self
        
        carPhotoTableView.register(UINib(nibName: "photoCell", bundle: nil), forCellReuseIdentifier: "PhotoCell")
        
        backButton.layer.cornerRadius = 10
        backButton.layer.borderWidth = 1.0
        backButton.layer.borderColor = UIColor.black.cgColor
        nextButton.layer.cornerRadius = 10
        
        navigationItem.backButtonTitle = ""
       
        // Do any additional setup after loading the view.
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
extension Registration2ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titleArray.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PhotoCell", for: indexPath) as! photoCell
        cell.titleLabel.text = titleArray[indexPath.row]
//        cell.photoImage.image = super.image
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        actionSheet()
      
    }
    
    
}
