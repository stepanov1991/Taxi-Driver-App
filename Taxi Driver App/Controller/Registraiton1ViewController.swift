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

@available(iOS 13.0, *)
class Registraiton1ViewController: UIViewController, UITextFieldDelegate {
    
    
    
    
    @IBOutlet weak var cityTitleDropDown: UILabel!
    @IBOutlet weak var cityViewDropDown: UIView!
    
    @IBOutlet weak var serviceTitleDropDown: UILabel!
    @IBOutlet weak var serviceViewDropDown: UIView!
    
    @IBOutlet weak var profilFotoImage: UIImageView!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var choseImageButton: UIButton!
    
    @IBOutlet weak var fullNameTextField: UITextField!
    @IBOutlet weak var telophoneTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    
    
    let cityList = ["Київ", "Хмельницький", "Одеса", "Львів", "Харків"]
    let serviceList = ["549","6565","2299","700900"]
    
    let cityDropDown = DropDownManager()
    let serviceDropDownManager = DropDownManager()
    
    static var service = ""
    
    override func viewWillAppear(_ animated: Bool) {
        
        let backBarButton = UIImage(named: "back")
        self.navigationController?.navigationBar.backIndicatorImage = backBarButton
        self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = backBarButton
        self.title = "Реєстрація"
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.cyan]
        
        
        // make circle image
        profilFotoImage.layer.masksToBounds = false
        profilFotoImage.layer.cornerRadius = profilFotoImage.frame.height/2
        profilFotoImage.clipsToBounds = true
        choseImageButton.layer.cornerRadius = choseImageButton.frame.height/2
        
        nextButton.layer.cornerRadius = 10
        
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.fullNameTextField.delegate = self
        self.telophoneTextField.delegate = self
        self.emailTextField.delegate = self
        
        
        cityTitleDropDown.text = "Виберіть місто"
        cityDropDown.addDropDown(textDropDown: cityTitleDropDown, viewDropDown: cityViewDropDown, listDropDown: cityList)
        
        serviceTitleDropDown.text = "Виберіть службу"
        serviceDropDownManager.addDropDown(textDropDown: serviceTitleDropDown, viewDropDown: serviceViewDropDown, listDropDown: serviceList)
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.title = ""
        guard let service = serviceTitleDropDown.text else {
            return
        }
        Singelton.shared.service = service
    }
    
    
    //MARK: - TableView Delegate Methods
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        fullNameTextField.resignFirstResponder()
        telophoneTextField.resignFirstResponder()
        emailTextField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
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
    
    //MARK: - Actions
    
    @IBAction func cityDropDownButtonPressed(_ sender: UIButton) {
        cityDropDown.dropDown.show()
    }
    @IBAction func serviceDropDownButtonPressed(_ sender: UIButton) {
        serviceDropDownManager.dropDown.show()
        
        
    }
    @IBAction func choseImageButtonPressed(_ sender: UIButton) {
        actionSheet()
        
        
    }
    
    
    
    //MARK: - UIImagePickerControllerDelegate, UINavigationControllerDelegate
}
@available(iOS 13.0, *)
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

