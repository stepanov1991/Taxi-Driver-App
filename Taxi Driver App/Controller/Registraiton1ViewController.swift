//
//  Registraiton1ViewController.swift
//  Taxi Driver App
//
//  Created by user on 08.05.2021.
//

import UIKit
import MobileCoreServices
import DropDown
import AVFoundation

class Registraiton1ViewController: UIViewController {
    

    

    @IBOutlet weak var cityTitleDropDown: UILabel!
    @IBOutlet weak var cityViewDropDown: UIView!
    
    @IBOutlet weak var serviceTitleDropDown: UILabel!
    @IBOutlet weak var serviceViewDropDown: UIView!
    
    @IBOutlet weak var profilFotoImage: UIImageView!
    @IBOutlet weak var nextButton: UIButton!
    
    var cityList = ["Київ", "Хмельницький", "Одеса", "Львів", "Харків"]
    var serviceList = ["549","6565","2299","700900"]
    
    let cityDropDown = DropDown()
    let serviceDropDown = DropDown()
    
    
    override func viewWillAppear(_ animated: Bool) {
       
     let backBarButton = UIImage(named: "back")
        self.navigationController?.navigationBar.backIndicatorImage = backBarButton
        self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = backBarButton
        self.title = "Реєстрація"

        
        // make circle image
        profilFotoImage.layer.masksToBounds = false
        profilFotoImage.layer.cornerRadius = profilFotoImage.frame.height/2
        profilFotoImage.clipsToBounds = true
        
        nextButton.layer.cornerRadius = 10
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        cityTitleDropDown.text = "Виберіть місто"
        cityDropDown.anchorView = cityViewDropDown
        cityDropDown.dataSource = cityList
        cityDropDown.bottomOffset = CGPoint(x: 0, y:(cityDropDown.anchorView?.plainView.bounds.height)!)
        cityDropDown.topOffset = CGPoint(x: 0, y:-(cityDropDown.anchorView?.plainView.bounds.height)!)
        cityDropDown.selectionAction = { [unowned self] (index: Int, item: String) in
            self.cityTitleDropDown.text = cityList[index]
          
            
        }
        
        serviceTitleDropDown.text = "Виберіть службу"
        serviceDropDown.anchorView = serviceViewDropDown
        serviceDropDown.dataSource = serviceList
        serviceDropDown.bottomOffset = CGPoint(x: 0, y:(serviceDropDown.anchorView?.plainView.bounds.height)!)
        serviceDropDown.topOffset = CGPoint(x: 0, y:-(serviceDropDown.anchorView?.plainView.bounds.height)!)
        serviceDropDown.selectionAction = { [unowned self] (index: Int, item: String) in
            self.serviceTitleDropDown.text = serviceList[index]
            
        }
        
     
     
        // Do any additional setup after loading the view.
    }
    override func viewWillDisappear(_ animated: Bool) {
        self.title = ""
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
    
    
    
    @IBAction func cityDropDownButtonPressed(_ sender: UIButton) {
        cityDropDown.show()
    }
    @IBAction func serviceDropDownButtonPressed(_ sender: UIButton) {
        serviceDropDown.show()
    }
    @IBAction func choseImageButtonPressed(_ sender: UIButton) {
        actionSheet()
       
      
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension Registraiton1ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        let data = convertFromUIImagetoDict(info)
        if let editingImage = data[convertInfoKey((UIImagePickerController.InfoKey.editedImage))] as? UIImage {
            self.profilFotoImage.image = editingImage
        }
       self.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func convertFromUIImagetoDict(_ input: [UIImagePickerController.InfoKey : Any]) -> [String : Any] {
        return Dictionary(uniqueKeysWithValues: input.map({ key, value in (key.rawValue,value)}))
    }
    
    func convertInfoKey(_ input: UIImagePickerController.InfoKey) -> String {
        return input.rawValue
    }
}
