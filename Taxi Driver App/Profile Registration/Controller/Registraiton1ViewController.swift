//
//  Registraiton1ViewController.swift
//  Taxi Driver App
//
//  Created by user on 08.05.2021.
//

import UIKit
import MobileCoreServices
import AVFoundation

@available(iOS 13.0, *)
class Registraiton1ViewController: UIViewController {
    
    @IBOutlet weak var cityesPickerView: UIPickerView!
    @IBOutlet weak var servicesPickerView: UIPickerView!
    @IBOutlet weak var servieDropDownTextField: UITextField!
    @IBOutlet weak var cityDropDownTextField: UITextField!
    
    @IBOutlet weak var profilFotoImage: UIImageView!
    
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var choseImageButton: UIButton!
    
    @IBOutlet weak var fullNameTextField: UITextField!
    @IBOutlet weak var telophoneTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    
    
    let cityList = ["Київ", "Хмельницький", "Одеса", "Львів", "Харків"]
    let serviceList = ["549","6565","2299","700900"]
    
    static var service = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fullNameTextField.delegate = self
        telophoneTextField.delegate = self
        emailTextField.delegate = self
        servieDropDownTextField.delegate = self
        cityDropDownTextField.delegate = self
        
        cityesPickerView.delegate = self
        cityesPickerView.dataSource = self
        servicesPickerView.delegate = self
        servicesPickerView.dataSource = self
        
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
    
    override func viewWillDisappear(_ animated: Bool) {
        self.title = ""
        guard let service = servieDropDownTextField.text else {
            return
        }
        Singelton.shared.service = service
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
//MARK: - PickerView DataSorce and Delegate Methods

@available(iOS 13.0, *)
extension Registraiton1ViewController : UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == servicesPickerView {
            return self.serviceList.count
        }
        else {
            
            return self.cityList.count
        }
        
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == cityesPickerView {
            self.view.endEditing(true)
            return self.cityList[row]
        }
        else {
            self.view.endEditing(true)
            return self.serviceList[row]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        if pickerView == cityesPickerView {
            self.cityDropDownTextField.text = self.cityList[row]
            self.cityesPickerView.isHidden = true
        }
        else {
            self.servieDropDownTextField.text = self.serviceList[row]
            self.servicesPickerView.isHidden = true
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        
        let pickerLabel = UILabel()
        pickerLabel.textColor = .black
        pickerLabel.font = UIFont.systemFont(ofSize: 20.0)
        pickerLabel.textAlignment = .center
        if pickerView == cityesPickerView {
            pickerLabel.text = cityList[row]
        }
        else {
            pickerLabel.text = serviceList[row]
        }
        
        return pickerLabel
    }
    
}
//MARK: -  TextFieldDelegate Metods

@available(iOS 13.0, *)
extension Registraiton1ViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        fullNameTextField.resignFirstResponder()
        telophoneTextField.resignFirstResponder()
        emailTextField.resignFirstResponder()
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == cityDropDownTextField {
            self.cityesPickerView.isHidden = false
            textField.endEditing(true)
        }
        if textField == servieDropDownTextField {
            self.servicesPickerView.isHidden = false
            textField.endEditing(true)
        }
    }
}

