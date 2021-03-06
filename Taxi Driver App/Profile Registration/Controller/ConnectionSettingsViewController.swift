//
//  ConnectionSettingsViewController.swift
//  Taxi Driver App
//
//  Created by user on 01.06.2021.
//

import UIKit

class ConnectionSettingsViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var portTextField: UITextField!
    @IBOutlet weak var adressTextField: UITextField!
    @IBOutlet weak var idsNameTextfield: UITextField!
    @IBOutlet weak var saveSettingsButton: UIButton!
    @IBOutlet weak var getSettingsButton: UIButton!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.setHidesBackButton(true, animated: true)
        
        saveSettingsButton.layer.cornerRadius = 10
        getSettingsButton.layer.cornerRadius = 10
        
        idsNameTextfield.delegate = self
        portTextField.delegate = self
        adressTextField.delegate = self
        
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
        _ = self.navigationController?.popToRootViewController(animated: true)
    }
    @IBAction func getSettingsButtonPressed(_ sender: UIButton) {
        adressTextField.text = "192.168.0.1"
        portTextField.text = "3131"
        
        if !portTextField.isEmpty, !adressTextField.isEmpty {
            saveSettingsButton.layer.backgroundColor = UIColor.cyan.cgColor
            saveSettingsButton.setTitleColor(.white, for: .normal)
            saveSettingsButton.isEnabled = true
        }
        else {
            saveSettingsButton.layer.backgroundColor = UIColor.white.cgColor
            saveSettingsButton.setTitleColor(.black, for: .normal)
            saveSettingsButton.isEnabled = false
        }
    }
    
    //MARK: - Text Field Delegate Methods
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        portTextField.resignFirstResponder()
        idsNameTextfield.resignFirstResponder()
        adressTextField.resignFirstResponder()
        return true
    }
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        
        
        if !portTextField.isEmpty, !adressTextField.isEmpty {
            saveSettingsButton.layer.backgroundColor = UIColor.cyan.cgColor
            saveSettingsButton.setTitleColor(.white, for: .normal)
            saveSettingsButton.isEnabled = true
        }
        else {
            saveSettingsButton.layer.backgroundColor = UIColor.white.cgColor
            saveSettingsButton.setTitleColor(.black, for: .normal)
            saveSettingsButton.isEnabled = false
        }
    }
    
    
}
extension UITextField {
    
    var isEmpty: Bool {
        return text?.isEmpty ?? true
    }
    
}
