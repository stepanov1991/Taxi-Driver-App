//
//  LoginViewController.swift
//  Taxi Driver App
//
//  Created by user on 01.05.2021.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {
    
    
    
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var checkBox: UIButton!{
        didSet{
            checkBox.setImage(UIImage(named: "unchecked"), for: .normal)
            checkBox.setImage(UIImage(named: "checked"), for: .selected)
        }
    }
    var rememberCheckBox = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: true)
        
        self.passwordTextField.delegate = self
        self.loginTextField.delegate = self
        
        rememberCheckBox = UserDefaults.standard.bool(forKey: "REMEMBER_USER")
        checkBox.isSelected = rememberCheckBox
        if rememberCheckBox {
            let password = UserDefaults.standard.string(forKey: "USER_PASSWORD")
            passwordTextField.text = password
            let login  = UserDefaults.standard.string(forKey: "USER_LOGIN")
            loginTextField.text = login
            
          
        }
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func showPasswordButtonPressed(_ sender: Any) {
        passwordTextField.isSecureTextEntry = !passwordTextField.isSecureTextEntry
    }
    @IBAction func checkBoxPressed(_ sender: UIButton) {
        rememberCheckBox = !rememberCheckBox
        UserDefaults.standard.set(rememberCheckBox, forKey: "REMEMBER_USER")
        sender.checkBoxAnimation {
            print("I'm done")
            if self.rememberCheckBox {
                let pass = self.passwordTextField.text
                UserDefaults.standard.set(pass, forKey: "USER_PASSWORD")
                let log = self.loginTextField.text
                UserDefaults.standard.set(log, forKey: "USER_LOGIN")
                                
            }
            
            else {
                UserDefaults.standard.removeObject(forKey: "USER_PASSWORD")
                UserDefaults.standard.removeObject(forKey: "USER_LOGIN")
            }
            //here you can also track the Checked, UnChecked state with sender.isSelected
            print(sender.isSelected)
        }
    }
    @IBAction func backButtonPressed(_ sender: UIButton) {
        _ = self.navigationController?.popToRootViewController(animated: true)
    }
    
    //MARK: - TextField Delegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        passwordTextField.resignFirstResponder()
        loginTextField.resignFirstResponder()
        return true
        
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        let pass = passwordTextField.text
        UserDefaults.standard.set(pass, forKey: "USER_PASSWORD")
        let log = loginTextField.text
        UserDefaults.standard.set(log, forKey: "USER_LOGIN")
    }
}
extension UIButton {
    func checkBoxAnimation(closure: @escaping () -> Void)  {
        guard let image = self.imageView else {return}
        
        UIView.animate(withDuration: 0.1, delay: 0.1, options: .curveLinear) {
            image.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
        } completion: { success in
            UIView.animate(withDuration: 0.1, delay: 0, options: .curveLinear, animations: {
                self.isSelected = !self.isSelected
                closure()
                image.transform = .identity
            }, completion: nil)
            
        }
        
    }
    
    
}


