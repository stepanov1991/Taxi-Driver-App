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
    
    @IBOutlet weak var brandDropDownTextField: UITextField!
    @IBOutlet weak var pickerView: UIPickerView!
    
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    
    
    let brandCarList = ["Lanos", "BMW", "Skoda", "Lada", "Volkswagen", "Mercedes-Benz"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pickerView.delegate = self
        brandDropDownTextField.delegate = self
        
        backButton.layer.cornerRadius = 10
        backButton.layer.borderWidth = 1.0
        backButton.layer.borderColor = UIColor.black.cgColor
        nextButton.layer.cornerRadius = 10
        
        navigationItem.backButtonTitle = ""
        
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
//MARK: - PickerVIew Delegate and DataSorce methods

extension Registration2ViewController : UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return brandCarList.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        self.view.endEditing(true)
        return brandCarList[row]
        
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        brandDropDownTextField.text = brandCarList[row]
        pickerView.isHidden = true
        
    }
    
    
}

extension Registration2ViewController : UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == brandDropDownTextField {
            textField.endEditing(true)
            pickerView.isHidden = false
        }
    }
}

